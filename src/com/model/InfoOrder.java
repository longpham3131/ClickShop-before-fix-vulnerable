package com.model;

public class InfoOrder {
    private String OrderId;
    private String CreatedDate;
    private String AccountId;
    private String SubTotal;
    private String Address;
    private String Phone;
    public InfoOrder(){}
    public InfoOrder(String accId, String OrderId, String accountId, String subTotal)
    {
        System.out.print("hahaahha  "+accId);
    }

    public String getPurchaseOrderId() {
        return null;
    }

    public void setPurchaseOrderId(String purchaseOrderId) {
    }

}
