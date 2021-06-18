package com.model;

public class Shipping {
	private String OrderID;
	private String ShipperID;
	private String Email;
	private String SubTotal;
	private String Address;
	private String Phone;
	private String Status;
	
	public Shipping(String orderID, String shipperID, String email, String subTotal, String address,  String phone, String status)
	{
		OrderID = orderID;
		ShipperID = shipperID;
		Email = email;
		SubTotal = subTotal;
		Address = address;
		Phone = phone;
		Status = status;
	}
	
	public String getOrderID() {
		return OrderID;
	}
	public void setOrderID(String orderID) {
		OrderID = orderID;
	}
	public String getShipperID() {
		return ShipperID;
	}
	public void setShipperID(String shipperID) {
		ShipperID = shipperID;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getSubTotal() {
		return SubTotal;
	}
	public void setSubTotal(String subTotal) {
		SubTotal = subTotal;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	
}
