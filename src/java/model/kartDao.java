/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class kartDao extends MyDAO{
    public void insertAnimalintoKart(String userName, String didRaw){
        int did = Integer.parseInt(didRaw);
        xSql = "insert into kart(uname, did) values (?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            ps.setInt(2, did);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<animalInfo> getAnimalInKart(String userName){
        xSql = "select ai.* from animalInfo ai, kart k where ai.Did = k.did and k.uname = ?";
        List<animalInfo> kartList = new ArrayList<>();
        int id, price;
        float weight;
        String type, description, imgPath;
        char gender;
        Date dob;
        boolean sold;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt("Did");
                type = rs.getString("type");
                gender = rs.getString("gender").charAt(0);
                dob = rs.getDate("dateOfBirth");
                weight = rs.getFloat("weight");
                description = rs.getString("description");
                imgPath = rs.getString("imgPath");
                price = rs.getInt("price");
                sold = rs.getBoolean("sold");
                kartList.add(new animalInfo(id, price, weight, type, description, imgPath, gender, dob, sold));
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kartList;
    }
    public kart checkAnimalAlreadyInKart(String userName, String didRaw){
        int did = Integer.parseInt(didRaw);
        xSql = "select * from kart k where k.uname = ? and k.did = ?";
        kart k = null;
        
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            ps.setInt(2, did);
            rs = ps.executeQuery();
            if (rs.next()) {
              String uname = rs.getString("uname");
              int aidInKart = rs.getInt("Did");
              k = new kart(uname, aidInKart);
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }
    public void removefromOneKart(String userName, String didRaw){
        int did = Integer.parseInt(didRaw);
        xSql = "delete from kart where kart.uname = ? and kart.did = ?";
        kart k = null;
        
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            ps.setInt(2, did);
            ps.executeUpdate();         
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void removeKartByaAnimalId(String didRaw){
        int did = Integer.parseInt(didRaw);
        xSql = "delete from kart where did = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, did);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
