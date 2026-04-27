package com.wddwzl.service.user;

import com.wddwzl.dao.user.UserDao;
import com.wddwzl.dao.user.UserDaoImpl;
import com.wddwzl.pojo.User;
import com.wddwzl.util.jdbcutils;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;

//UserService的具体实现
public class UserServiceImpl implements UserService{
    //引入userDao对象
    private UserDao userDao;

    public UserServiceImpl(){
        userDao = new UserDaoImpl();//在构造函数中new 一个Dao对象，使业务对象实例化时完成完成userDao对象的引入
    }
    @Override
    public User login(String userCode, String password) throws SQLException {
        Connection conn = null;
        User user = null;
        try{
            conn = jdbcutils.getConnection();
            user = userDao.getLoginUser(conn, userCode, password);//通过业务层调用userDao层
        }finally {
            jdbcutils.release(conn,null,null);
        }
        return user;
    }

    @Override
    public void EditLoginUser(String userCode, int ShoeSize, double Heel, double Arch, double LeftForefoot, double RightForefoot, double HeelEdge) throws SQLException {
        Connection conn = null;
        try{
            conn = jdbcutils.getConnection();
            userDao.EditLoginUser(conn, userCode, ShoeSize,Heel, Arch, LeftForefoot, RightForefoot, HeelEdge);//通过业务层调用userDao层
        }finally {
            jdbcutils.release(conn,null,null);
        }
    }

    @Override
    public void EditLoginUser2(String userCode, double SoleLength, double SoleWidth, double Heel, double Arch, double LeftForefoot, double RightForefoot, double HeelEdge) throws SQLException {
        Connection conn = null;
        try{
            conn = jdbcutils.getConnection();
            userDao.EditLoginUser2(conn, userCode, SoleLength, SoleWidth, Heel, Arch, LeftForefoot, RightForefoot, HeelEdge);//通过业务层调用userDao层
        }finally {
            jdbcutils.release(conn,null,null);
        }
    }

    @Override
    public User GetFootInformation(String userCode) throws SQLException {
        Connection conn = null;
        User user = null;
        try{
            conn = jdbcutils.getConnection();
            user = userDao.getFootInformation(conn, userCode);//通过业务层调用userDao层
        }finally {
            jdbcutils.release(conn,null,null);
        }
        return user;
    }

    public void EditPhone(String phone) throws SQLException{
        Connection conn = null;
        try{
            conn = jdbcutils.getConnection();
            userDao.EditPhone(conn, phone);//通过业务层调用userDao层
        }finally {
            jdbcutils.release(conn,null,null);
        }
    }

    @Override
    public void EditLoginUserFootInformation(String userCode, int ShoeSize,double Heel, double Arch, double LeftForefoot, double RightForefoot, double HeelEdge) throws SQLException {
        Connection conn = null;
        try{
            conn = jdbcutils.getConnection();
            userDao.EditLoginUser(conn, userCode, ShoeSize ,Heel, Arch, LeftForefoot, RightForefoot, HeelEdge);//通过业务层调用userDao层
        }finally {
            jdbcutils.release(conn,null,null);
        }
    }

    @Override
    public void EditUserInfo(String userCode, String phone, String password) throws SQLException {
        Connection conn = null;
        try{
            conn = jdbcutils.getConnection();
            userDao.EditUserInfo(conn, userCode, phone, password);//通过业务层调用userDao层
        }finally {
            jdbcutils.release(conn,null,null);
        }
    }

    @Override
    public void EditPersonalInfo(String userCode, String gender, int age, int height, int soleSize, int weight) throws SQLException {
        Connection conn = null;
        try{
            conn = jdbcutils.getConnection();
            userDao.EditPersonalInfo(conn, userCode, gender, age, height, soleSize, weight);//通过业务层调用userDao层
        }finally {
            jdbcutils.release(conn,null,null);
        }
    }

    @Test
    public void test() throws SQLException {
        UserServiceImpl userService = new UserServiceImpl();
        User admin = userService.login("2243234915@qq.com", "123456");
        System.out.println(admin.getUserPassword());
        System.out.println(admin.getArch());
        System.out.println(admin.getWeight());
//        userService.EditLoginUser("admin",1,2,2,2,2,2);
    }

}
