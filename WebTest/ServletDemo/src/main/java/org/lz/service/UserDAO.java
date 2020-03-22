package org.lz.service;

import org.lz.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Power
 */
public class UserDAO {
    private final String driverName = "com.mysql.jdbc.Driver";
    private final String dbUrl = "jdbc:mysql://localhost:3306/db_test";
    private final String userName = "root";
    private final String password = "";
    private Connection conn = null;

    public UserDAO() {
        createConn();
    }

    public boolean createConn() {
        if (conn == null) {
            try {
                Class.forName(driverName);
                System.out.println("数据库驱动加载成功");
            } catch (ClassNotFoundException e) {
                System.out.println("数据库驱动加载失败");
                e.printStackTrace();
                return false;
            }
            try {
                conn = DriverManager.getConnection(dbUrl, userName, password);
                System.out.println("数据库连接成功");
            } catch (SQLException e) {
                System.out.println("数据库连接失败");
                e.printStackTrace();
            }
            return true;
        }
        return false;
    }

    public boolean addUser(User user) {
        if (conn == null){
            return false;
        }
        boolean result = true;
        try {
            String sql = "insert into table_test(username,password) values (?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());

            int i = ps.executeUpdate();
            if (i != 1) {
                result = false;
            }
        } catch (SQLException e) {
            result = false;
            e.printStackTrace();
        }
        return result;
    }

    public List<User> getUserlist() {
        if (conn == null){
            return null;
        }
        try {
            List<User> userlist = new ArrayList<User>();
            String sql = "SELECT * FROM table_test";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();  
            while(rs.next()){
				String username = rs.getString("username");
				String password = rs.getString("password");
				User user = new User(username, password);
				userlist.add(user);
			}
			return userlist;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
