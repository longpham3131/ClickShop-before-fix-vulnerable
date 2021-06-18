package com.model;

public class OrderList {
	private String PurchaseOrderId;
	private String CreatedDate;
	private String AccountId;
	private String SubTotal;
	private String Address;
	private String Phone;
	private String  Status;
	private String  Cancel;
	public OrderList(){}
	public OrderList(String purchaseOrderId, String createdDate, String accountId, String subTotal, String address, String phone, String status, String cancel)
	{
		PurchaseOrderId = purchaseOrderId;
		CreatedDate = createdDate;
		AccountId = accountId;
		SubTotal = subTotal;
		Address = address;
		Phone = phone;
		Status = status;
		Cancel=cancel;
	}

	public String getCancel() {
		return Cancel;
	}

	public void setCancel(String cancel) {
		Cancel = cancel;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getPurchaseOrderId() {
		return PurchaseOrderId;
	}

	public void setPurchaseOrderId(String purchaseOrderId) {
		PurchaseOrderId = purchaseOrderId;
	}

	public String getCreatedDate() {
		return CreatedDate;
	}

	public void setCreatedDate(String createdDate) {
		CreatedDate = createdDate;
	}

	public String getAccountId() {
		return AccountId;
	}

	public void setAccountId(String accountId) {
		AccountId = accountId;
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
}
