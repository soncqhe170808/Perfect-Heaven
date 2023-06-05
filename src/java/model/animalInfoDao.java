/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class animalInfoDao extends MyDAO {

    public List<animalInfo> getAllAnimal() {
        xSql = "select * from animalInfo";
        List<animalInfo> list = new ArrayList<>();
        int id, price;
        float weight;
        String type, description, imgPath;
        char gender;
        Date dob;
        boolean sold;
        try {
            ps = con.prepareStatement(xSql);
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
                list.add(new animalInfo(id, price, weight, type, description, imgPath, gender, dob, sold));

            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<animalInfo> getAllAnimalNotSold() {
        xSql = "select * from animalInfo where sold = 0";
        List<animalInfo> list = new ArrayList<>();
        int id, price;
        float weight;
        String type, description, imgPath;
        char gender;
        Date dob;
        boolean sold;
        try {
            ps = con.prepareStatement(xSql);
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
                
                list.add(new animalInfo(id, price, weight, type, description, imgPath, gender, dob, false));
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<animalInfo> getAllAnimalNotSoldwithPaging(int offSet, int fecth) {
        xSql = "select * from animalInfo where sold = 0 ORDER BY did asc\n"
                + "OFFSET ? rows\n"
                + "FETCH next ? rows only ";
        List<animalInfo> list = new ArrayList<>();
        int id, price;
        float weight;
        String type, description, imgPath;
        char gender;
        Date dob;
        boolean sold;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, offSet);
            ps.setInt(2, fecth);
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
                if (sold == false) {
                    list.add(new animalInfo(id, price, weight, type, description, imgPath, gender, dob, false));
                }
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //search for the animal with the id parameter
    public animalInfo getAnimalById(String idraw) {
        int id = Integer.parseInt(idraw);
        xSql = "select * from animalInfo where Did = ?";
        animalInfo found = null;
        int price;
        float weight;
        String type, description, imgPath;
        char gender;
        Date dob;
        boolean sold;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                type = rs.getString("type");
                gender = rs.getString("gender").charAt(0);
                dob = rs.getDate("dateOfBirth");
                weight = rs.getFloat("weight");
                description = rs.getString("description");
                imgPath = rs.getString("imgPath");
                price = rs.getInt("price");
                sold = rs.getBoolean("sold");
                found = new animalInfo(id, price, weight, type, description, imgPath, gender, dob, sold);
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return found;
    }
    public int getCount(){
        xSql = "select COUNT(did) as recordCount from animalInfo where sold = 0";
        int count = 0;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next()){
              count = rs.getInt("recordCount");
            }
        } catch (Exception e) {
        }
        return count;
    }
    public animalInfo getNotSoldAnimalById(String idraw) {
        int id = Integer.parseInt(idraw);
        xSql = "select * from animalInfo where Did = ?";
        animalInfo found = null;
        int price;
        float weight;
        String type, description, imgPath;
        char gender;
        Date dob;
        boolean sold;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                type = rs.getString("type");
                gender = rs.getString("gender").charAt(0);
                dob = rs.getDate("dateOfBirth");
                weight = rs.getFloat("weight");
                description = rs.getString("description");
                imgPath = rs.getString("imgPath");
                price = rs.getInt("price");
                sold = rs.getBoolean("sold");
                if (sold == false) {
                    found = new animalInfo(id, price, weight, type, description, imgPath, gender, dob, sold);
                }
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return found;
    }

    public List<animalInfo> searchByFilter(String[] type, int priceRange, String genderRaw) {
        char gender = genderRaw.charAt(0);
        List<animalInfo> filterList = new ArrayList<>();
        xSql = "select * from animalInfo where price <= " + priceRange;
        if (!(type == null && genderRaw == null)) {
            if (type != null || type.length > 0) {
                for (int i = 0; i < type.length; i++) {
                    if (type.length >= 2 && i == 1) {
                        xSql += " and type like '" + type[i] + "'";
                    }

                    if (type.length > 2 && i > 1) {
                        xSql += " or type like '" + type[i] + "'";
                    }
                }
            }

            if (!genderRaw.equalsIgnoreCase("both")) {
                xSql += " and gender = '" + gender + "'";
            }
        }
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("did");
                String xtype = rs.getString("type");
                char xgender = rs.getString("gender").charAt(0);
                Date dob = rs.getDate("dateOfBirth");
                float weight = rs.getFloat("weight");
                String description = rs.getString("description");
                String imgPath = rs.getString("imgPath");
                int price = rs.getInt("price");
                boolean sold = rs.getBoolean("sold");
                if (sold == false) {
                    filterList.add(new animalInfo(id, price, weight, xtype, description, imgPath, xgender, dob, sold));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return filterList;
    }

    public List<animalInfo> searchByDescription(String description) {
        description = description.toLowerCase();
        xSql = "select * from animalInfo";
        List<animalInfo> list = new ArrayList<>();
        int id, price;
        float weight;
        String type, imgPath, loweredDescription;
        char gender;
        Date dob;
        boolean sold;
//        int i = 0;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                loweredDescription = rs.getString("description").toLowerCase();
                if (loweredDescription.contains(description)) {
                    id = rs.getInt("Did");
                    type = rs.getString("type");
                    gender = rs.getString("gender").charAt(0);
                    dob = rs.getDate("dateOfBirth");
                    weight = rs.getFloat("weight");
                    String xdescription;
                    /*
                    variable name is identical to the paramter
                    making only the first description - 
                    user's input
                     */
                  xdescription = rs.getString("description");
                    imgPath = rs.getString("imgPath");
                    price = rs.getInt("price");
                    sold = rs.getBoolean("sold");
                    if (sold == false) {
                        list.add(new animalInfo(id, price, weight, type, xdescription, imgPath, gender, dob, sold));
//                        i++;
                    }

                }

            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int maxPrice() {
        xSql = "select max(price) from animalInfo";
        int max = 0;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            max = rs.getInt("price");
        } catch (Exception e) {

        }
        return max;
    }

    public void insert(animalInfo newAi) {
        xSql = "insert into animalInfo(Did, type, gender, dateOfBirth, weight, price, description, imgPath, sold) values (?,?,?,?,?,?,?,?,?)";
        try {
            //String xgender = newAi.getGender() + "";
            ps = con.prepareStatement(xSql);
            ps.setInt(1, newAi.getId());
            ps.setString(2, newAi.getType());
            ps.setString(3, String.valueOf(newAi.getGender()));
            ps.setDate(4, newAi.getDob());
            ps.setFloat(5, newAi.getWeight());
            ps.setInt(6, newAi.getPrice());
            ps.setString(7, newAi.getDescription());
            ps.setString(8, newAi.getImgPath());
            ps.setBoolean(9, newAi.isSold());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void setAnimalToSold(String idRaw) {
        int id = Integer.parseInt(idRaw);
        xSql = "update animalInfo set sold = 1 where Did = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(String idRaw) {
        int id = Integer.parseInt(idRaw);
        xSql = "delete from animalInfo where did = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
