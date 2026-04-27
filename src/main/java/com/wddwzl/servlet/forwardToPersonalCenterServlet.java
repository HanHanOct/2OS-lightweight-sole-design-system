package com.wddwzl.servlet;

import com.wddwzl.pojo.User;
import com.wddwzl.service.user.UserService;
import com.wddwzl.service.user.UserServiceImpl;
import com.wddwzl.util.Constants;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class forwardToPersonalCenterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserService userService = new UserServiceImpl();
        User user = (User)req.getSession().getAttribute(Constants.USER_SESSION);

        if(user != null)
        {
            try {
                user = userService.GetFootInformation(user.getUserCode());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else{
            try {
                user = userService.GetFootInformation("2243234915@qq.com");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        req.getSession().setAttribute(Constants.USER_SESSION,user);

        String s = "jsp/personalCenter.jsp";
        req.setAttribute("UserCode",user.getUserCode());
        req.setAttribute("Phone",user.getPhone());
        req.setAttribute("Gender",user.getGender());
        req.setAttribute("Age",user.getAge());
        req.setAttribute("Height",user.getHeight());
        req.setAttribute("Weight",user.getWeight());
        req.setAttribute("SoleSize",user.getSoleSize());
        //转发回登录页面
        //resp.sendRedirect(s);
        req.getRequestDispatcher(s).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Test
    public void test() throws SQLException {
        UserServiceImpl userService = new UserServiceImpl();
        User admin = userService.GetFootInformation("wddwzl");
        System.out.println(admin.getSoleSize());
        int ShoeSize = 666;
        admin.setSoleSize(ShoeSize);
        System.out.println(admin.getHeel());
    }
}
