package com.model;

public class DetailOrder {
    private String OrderID;
    private String ProductID;
    private String Name;
    private String Quanity;
    private String SubTotal;
    private String Size;

    public DetailOrder(String orderID, String productID, String name, String quanity, String subTotal, String size) {
        OrderID = orderID;
        ProductID = productID;
        SubTotal = subTotal;
        Name = name;
        Quanity = quanity;
        Size = size;
        //System.out.print(" ==88 " +ProductID+" ss==");
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String size) {
        Size = size;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String orderID) {
        OrderID = orderID;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String productID) {
        ProductID = productID;
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

}
