/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class BillDao extends MyDAO {

    public List<Bill> getAllBill() {
        xSql = "select * from Bill";
        List<Bill> BillList = new ArrayList<>();
        int Bid, totalValue;
        String userName;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Bid = rs.getInt("Bid");
                totalValue = rs.getInt("totalValue");
                userName = rs.getString("Uname");
                BillList.add(new Bill(Bid, userName, totalValue));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BillList;
    }

    public List<Bill> getBillsByUserName(String userName) {
        xSql = "select * from Bill where Uname = ?";
        List<Bill> BillList = new ArrayList<>();
        int Bid, totalValue;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                Bid = rs.getInt("Bid");
                totalValue = rs.getInt("totalValue");
                BillList.add(new Bill(Bid, userName, totalValue));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BillList;
    }

    public int getCurrentMaxBillId() {
        xSql = "select max(Bid) as maxId from Bill";
        int CurrMaxBid = 0;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if (rs.next()) {
                CurrMaxBid = rs.getInt("maxId");
            }
        } catch (Exception e) {
        }
        return CurrMaxBid;
    }

    public void insertBill(String userName, int totalValue) {
        xSql = "insert into Bill(totalValue, Uname) values (?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, totalValue);
            ps.setString(2, userName);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<BillDetail> getAllBillDetailByUserName(String userName) {
        xSql = "select bd.* from billDetail bd, Bill b where bd.Bid = b.Bid\n"
                + "and b.Uname = '?'";
        int bid;
        int Aid;
        List<BillDetail> list = new ArrayList<>();
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while(rs.next()){
                bid = rs.getInt("bid");
                Aid = rs.getInt("Did");
                list.add(new BillDetail(bid, Aid));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
