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

public class EditUserInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserService userService = new UserServiceImpl();
        User user = (User)req.getSession().getAttribute(Constants.USER_SESSION);

        String phone = req.getParameter("phone");
        if(req.getParameter("phone").length()==0)
            phone = user.getPhone();
        String password = req.getParameter("password");
        if(req.getParameter("password").length()==0)
            password = user.getUserPassword();

        try {
            userService.EditUserInfo(user.getUserCode(), phone, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        User u1 = (User) req.getSession().getAttribute(Constants.USER_SESSION);
        u1.setPhone(phone);
        u1.setUserPassword(password);
        req.getSession().setAttribute(Constants.USER_SESSION,u1);

        String s = "jsp/personalCenter.jsp";
        req.setAttribute("UserCode",u1.getUserCode());
        req.setAttribute("Phone",u1.getPhone());
        req.setAttribute("Gender",u1.getGender());
        req.setAttribute("Age",u1.getAge());
        req.setAttribute("Height",u1.getHeight());
        req.setAttribute("Weight",u1.getWeight());
        req.setAttribute("SoleSize",u1.getSoleSize());
        //转发回登录页面
        //resp.sendRedirect(s);
        req.getRequestDispatcher(s).forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
