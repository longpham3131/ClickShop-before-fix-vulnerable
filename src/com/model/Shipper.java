package com.model;

public class Shipper {
	private String AccountId;
	private String Email;
	private String FirstName;
	private String LastName; //
	private String Phone;
	private String Address; //
	private String Gender;  //
	private String OrtherCarring;

	public Shipper(String accountId, String email, String firstName, String phone,  String ortherCarring, String lastName, String address, String gender)
	{
		AccountId = accountId;
		Email = email;
		FirstName = firstName;
		OrtherCarring = ortherCarring;
		Phone = phone;
		LastName=lastName;
		Address=address;
		Gender=gender;
	}
	
	public String getAccountId() {
		return AccountId;
	}
	public void setAccountId(String accountId) {
		AccountId = accountId;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getOrtherCarring() {
		return OrtherCarring;
	}
	public void setOrtherCarring(String ortherCarring) {
		OrtherCarring = ortherCarring;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Phone = gender;
	}

}
