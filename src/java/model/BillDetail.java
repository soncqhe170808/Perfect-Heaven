/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPT
 */
public class BillDetail {
    int bId, SoldAnimalId;

    public BillDetail() {
    }

    public BillDetail(int bId, int SoldAnimalId) {
        this.bId = bId;
        this.SoldAnimalId = SoldAnimalId;
    }

    public int getbId() {
        return bId;
    }

    public void setbId(int bId) {
        this.bId = bId;
    }

    public int getSoldAnimalId() {
        return SoldAnimalId;
    }

    public void setSoldAnimalId(int SoldAnimalId) {
        this.SoldAnimalId = SoldAnimalId;
    }
    
}
