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

public class forwardToPadServlet extends HttpServlet {
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

        String s = "jsp/3dShoePad.jsp";
        req.setAttribute("UserCode", user.getUserCode());
        req.setAttribute("ShoeSize",user.getSoleSize());
        req.setAttribute("Heel",user.getHeel());
        req.setAttribute("LeftForefoot",user.getLeftForefoot());
        req.setAttribute("RightForefoot",user.getRightForefoot());
        req.setAttribute("HeelEdge",user.getHeelEdge());
        req.setAttribute("Arch",user.getArch());

//        if(user.getArch()-user.getHeel()>0){
//            req.setAttribute("Arch",user.getArch()-user.getHeel());
//        }else {
//            req.setAttribute("Arch",15);
//        }
//
//        if(user.getLeftForefoot()-user.getHeel()>0){
//            req.setAttribute("LeftForefoot",user.getLeftForefoot()-user.getHeel());
//        }else {
//            req.setAttribute("LeftForefoot",user.getLeftForefoot()-user.getHeel());
//        }
//
//        if(user.getRightForefoot()-user.getHeel()>0){
//            req.setAttribute("RightForefoot",user.getRightForefoot()-user.getHeel());
//        }else {
//            req.setAttribute("RightForefoot",user.getRightForefoot()-user.getHeel());
//        }
//
//        if(user.getHeelEdge()-user.getHeel()>0){
//            req.setAttribute("HeelEdge",user.getHeelEdge()-user.getHeel());
//        }else {
//            req.setAttribute("HeelEdge",user.getHeelEdge()-user.getHeel());
//        }

        if(user.getWeight()!=null){
            req.setAttribute("Weight", user.getWeight());
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

    @Test
    public void test() throws SQLException {
        UserServiceImpl userService = new UserServiceImpl();
        User admin = userService.GetFootInformation("2243234915@qq.com");
        System.out.println(admin.getSoleSize());
        int ShoeSize = 666;
        admin.setSoleSize(ShoeSize);
        System.out.println(admin.getHeel());
    }
}
