package com.model;

public class OrtherNoShipper {
	private String OrderID;
	private String Email;
	private String SubTotal;
	private String Address;
	private String Phone;
	private String Init;

	public OrtherNoShipper(String orderID, String email, String subTotal, String address,  String phone, String init)
	{
		OrderID = orderID;
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
