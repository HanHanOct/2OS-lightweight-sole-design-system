package com.wddwzl.service.user;

import com.wddwzl.pojo.User;

import java.sql.Connection;
import java.sql.SQLException;
//这里是业务层，目前只实现了login这一个业务，
//login业务就是通过业务层调用userDao层
//这里也是接口
public interface UserService {
    //用户登录业务
    public User login(String userCode,String password) throws SQLException;
    public User GetFootInformation(String userCode) throws SQLException;
    //编辑用户信息业务，用于在编辑界面根据欧码修改用户足部信息
    public void EditLoginUser(String userCode, int ShoeSize,double Heel, double Arch, double LeftForefoot, double RightForefoot, double HeelEdge) throws SQLException;
    //编辑用户信息业务，用于在编辑界面根据脚长和脚宽修改用户足部信息
    public void EditLoginUser2(String userCode, double SoleLength, double SoleWidth, double Heel, double Arch, double LeftForefoot, double RightForefoot, double HeelEdge) throws SQLException;
    public void EditPhone(String phone) throws SQLException;
    public void EditLoginUserFootInformation(String userCode,int ShoeSize, double Heel, double Arch, double LeftForefoot, double RightForefoot, double HeelEdge) throws SQLException;
    void EditUserInfo(String userCode, String phone, String password) throws SQLException;
    void EditPersonalInfo(String userCode, String gender, int age, int height, int soleSize, int weight) throws SQLException;
}

