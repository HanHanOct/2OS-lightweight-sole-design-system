package com.wddwzl.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

//这里是工具类哒，封装了基本的加载驱动，获取连接，释放资源

public class jdbcutils {
    private static String driver = null;
    private static String url = null;
    private static String username = null;
    private static String password = null;

    //加载驱动
    static {
        try {
            InputStream in = jdbcutils.class.getClassLoader().getResourceAsStream("db.properties");
            Properties properties = new Properties();
            properties.load(in);

            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            username = properties.getProperty("username");
            password = properties.getProperty("password");

            //驱动只用加载一次
            Class.forName(driver);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //获取连接
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

    //释放资源
    public static void release(Connection conn, Statement st, ResultSet rs){
        if(conn != null)
        {
            try{
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        if(st != null)
        {
            try{
                st.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        if(rs != null)
        {
            try{
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }


}
