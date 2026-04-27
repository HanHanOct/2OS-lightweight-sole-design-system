package com.wddwzl.servlet;

import com.wddwzl.pojo.User;
import com.wddwzl.service.user.UserServiceImpl;
import kong.unirest.Unirest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.junit.Test;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.*;

public class File_upload extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //判断上传的文件是普通表单还是包含文件的表单
        if(!ServletFileUpload.isMultipartContent(req)){
            return;//终止方法运行，如果不是包含文件的表单直接return
        }

        try {
            //创建上传的文件的保存路径，建议保存在web-inf下，
            //在这里用户无法直接访问上传的文件
            //获取真实路径
            String uploadPath = this.getServletContext().getRealPath("/userResource");
            //通过真实路径，创建一个文件对象
            File uploadfile = new File(uploadPath);
            //如果文件不存在
            if(!uploadfile.exists()){
                uploadfile.mkdirs();//创建一个新文件
            }

            //缓存，临时文件
            //临时文件，如果文件超出了预期的大小，
            //我们就把他放到一个临时文件中，过几天自动删除，
            //或者提醒用户转存为永久,和上面的写法相同
            String tmpPath = this.getServletContext().getRealPath("/userResource/tmp");
            File tmpfile = new File(tmpPath);
            if(!tmpfile.exists()){
                tmpfile.mkdirs();
            }

            //处理上传的文件，一般通过流来获取，可以使用request.getInputStream(),但是麻烦
            //建议使用Apache的文件上传组件实现，common-fileupload,他依赖于commons-io组件

            //1.创建DiskFileItemFactory对象，处理文件上传路径或者大小限制
            //新建工厂对象
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //可以实现的两个功能，可以不写有默认值
            //设置缓存区大小（1M）
            factory.setSizeThreshold(1024*1024);
            //设置临时目录的保存目录,需要一个file
            factory.setRepository(tmpfile);
            //2.获取SevletFileUpload
            /*
             * SevletFileUpload负责处理上传的文件数据，并将表单中的每一个输入项封装成一个FileItem对象，
             * 在使用SevletFileUpload对象解析请求时需要DiskFileItemfactory对象
             * 通过ServletFileUpload对象的构造方法或setFileItemfactory()方法设置ServletFileUpload对象的FileItemfactory属性值
             * */
            //创建SevletFileUpload对象
            ServletFileUpload upload = new ServletFileUpload(factory);
            //可以实现的四个功能，可以不写有默认值
            //监听文件上传进度
            upload.setProgressListener(new ProgressListener() {
                @Override
                //l:已经读取的文件大小
                //l1:文件大小
                public void update(long l, long l1, int i) {
                    System.out.println("总大小："+l1+"已上传："+l);
                }
            });
            //处理乱码问题,默认8859-1
            upload.setHeaderEncoding("UTF-8");
            //设置单个文件的最大值(10m)
            upload.setFileSizeMax(1024*1024*100);
            //设置总共能够上传文件的大小
            upload.setSizeMax(1024*1024*100);

            //3.处理上传文件，解析前端请求，判断表单每一项是否包含上传的文件
            //封装成一个FileItem对象

            List<FileItem> fileItems = upload.parseRequest(req);
            //可能拿到很多请求，需要进行遍历,表单中的每一个输入项都会被封装到一个fileItem中
            String userCode = null;
            for (FileItem fileItem : fileItems) {
                //判断表单每一项是否包含上传的文件
                //如果是普通表单
                if(fileItem.isFormField()){
                    //获取前端表单控件的name
                    String name = fileItem.getFieldName();
                    //处理乱码
                    String value = fileItem.getString("UTF-8");
                    userCode = value;
                    //输出
                    System.out.println(name+":"+value);
                }else{
                    //如果是文件表单，处理文件
                    //获取文件名
                    String uploadFileName = fileItem.getName();
                    System.out.println("uploadfilename = "+uploadFileName);
                    //可能存在文件名不合法的情况,如果首字母为空或者文件名为空，这个文件不要了
                    if(uploadFileName.trim().equals("")||uploadFileName==null){
                        continue;
                    }
                    //获取上传的文件名
                    String fileName = uploadFileName.substring(uploadFileName.lastIndexOf("/")+1);
                    System.out.println("filename = "+fileName);
                    //获取上传的后缀名
                    uploadFileName.substring(uploadFileName.lastIndexOf(".")+1);
                    //如果后缀名不对直接return不处理，告诉用户文件名不对
                    //可以使用UUID（唯一识别通用码），保证文件名唯一
                    //UUID.randomUUID()，随机生成一个识别的通用码

                    //网络传输中的东西都需要序列化，POJO类，如果想要在多个电脑上运行，需要传输，就要把对象都序列化
                    //所以写实体类时习惯性的把Serializable接口implements,这是一个标记接口，标记可以序列化
                    //jvm--->本地方法栈 native----->调用c++
                    //UUID通过位运算，返回一个值
//                    String uuidPath = UUID.randomUUID().toString();

                    //存放地址
                    //文件真实存在地址
//                    String realPath = uploadPath+"/"+uuidPath;
                    String realPath = uploadPath+"/"+userCode;
                    //给每个文件创建一个对应的文件夹
                    File realPathFile = new File(realPath);
                    System.out.println("realPathFile = "+realPathFile);
                    if(!realPathFile.exists()){
                        realPathFile.mkdirs();
                    }
                    //输入输出
                    //获得文件上传的流
                    InputStream inputStream = fileItem.getInputStream();
                    //创建一个文件输出流
                    //realpath是一个真实的文件夹
                    //差了一个文件；加上输出文件的名字+“/”+uuidFileName
                    FileOutputStream fos = new FileOutputStream(realPath + "/" + fileName);
                    //创建缓冲区
                    byte[] buffer = new byte[1024 * 1024];
                    //创建是否读取完毕
                    int len = 0;
                    while ((len=inputStream.read(buffer))>0){
                        fos.write(buffer,0,len);
                    }
                    fos.close();
                    inputStream.close();
                    fileItem.delete();//上传成功，删除临时文件
                }
            }
            String msg = "文件上传成功";
            System.out.println(msg);
            req.getRequestDispatcher("/success.jsp").forward(req,resp);

        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void test() throws SQLException {
//        String filePath1 = "C:\\Users\\WZL\\Desktop\\ai_res\\0.png";
//        String filePath2 = "C:\\Users\\WZL\\Desktop\\ai_res\\1.png";
//        File file1=new File(filePath1);
//        File file2=new File(filePath2);
//        File[] files = new File[2];
//        files[0] = file1;
//        files[1] = file2;
//
//        String url = "http://wddwzl.cloud:8080/smbms/upload.do" ;
//        boolean SUCCESS = true;
//
//        Map<String,Object> resultMap=new HashMap<>();
//        try {
//            kong.unirest.HttpResponse<String> response = Unirest.post(url)
//                    .header("accept", "*/*")
//                    .field("files", files[0])
//                    .field("files", files[1])
//                    .asString();
//            String	content= response.getBody().toString();
//            String	statusText= response.getStatusText();
//            String	status= String.valueOf(response.getStatus());
//            resultMap.put("content", content);
//            resultMap.put("statusText", statusText);
//            resultMap.put("status", status);
//            if(!status.equals("200")) {
//                SUCCESS=false;
//            }
//            resultMap.put("isSuc", SUCCESS);
//        }catch (Exception e) {
//            SUCCESS=false;
//            resultMap.put("isSuc", SUCCESS);
//        }
//
//        System.out.println(resultMap.toString());




        String filePath="C:\\Users\\WZL\\Desktop\\pressure.png";

//        String urlStr = "http://wddwzl.cloud:8080/smbms/upload.do";
//        String urlStr = "http://localhost:8080/2OS/upload.do";
        String urlStr = "http://optimizedshoeos.com:8080//2OS/upload.do";
        Map<String, String> textMap = new HashMap<String, String>();

        textMap.put("userCode", "2243234915@qq.com");

        Map<String, String> fileMap = new HashMap<String, String>();

        fileMap.put("file1", filePath);

        HttpURLConnection conn = null;
        String BOUNDARY = "---------------------------";
        String res;
        try {
            URL url = new URL(urlStr);
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(30000);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setRequestProperty("User-Agent",  "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
            conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

            OutputStream out = new DataOutputStream(conn.getOutputStream());
            // text
            if (textMap != null) {
                StringBuffer strBuf = new StringBuffer();
                Iterator iter = textMap.entrySet().iterator();
                while (iter.hasNext()) {
                    Map.Entry entry = (Map.Entry) iter.next();
                    String inputName = (String) entry.getKey();
                    String inputValue = (String) entry.getValue();
                    if (inputValue == null) {
                        continue;
                    }
                    strBuf.append("\r\n").append("--").append(BOUNDARY).append(
                            "\r\n");
                    strBuf.append("Content-Disposition: form-data; name=\""
                            + inputName + "\"\r\n\r\n");
                    strBuf.append(inputValue);
                }
                out.write(strBuf.toString().getBytes());
            }

            // file
            if (fileMap != null) {
                Iterator iter = fileMap.entrySet().iterator();
                while (iter.hasNext()) {
                    Map.Entry entry = (Map.Entry) iter.next();
                    String inputName = (String) entry.getKey();
                    String inputValue = (String) entry.getValue();
                    if (inputValue == null) {
                        continue;
                    }
                    File file = new File(inputValue);
                    String filename = file.getName();
                    String contentType = null;
                    if (filename.endsWith(".png")) {
                        contentType = "image/png";
                    }
                    if (contentType == null || contentType.equals("")) {
                        contentType = "application/octet-stream";
                    }

                    StringBuffer strBuf = new StringBuffer();
                    strBuf.append("\r\n").append("--").append(BOUNDARY).append(
                            "\r\n");
                    strBuf.append("Content-Disposition: form-data; name=\""
                            + inputName + "\"; filename=\"" + filename
                            + "\"\r\n");
                    strBuf.append("Content-Type:" + contentType + "\r\n\r\n");

                    out.write(strBuf.toString().getBytes());

                    DataInputStream in = new DataInputStream(
                            new FileInputStream(file));
                    int bytes = 0;
                    byte[] bufferOut = new byte[1024];
                    while ((bytes = in.read(bufferOut)) != -1) {
                        out.write(bufferOut, 0, bytes);
                    }
                    in.close();
                }
            }

            byte[] endData = ("\r\n--" + BOUNDARY + "--\r\n").getBytes();
            out.write(endData);
            out.flush();
            out.close();

            // 读取返回数据
            StringBuffer strBuf = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    conn.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                strBuf.append(line).append("\n");
            }
            res = strBuf.toString();
            reader.close();
            reader = null;
            System.out.println(res.toString());

        } catch (Exception e) {
            System.out.println("发送POST请求出错。" + urlStr);
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.disconnect();
                conn = null;
            }
        }

    }
}


