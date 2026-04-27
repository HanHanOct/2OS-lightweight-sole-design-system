package com.wddwzl.servlet;

import com.wddwzl.pojo.User;
import com.wddwzl.service.user.UserService;
import com.wddwzl.service.user.UserServiceImpl;
import com.wddwzl.util.Constants;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class EditUserFootInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int ShoeSize = Integer.parseInt(req.getParameter("ShoeSize"));
        double Heel = Double.parseDouble(req.getParameter("Heel"));
        double Arch = Double.parseDouble(req.getParameter("Arch"));
        double LeftForefoot = Double.parseDouble(req.getParameter("LeftForefoot"));
        double RightForefoot = Double.parseDouble(req.getParameter("RightForefoot"));
        double HeelEdge = Double.parseDouble(req.getParameter("HeelEdge"));
        String userName = req.getParameter("userName");

        UserService userService = new UserServiceImpl();

        try {
            userService.EditLoginUserFootInformation(userName, ShoeSize, Heel, Arch, LeftForefoot, RightForefoot, HeelEdge);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        User u1 = (User) req.getSession().getAttribute(Constants.USER_SESSION);
        if(!(u1==null)) {
            u1.setSoleSize(ShoeSize);
            u1.setHeel((int) Heel);
            u1.setArch((int) Arch);
            u1.setLeftForefoot((int) LeftForefoot);
            u1.setRightForefoot((int) RightForefoot);
            u1.setHeelEdge((int) HeelEdge);
        }

        req.getSession().setAttribute(Constants.USER_SESSION,u1);

        String s = "jsp/3dShoePad.jsp";
        req.setAttribute("ShoeSize",ShoeSize);
        req.setAttribute("Heel",Heel);
        req.setAttribute("Arch",Arch);
        req.setAttribute("LeftForefoot",LeftForefoot);
        req.setAttribute("RightForefoot",RightForefoot);
        req.setAttribute("HeelEdge",HeelEdge);
        //转发回登录页面
        //resp.sendRedirect(s);
        req.getRequestDispatcher(s).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
