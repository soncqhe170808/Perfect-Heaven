/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class usersDAO extends MyDAO {

    public List<users> getAllUser() {
        xSql = "select * from Users";
        List<users> list = new ArrayList<>();
        int xrole;
        String xname, xemail, xpassword;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                xname = rs.getString("name");
                xrole = rs.getInt("role");
                xemail = rs.getString("email");
                xpassword = rs.getString("password");
                list.add(new users(xrole, xname, xemail, xpassword));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public users getUser(String password, String userName) {
        xSql = "select * from users where password = ? and name = ?";
        users nu = null;
        int xrole;
        String xemail;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, password);
            ps.setString(2, userName);
            rs = ps.executeQuery();
            if (rs.next()) {
                xrole = rs.getInt("role");
                xemail = rs.getString("email");
                nu = new users(xrole, userName, xemail, password);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nu;
    }

    public users getUserByEmail(String email) {
        xSql = "select * from users where email = ?";
        users nu = null;
        int xrole;
        String xuserName, xpassword;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, email.trim());
            rs = ps.executeQuery();
            if (rs.next()) {
                xuserName = rs.getString("name");
                xpassword = rs.getString("password");
                xrole = rs.getInt("role");
                nu = new users(xrole, xuserName, email, xpassword);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nu;
    }

    public users getUser(String userName) {
        xSql = "select * from users where name = ?";
        users nu = null;
        int xrole;
        String xemail, xpassword;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            if (rs.next()) {
                xrole = rs.getInt("role");
                xemail = rs.getString("email");
                xpassword = rs.getString("password");
                nu = new users(xrole, userName, xemail, xpassword);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nu;
    }

    //can them tinh nang gui email de confirm 
    //them nguoi dung khong phai la admin
    public void insert(String password, String userName, String email) {
        xSql = "insert into users (name, email, password, role) values (?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setInt(4, 2);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {

        }
    }

    public void delete(String username) {
        xSql = "delete from users where name = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
