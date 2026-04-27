package com.wddwzl.dao.user;

import com.wddwzl.dao.BaseDao;
import com.wddwzl.pojo.User;
import com.wddwzl.util.jdbcutils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//UserDao的实现类
public class UserDaoImpl implements UserDao {

    @Override
    public User getLoginUser(Connection conn, String userName, String userPassword) {
        PreparedStatement pm = null;
        ResultSet rs = null;
        User user = null;

        if (conn != null) {
            //这里使用预编译对象防止被脱库
            String sql = "select * from smbms_user where userCode=? and userPassword=?";
            Object[] param = {userName,userPassword};
            try {
                rs = BaseDao.select(conn, sql, param, rs, pm);
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUserName(rs.getString("userName"));
                    user.setPhone(rs.getString("phone"));
                    user.setUserCode(rs.getString("userCode"));
                    user.setUserPassword(rs.getString("userPassword"));
                    user.setCreatedBy(rs.getInt("createdBy"));
                    user.setCreationDate(rs.getTimestamp("creationDate"));
                    user.setModifyDate(rs.getTimestamp("modifyDate"));
                    user.setModifyBy(rs.getInt("modifyBy"));
                }
                jdbcutils.release(null,pm,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public User getFootInformation(Connection conn, String userName) throws SQLException {
        PreparedStatement pm = null;
        ResultSet rs = null;
        User user = null;

        if (conn != null) {
            //这里使用预编译对象防止被脱库
            String sql = "select * from smbms_user where userCode=?";
            Object[] param = {userName};
            try {
                rs = BaseDao.select(conn, sql, param, rs, pm);
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUserName(rs.getString("userName"));
                    user.setUserCode(rs.getString("userCode"));
                    user.setUserPassword(rs.getString("userPassword"));
                    user.setCreatedBy(rs.getInt("createdBy"));
                    user.setCreationDate(rs.getTimestamp("creationDate"));
                    user.setModifyDate(rs.getTimestamp("modifyDate"));
                    user.setModifyBy(rs.getInt("modifyBy"));
                    user.setHeelEdge(rs.getInt("heelEdge"));
                    user.setHeel(rs.getInt("heel"));
                    user.setArch(rs.getInt("arch"));
                    user.setRightForefoot(rs.getInt("leftForefoot"));
                    user.setLeftForefoot(rs.getInt("rightForefoot"));
                    user.setSoleSize(rs.getInt("soleSize"));
                    user.setWeight(rs.getInt("weight"));
                    user.setPhone(rs.getString("phone"));
                    user.setGender(rs.getString("gender"));
                    user.setAge(rs.getInt("age"));
                    user.setHeight(rs.getInt("height"));
                }
                jdbcutils.release(null,pm,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public void EditLoginUser(Connection conn, String userName, int ShoeSize,double Heel, double Arch, double LeftForefoot, double RightForefoot, double HeelEdge) throws SQLException {

        PreparedStatement pm = null;
        ResultSet rs = null;

        if (conn != null) {
            //这里使用预编译对象防止被脱库
            String sql = "UPDATE `smbms_user` SET `soleSize` = ? , `heel` = ? , `arch` = ? , `leftForefoot` = ? , `rightForefoot` = ? , `heelEdge` = ? WHERE `userCode` = ?";
            Object[] param = {ShoeSize, Heel, Arch, LeftForefoot, RightForefoot, HeelEdge, userName};
            try {
                BaseDao.update(conn, sql, param, pm);
                jdbcutils.release(null,pm,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public void EditLoginUser2(Connection conn, String userName, double SoleLength, double SoleWidth, double Heel, double Arch, double LeftForefoot, double RightForefoot, double HeelEdge) throws SQLException {
        PreparedStatement pm = null;
        ResultSet rs = null;

        if (conn != null) {
            //这里使用预编译对象防止被脱库
            String sql = "UPDATE `smbms_user` SET `soleLength` = ? ,`soleWidth` = ? , `heel` = ? , `arch` = ? , `leftForefoot` = ? , `rightForefoot` = ? , `heelEdge` = ? WHERE `userCode` = ?";
            Object[] param = {SoleLength, SoleWidth, Heel, Arch, LeftForefoot, RightForefoot, HeelEdge, userName};
            try {
                BaseDao.update(conn, sql, param, pm);
                jdbcutils.release(null,pm,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public void EditPhone(Connection conn, String phone) throws SQLException {
        PreparedStatement pm = null;
        ResultSet rs = null;

        if (conn != null) {
            //这里使用预编译对象防止被脱库
            String sql = "UPDATE `smbms_user` SET `phone` = ? WHERE `userCode` = ?";
            Object[] param = {phone, "2243234915@qq.com"};
            try {
                BaseDao.update(conn, sql, param, pm);
                jdbcutils.release(null,pm,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public void EditUserInfo(Connection conn, String userCode, String phone, String password) {
        PreparedStatement pm = null;
        ResultSet rs = null;

        if (conn != null) {
            //这里使用预编译对象防止被脱库
            String sql = "UPDATE `smbms_user` SET `phone` = ? , `userPassword` = ? WHERE `userCode` = ?";
            Object[] param = {phone, password, userCode};
            try {
                BaseDao.update(conn, sql, param, pm);
                jdbcutils.release(null,pm,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public void EditPersonalInfo(Connection conn, String userCode, String gender, int age, int height, int soleSize, int weight) {
        PreparedStatement pm = null;
        ResultSet rs = null;

        if (conn != null) {
            //这里使用预编译对象防止被脱库
            String sql = "UPDATE `smbms_user` SET `gender` = ? , `age` = ?, `height` = ? ,`soleSize` = ? ,`weight` = ? WHERE `userCode` = ?";
            Object[] param = {gender, age, height, soleSize, weight, userCode};
            try {
                BaseDao.update(conn, sql, param, pm);
                jdbcutils.release(null,pm,rs);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}

