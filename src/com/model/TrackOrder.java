package com.model;

public class TrackOrder {
    private String AccID;
    private String OrderID;
    private String SubTotal;
    private String Status;

    public TrackOrder(String accID, String orderID, String subTotal, String status) {
        AccID = accID;
        OrderID = orderID;
        Status = status;
        SubTotal = subTotal;
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

    public void getAccID(String accID) {
        AccID = accID;
    }

    public String getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(String subTotal) {
        SubTotal = subTotal;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

}
