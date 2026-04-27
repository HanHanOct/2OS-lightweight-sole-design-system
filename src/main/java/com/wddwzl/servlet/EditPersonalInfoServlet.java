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

public class EditPersonalInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserService userService = new UserServiceImpl();
        User user = (User)req.getSession().getAttribute(Constants.USER_SESSION);

        String gender = req.getParameter("sex");
        if(req.getParameter("sex").length()==0)
            gender = user.getGender();

        Integer age;
        if(req.getParameter("age").length()==0){
            age = user.getAge();
        }else{
            age = Integer.parseInt(req.getParameter("age"));
        }

        Integer height;
        if(req.getParameter("height").length()==0){
            height = user.getHeight();
        }else {
            height = Integer.parseInt(req.getParameter("height"));
        }

        double soleSize;
        if(req.getParameter("soleSize").length()==0){
            soleSize = user.getSoleSize();
        }else {
            soleSize = Double.parseDouble(req.getParameter("soleSize"));
        }

        double weight;
        if(req.getParameter("weight").length()==0){
            weight = user.getWeight();
        }else {
            weight = Double.parseDouble(req.getParameter("weight"));
        }


        try {
            userService.EditPersonalInfo(user.getUserCode(), gender, age, height, (int)soleSize, (int)weight);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        User u1 = (User) req.getSession().getAttribute(Constants.USER_SESSION);
        u1.setGender(gender);
        u1.setAge(age);
        u1.setHeight(height);
        u1.setSoleSize((int) soleSize);
        u1.setWeight((int) weight);

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
