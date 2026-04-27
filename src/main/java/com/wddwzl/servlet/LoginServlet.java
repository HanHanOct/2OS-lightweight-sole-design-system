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

public class LoginServlet extends HttpServlet {

    //在这里调用业务层代码
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //通过请求获取前端传过来的用户名和密码
        String userCode = req.getParameter("userCode");
        String userPassword = req.getParameter("userPassword");
//        System.out.println(userCode);
//        System.out.println(userPassword);
        //调用login业务,创建当前登录用户的user对象
        //如果能找到将用户信息放在session中，跳转到主页
        //如果找不到，user为null,转发回登录页面,提示用户名或密码错误
        UserService userService = new UserServiceImpl();
        User user = null;
        try {
            user = userService.login(userCode, userPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(user!=null){
            //可以登录
            //将用户信息放在session中
            req.getSession().setAttribute(Constants.USER_SESSION,user);
            //跳转到主页
            resp.sendRedirect("jsp/frame.jsp");
        }else{
            //无法登录
            //提示用户名或密码错误
            req.setAttribute("error","邮箱或密码错误");
            //转发回登录页面
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);//这波直接偷懒让他走doGet
    }
}
