package com.wddwzl.servlet;


import com.mathworks.toolbox.javabuilder.*;
import com.wddwzl.pojo.User;
import com.wddwzl.service.user.UserService;
import com.wddwzl.service.user.UserServiceImpl;
import com.wddwzl.util.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import static jdk.nashorn.internal.objects.NativeMath.max;

public class ffd_shoe_mid_sole extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User u;
        double matric[];
        String userCode;
        try{
            u = (User) req.getSession().getAttribute(Constants.USER_SESSION);
            if(u!=null) {
                System.out.println(u);
                System.out.println("获取用户session成功");
                userCode = u.getUserCode();
            }else{
                System.out.println("用户session读取失败");
                //matric = new double[]{226, 237, 223, 232, 226};
                throw new Exception();
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        UserService userService = new UserServiceImpl();
        User user = null;

        try {
            user = userService.GetFootInformation(userCode);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println(user.toString());
        double length,width = 0;
        int size = 0;
        if(user!=null){
            //heel,arch,left_forefoot,right_forefoot,heeledge
            matric = new double[]{user.getHeel(), user.getArch(), user.getLeftForefoot(), user.getRightForefoot(), user.getHeelEdge()};
//            size = user.getSoleSize();
            if(user.getSoleLength()==null||user.getSoleWidth()==null) {
                size = user.getSoleSize();
                switch(size){
                    case 35:
                    {
                        length = 22.5;
                        width = 8;
                        break;
                    }
                    case 36:
                    {
                        length = 23.0;
                        width = 8.5;
                        break;
                    }
                    case 37:
                    {
                        length = 23.5;
                        width = 9;
                        break;
                    }
                    case 38:
                    {
                        length = 24;
                        width = 9.5;
                        break;
                    }
                    case 39:
                    {
                        length = 24.5;
                        width = 10;
                        break;
                    }
                    case 40:
                    {
                        length = 25;
                        width = 10.5;
                        break;
                    }
                    case 41:
                    {
                        length = 25.5;
                        width = 11;
                        break;
                    }
                    case 42:
                    {
                        length = 26;
                        width = 11.5;
                        break;
                    }
                    case 43:
                    {
                        length = 26.5;
                        width = 12;
                        break;
                    }
                    case 44:
                    {
                        length = 27;
                        width = 12.5;
                        break;
                    }
                    default:
                    {
                        length = 24;
                        width = 9.5;
                        System.out.println("暂时不支持该尺寸"+size+"，将采用默认尺寸");
                    }
                }
                System.out.println("获取用户足部信息失败，将使用欧码进行转换");
            }else{
                length = user.getSoleLength()/10.0;
                width = user.getSoleWidth()/10.0;
                System.out.println("获取用户足部信息成功");
            }
        }else{
            System.out.println("获取用户足部信息失败，将使用默认数据");
            matric = new double[]{0, 15, 3, 5, 3};
//            size = 38;
            length = 24;
            width = 9.5;
        }
//        System.out.println(1);
        for(int i = 0;i<5;i++)
            System.out.println(matric[i]);

//        double lowest = matric[0];
//        for(int i = 0;i<matric.length;i++) {
//            if(matric[i]>lowest)
//                lowest = matric[i];
//        }
//
//        for(int i = 0;i<matric.length;i++)
//            matric[i] = 0.5*(lowest - matric[i]);
//        switch(size){
//            case 35:
//            {
//                length = 22.5;
//                width = 8;
//                break;
//            }
//            case 36:
//            {
//                length = 23.0;
//                width = 8.5;
//                break;
//            }
//            case 37:
//            {
//                length = 23.5;
//                width = 9;
//                break;
//            }
//            case 38:
//            {
//                length = 24;
//                width = 9.5;
//                break;
//            }
//            case 39:
//            {
//                length = 24.5;
//                width = 10;
//                break;
//            }
//            case 40:
//            {
//                length = 25;
//                width = 10.5;
//                break;
//            }
//            case 41:
//            {
//                length = 25.5;
//                width = 11;
//                break;
//            }
//            case 42:
//            {
//                length = 26;
//                width = 11.5;
//                break;
//            }
//            case 43:
//            {
//                length = 26.5;
//                width = 12;
//                break;
//            }
//            case 44:
//            {
//                length = 27;
//                width = 12.5;
//                break;
//            }
//            default:
//            {
//                length = 24;
//                width = 9.5;
//                System.out.println("暂时不支持该尺寸"+size+"，将采用默认尺寸");
//            }
//        }

        String modelPath = this.getServletContext().getRealPath("userResource/"+user.getUserCode()+"/model/(_version_)H_G.stl");
        String filePath = this.getServletContext().getRealPath("userResource/"+user.getUserCode()+"/model/");
        System.out.println("准备完成，开始变形");

        try {
//            FFD.ffd f1 = new FFD.ffd();
//            soleFFD.sole_ffd f2 = new soleFFD.sole_ffd();
            ShoeMidSoleFFD.shoe_mid_sole_ffd f3 = new ShoeMidSoleFFD.shoe_mid_sole_ffd();
//            MWNumericArray m1 = new MWNumericArray(user.getHeel());
//            MWNumericArray m2 = new MWNumericArray(user.getArch());
//            MWNumericArray m3 = new MWNumericArray(user.getLeftForefoot());
//            MWNumericArray m4 = new MWNumericArray(user.getRightForefoot());
//            MWNumericArray m5 = new MWNumericArray(user.getHeelEdge());
            MWNumericArray m1 = new MWNumericArray(matric[0]);
            MWNumericArray m2 = new MWNumericArray(matric[1]);
            MWNumericArray m3 = new MWNumericArray(matric[2]);
            MWNumericArray m4 = new MWNumericArray(matric[3]);
            MWNumericArray m5 = new MWNumericArray(matric[4]);
            MWNumericArray L = new MWNumericArray(length);
            MWNumericArray W = new MWNumericArray(width);
            f3.FFD(modelPath,m1,m2,m3,m4,m5,L,W,filePath);
            System.out.println("变形完成");
        } catch (MWException e) {
            throw new RuntimeException(e);
        }

//        CopyFile c1 = new CopyFile();
//        String filePath2 = (new File("test_out.stl")).getAbsolutePath();
//        System.out.println(filePath2);
//        String copyPath = this.getServletContext().getRealPath("WEB-INF/"+u.getUserCode()+"/model/test_out.stl");
//        c1.copyFile(filePath2,copyPath);

//        copyPath = (new File("TestRecord/sole/sole_version/test_out.stl")).getAbsolutePath();
//        filePath = this.getServletContext().getRealPath("/model/test_out.stl");
//        c1.copyFile(filePath,copyPath);
//        System.out.println("完成");
//        resp.sendRedirect("/smbms/jsp/shoemidshoe_model.jsp");

        try {
            String fileName = this.getServletContext().getRealPath("userResource/"+user.getUserCode()+"/model/outShoemidsole");
            System.out.println("fileName:"+fileName);
            String batPath = this.getServletContext().getRealPath("js/mesh_transform/cmd.bat");
//            batPath = "C:\\bat\\mesh_transform\\cmd.bat";
            System.out.println("batPath:"+batPath);
            String jsPath = this.getServletContext().getRealPath("js/mesh_transform/");
//            jsPath = "C:\\bat\\mesh_transform\\";
            System.out.println("jsPath:"+jsPath);
            Process exec = Runtime.getRuntime().exec("cmd /c "+batPath + ' '+ fileName + ' ' +jsPath);
            int i = exec.waitFor();
            System.out.println(i);
            exec.destroy();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("ffd结束");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
