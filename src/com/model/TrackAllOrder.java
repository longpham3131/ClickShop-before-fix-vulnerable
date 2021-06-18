package com.model;

public class TrackAllOrder {
    private String AccID;
    private String OrderID;
    private String Name;
    private String Quanity;
    private String SubTotal;
    private String Status;

    public TrackAllOrder(String accID, String orderID, String name, String quanity, String subTotal, String status) {
        AccID = accID;
        OrderID = orderID;
        Status = status;
        SubTotal = subTotal;
        Name = name;
        Quanity = quanity;
        //System.out.print(" ==88 " +ProductID+" ss==");
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String orderID) {
        OrderID = orderID;
    }

    public String getAccID() {
        return AccID;
    }

    public void setAccID(String accID) {
        AccID = accID;
    }

    public String getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(String subTotal) {
        SubTotal = subTotal;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getQuanity() {
        return Quanity;
    }

    public void setQuanity(String quanity) {
        Quanity = quanity;
    }
    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

}
