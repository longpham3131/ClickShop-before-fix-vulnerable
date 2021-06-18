package com.model;

public class PickingUp {
	private String OrderID;
	private String ShipperID;
	public String getShipperID() {
		return ShipperID;
	}

	public void setShipperID(String shipperID) {
		ShipperID = shipperID;
	}

	private String Email;
	private String SubTotal;
	private String Address;
	private String Phone;
	private String Init;

	public PickingUp(String orderID, String shipperID, String email, String subTotal, String address,  String phone, String init)
	{
		OrderID = orderID;
		ShipperID = shipperID;
		Email = email;
		SubTotal = subTotal;
		Address = address;
		Phone = phone;
		Init = init;
	}
	
	public String getOrderID() {
		return OrderID;
	}

	public void setOrderID(String orderID) {
		OrderID = orderID;
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

	public String getInit() {
		return Init;
	}

	public void setInit(String init) {
		Init = init;
	}
}
