package com.wddwzl.servlet;
import aHigh_Sole.HighSole;
import aSole_TopogyThickness.TopogyThickness;
import com.mathworks.toolbox.javabuilder.MWException;
import com.mathworks.toolbox.javabuilder.MWNumericArray;
import com.wddwzl.pojo.User;
import com.wddwzl.service.user.UserService;
import com.wddwzl.service.user.UserServiceImpl;
import com.wddwzl.util.Constants;
import com.wddwzl.util.CopyFile;
import us.hebi.matlab.mat.format.Mat5;
import us.hebi.matlab.mat.format.Mat5File;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

public class optimization_Pad extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        double weight = 0;
        double sVolume = 0;

        User u;
        String userCode;
        try{
            u = (User) req.getSession().getAttribute(Constants.USER_SESSION);
            if(u!=null) {
                System.out.println(u);
                userCode = u.getUserCode();
            }else{
                System.out.println("用户session不存在");
                //matric = new double[]{226, 237, 223, 232, 226};
//                userCode = "2243234915@qq.com";
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

        if(user!=null){
            System.out.println("获取用户体重信息成功");
            //heel,arch,left_forefoot,right_forefoot,heeledge
            weight = user.getWeight();
        }else{
            System.out.println("获取用户体重信息失败");
            weight = 60;
        }

        try {
            String Input_sVolume = req.getParameter("sVolume");
            System.out.println(Input_sVolume);
            sVolume = Double.parseDouble(Input_sVolume);
            System.out.println(sVolume);

        } catch (NumberFormatException e) {
            System.out.println("传入sVolume参数错误");
        }

        //导入文件，转为数组
       String filePath = this.getServletContext().getRealPath("/WEB-INF/classes/sole_v3.1_SDF30_3.mat");
        Mat5File file = Mat5.readFromFile(filePath);

        Double[] modelSDF = new Double[file.getMatrix("modelSDF").getNumRows()];
        for (int i = 0; i < file.getMatrix("modelSDF").getNumRows(); i++) {
            modelSDF[i] = file.getMatrix("modelSDF").getDouble(i);
        }
        filePath = this.getServletContext().getRealPath("/WEB-INF/classes/sole_v3.1_SDF120_3.mat");
        file = Mat5.readFromFile(filePath);
        Double[] modelSDF_high = new Double[file.getMatrix("modelSDF").getNumRows()];
        for (int i = 0; i < file.getMatrix("modelSDF").getNumRows(); i++) {
            modelSDF_high[i] = file.getMatrix("modelSDF").getDouble(i);
        }

        filePath = this.getServletContext().getRealPath("/WEB-INF/classes/Fs_faces.mat");
        file = Mat5.readFromFile(filePath);

        Double[][] Fs_faces = new Double[file.getMatrix("Fs_faces").getNumRows()][file.getMatrix("Fs_faces").getNumCols()];

        for (int i = 0; i < file.getMatrix("Fs_faces").getNumRows(); i++) {
            for (int j = 0; j < file.getMatrix("Fs_faces").getNumCols(); j++)
                Fs_faces[i][j] = file.getMatrix("Fs_faces").getDouble(i, j);
        }

        filePath = this.getServletContext().getRealPath("/WEB-INF/classes/Fs_vertices.mat");
        file = Mat5.readFromFile(filePath);
        Double[][] Fs_vertices = new Double[file.getMatrix("Fs_vertices").getNumRows()][file.getMatrix("Fs_vertices").getNumCols()];
        for (int i = 0; i < file.getMatrix("Fs_vertices").getNumRows(); i++) {
            for (int j = 0; j < file.getMatrix("Fs_vertices").getNumCols(); j++)
                Fs_vertices[i][j] = file.getMatrix("Fs_vertices").getDouble(i, j);
        }

        filePath = this.getServletContext().getRealPath("/WEB-INF/classes/Fv_faces.mat");
        file = Mat5.readFromFile(filePath);
        Double[][] Fv_faces = new Double[file.getMatrix("Fv_faces").getNumRows()][file.getMatrix("Fv_faces").getNumCols()];
        for (int i = 0; i < file.getMatrix("Fv_faces").getNumRows(); i++) {
            for (int j = 0; j < file.getMatrix("Fv_faces").getNumCols(); j++)
                Fv_faces[i][j] = file.getMatrix("Fv_faces").getDouble(i, j);
        }

        filePath = this.getServletContext().getRealPath("/WEB-INF/classes/Fv_vertices.mat");
        file = Mat5.readFromFile(filePath);
        Double[][] Fv_vertices = new Double[file.getMatrix("Fv_vertices").getNumRows()][file.getMatrix("Fv_vertices").getNumCols()];
        for (int i = 0; i < file.getMatrix("Fv_vertices").getNumRows(); i++) {
            for (int j = 0; j < file.getMatrix("Fv_vertices").getNumCols(); j++)
                Fv_vertices[i][j] = file.getMatrix("Fv_vertices").getDouble(i, j);
        }

        filePath = this.getServletContext().getRealPath("/WEB-INF/classes/bdInfo_FixedPos.mat");
        file = Mat5.readFromFile(filePath);

        Double[][] bdInfo_FixedPos = new Double[file.getMatrix("bdInfo_FixedPos").getNumRows()][file.getMatrix("bdInfo_FixedPos").getNumCols()];

        for (int i = 0; i < file.getMatrix("bdInfo_FixedPos").getNumRows(); i++) {
            for (int j = 0; j < file.getMatrix("bdInfo_FixedPos").getNumCols(); j++)
                bdInfo_FixedPos[i][j] = file.getMatrix("bdInfo_FixedPos").getDouble(i, j);
        }

        filePath = this.getServletContext().getRealPath("/WEB-INF/classes/bdInfo_LoadPos.mat");
        file = Mat5.readFromFile(filePath);
        Double[][] bdInfo_LoadPos = new Double[file.getMatrix("bdInfo_LoadPos").getNumRows()][file.getMatrix("bdInfo_LoadPos").getNumCols()];
        for (int i = 0; i < file.getMatrix("bdInfo_LoadPos").getNumRows(); i++) {
            for (int j = 0; j < file.getMatrix("bdInfo_LoadPos").getNumCols(); j++)
                bdInfo_LoadPos[i][j] = file.getMatrix("bdInfo_LoadPos").getDouble(i, j);
        }
        System.out.println("准备工作完成，开始拓扑优化");
//        try {
//
//            TopogyThickness t1 = new TopogyThickness();
//
//            MWNumericArray m = new MWNumericArray(modelSDF);
//            MWNumericArray m_h = new MWNumericArray(modelSDF_high);
//            MWNumericArray Fs_f = new MWNumericArray(Fs_faces);
//            MWNumericArray Fs_v = new MWNumericArray(Fs_vertices);
//            MWNumericArray Fv_f = new MWNumericArray(Fv_faces);
//            MWNumericArray Fv_v = new MWNumericArray(Fv_vertices);
//            MWNumericArray b_f = new MWNumericArray(bdInfo_FixedPos);
//            MWNumericArray b_l = new MWNumericArray(bdInfo_LoadPos);
//            MWNumericArray Weight = new MWNumericArray(weight);
//            MWNumericArray SVolume = new MWNumericArray(sVolume);
//
//            t1.aSole_TopogyThickness(1, Weight, SVolume, Fs_v, Fs_f, Fv_v, Fv_f, m, b_l, b_f, 500);
//            System.out.println("完成50%");
//
//            filePath = (new File("TestRecord/sole/sole_version/optiCDis.mat")).getAbsolutePath();
//            file = Mat5.readFromFile(filePath);
//            Double[] optiCDis = new Double[file.getMatrix(0).getNumRows()];
//            for (int i = 0; i < file.getMatrix(0).getNumRows(); i++) {
//                optiCDis[i] = file.getMatrix(0).getDouble(i);
//            }
//
//            filePath = (new File("TestRecord/sole/sole_version/optiTDis.mat")).getAbsolutePath();
//            file = Mat5.readFromFile(filePath);
//            Double[] optiTDis = new Double[file.getMatrix(0).getNumRows()];
//            for (int i = 0; i < file.getMatrix(0).getNumRows(); i++) {
//                optiTDis[i] = file.getMatrix(0).getDouble(i);
//            }
//
//            MWNumericArray optiCDis1 = new MWNumericArray(optiCDis);
//            MWNumericArray optiTDis1 = new MWNumericArray(optiTDis);
//            HighSole hs1 = new HighSole();
//
//            double c = 120.0;
//            MWNumericArray c1 = new MWNumericArray(c);
//
//            hs1.aHigh_Sole(1, Fs_v, m, c1, m_h, optiCDis1, optiTDis1);
//            System.out.println("拓扑优化完成");
//        } catch (MWException e) {
//            e.printStackTrace();
//        }
        CopyFile c1 = new CopyFile();
        String ModelPath = (new File("TestRecord/sole/sole_version/(_version_)H_G.stl")).getAbsolutePath();
        String copyPath = this.getServletContext().getRealPath("userResource/"+user.getUserCode()+"/model/(_version_)H_G.stl");
        File UserDir = new File(this.getServletContext().getRealPath("userResource/"+user.getUserCode()+"/model/"));
        UserDir.mkdirs();
        c1.copyFile(ModelPath,copyPath);
        System.out.println("文件已转移至用户文件夹");
//        req.getRequestDispatcher("/2OS/
        resp.sendRedirect("/2OS/ffd_pad");
   }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
