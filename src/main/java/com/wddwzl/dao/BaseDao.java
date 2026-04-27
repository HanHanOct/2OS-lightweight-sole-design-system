package com.wddwzl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//这个基础数据访问对象负责实现查询和增删改方法
//调用方法的参数中加入了Connection PreparedStatement ResultSet，便于统一close，
public class BaseDao {

    //查询方法
    public static ResultSet select(Connection conn, String sql, Object[] params, ResultSet rs, PreparedStatement preparedStatement) throws SQLException {
        preparedStatement = conn.prepareStatement(sql);

        for(int i = 0; i < params.length; i++ ){
            preparedStatement.setObject(i+1,params[i]);
        }
        rs = preparedStatement.executeQuery();
        return rs;
    }
    //增删改方法
    public static int update(Connection conn, String sql, Object[] params, PreparedStatement preparedStatement) throws SQLException {
        preparedStatement = conn.prepareStatement(sql);

        for(int i = 0; i < params.length; i++ ){
            preparedStatement.setObject(i+1,params[i]);
        }

        int result = preparedStatement.executeUpdate();
        return result;
    }

}
