package com.wddwzl.servlet;

import com.wddwzl.pojo.User;
import com.wddwzl.service.user.UserService;
import com.wddwzl.service.user.UserServiceImpl;
import com.wddwzl.util.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class EditServlet_mm_pad extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        String Gender = req.getParameter("Gender");
//        int Height = Integer.parseInt(req.getParameter("Height"));
//        int ShoeSize = Integer.parseInt(req.getParameter("ShoeSize"));
//        int Age = Integer.parseInt(req.getParameter("Age"));
//        String TelephoneNum = req.getParameter("TelephoneNum");
//        int Weight = Integer.parseInt(req.getParameter("Weight"));
//        int Require = Integer.parseInt(req.getParameter("Require"));

        UserService userService = new UserServiceImpl();
        User user = (User)req.getSession().getAttribute(Constants.USER_SESSION);

        double soleLength;
        if(req.getParameter("soleLength").length()==0){
            soleLength = user.getSoleLength();
        }else {
            soleLength = Double.parseDouble(req.getParameter("soleLength"));
        }

        double soleWidth;
        if(req.getParameter("soleWidth").length()==0){
            soleWidth = user.getSoleWidth();
        }else {
            soleWidth = Double.parseDouble(req.getParameter("soleWidth"));
        }

        double Heel;
        if(req.getParameter("Heel").length()==0){
            Heel = user.getHeel();
        }else {
            Heel = Double.parseDouble(req.getParameter("Heel"));
        }

        double Arch;
        if(req.getParameter("Arch").length()==0){
            Arch = user.getArch();
        }else{
            Arch = Double.parseDouble(req.getParameter("Arch"));
        }

        double LeftForefoot;
        if(req.getParameter("LeftForefoot").length()==0){
            LeftForefoot = user.getLeftForefoot();
        }else {
            LeftForefoot = Double.parseDouble(req.getParameter("LeftForefoot"));
        }

        double RightForefoot;
        if(req.getParameter("RightForefoot").length()==0){
            RightForefoot = user.getRightForefoot();
        }else{
            RightForefoot = Double.parseDouble(req.getParameter("RightForefoot"));
        }

        double HeelEdge;
        if(req.getParameter("HeelEdge").length()==0){
            HeelEdge = user.getHeelEdge();
        }else {
            HeelEdge = Double.parseDouble(req.getParameter("HeelEdge"));
        }


        try {
            userService.EditLoginUser2(user.getUserCode(), soleLength, soleWidth,Heel, Arch, LeftForefoot, RightForefoot, HeelEdge);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        User u1 = (User) req.getSession().getAttribute(Constants.USER_SESSION);
        u1.setSoleLength((int) soleLength);
        u1.setSoleLength((int) soleWidth);
        u1.setHeel((int) Heel);
        u1.setArch((int) Arch);
        u1.setLeftForefoot((int) LeftForefoot);
        u1.setRightForefoot((int) RightForefoot);
        u1.setHeelEdge((int) HeelEdge);

        req.getSession().setAttribute(Constants.USER_SESSION,u1);

        String s = "jsp/3dShoePad.jsp";
        req.setAttribute("ShoeSize",u1.getSoleSize());
        req.setAttribute("Heel",Heel);
        req.setAttribute("Arch",Arch);
        req.setAttribute("LeftForefoot",LeftForefoot);
        req.setAttribute("RightForefoot",RightForefoot);
        req.setAttribute("HeelEdge",HeelEdge);
        if(u1.getWeight()!=null){
            req.setAttribute("Weight", u1.getWeight());
        }else{
            req.setAttribute("Weight", 55);
        }

        //转发回登录页面
        //resp.sendRedirect(s);
        req.getRequestDispatcher(s).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
