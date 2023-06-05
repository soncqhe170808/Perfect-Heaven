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
public class BillDetailDao extends MyDAO {

    public void insert(int bid, String aidRaw) {
        int aid = Integer.parseInt(aidRaw);
        xSql = "insert into billDetail(Bid, Did) values (?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, bid);
            ps.setInt(2, aid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<animalInfo> getSoldAnimalByBillId(String bidRaw) {
        int bid = Integer.parseInt(bidRaw);
        xSql = "select ai.* from animalInfo ai, billDetail bd where ai.Did = bd.Did and bd.bid = ?";
        List<animalInfo> list = new ArrayList<>();
        int id, price;
        float weight;
        String type, description, imgPath;
        char gender;
        Date dob;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, bid);
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
                list.add(new animalInfo(id, price, weight, type, description, imgPath, gender, dob, true));
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; 
    }
}
