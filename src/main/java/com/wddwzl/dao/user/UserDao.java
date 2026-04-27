package com.wddwzl.dao.user;

import com.wddwzl.pojo.User;

import java.sql.Connection;
import java.sql.SQLException;

//这里是用户数据访问对象层，User Data access object
//类中包含getLoginUser方法，用于调用BaseDao中的select方法从数据库中获取该登录用户的全部信息并储存到User对象中
//设置成面向接口编程，在UserDaoImpl中具体实现
public interface UserDao {
    //login服务中调用
    public User getLoginUser(Connection conn,String userName,String userPassword) throws SQLException;
    public User getFootInformation(Connection conn,String userName) throws SQLException;
    public void EditLoginUser(Connection conn,String userName,int ShoeSize,double Heel,double Arch,double LeftForefoot,double RightForefoot,double HeelEdge) throws SQLException;

    public void EditLoginUser2(Connection conn,String userName,double SoleLength, double SoleWidth, double Heel,double Arch,double LeftForefoot,double RightForefoot,double HeelEdge) throws SQLException;
    public void EditPhone(Connection conn,String phone) throws SQLException;

    void EditUserInfo(Connection conn, String userCode, String phone, String password);

    void EditPersonalInfo(Connection conn, String userCode, String gender, int age, int height, int soleSize, int weight);
}
