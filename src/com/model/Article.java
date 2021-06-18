package com.model;

public class Article {
	private String AccountId;
	private String Email;
	private String Password;
	private String ImageLink;
	private String FirstName;
	private String LastName;
	private String Phone;
	private String Address;
	private String Gender;
	private String DayofBirth;
	private String CreatedDay;
	private String isAvailable;
	private String Role;
	public Article() {
	}

	public Article(String accountId, String email, String password, String imageLink, String firstName, String lastName,
			String phone, String address, String gender, String dayofBirth, String createdDay, String isAvailable, String role) {
		AccountId = accountId;
		Email = email;
		Password = password;
		ImageLink = imageLink;
		FirstName = firstName;
		LastName = lastName;
		Phone = phone;
		Address = address;
		Gender = gender;
		DayofBirth = dayofBirth;
		CreatedDay = createdDay;
		this.isAvailable = isAvailable;
		Role = role;
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


	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getImageLink() {
		return ImageLink;
	}

	public void setImageLink(String imageLink) {
		ImageLink = imageLink;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
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
		Gender = gender;
	}

	public String getDayofBirth() {
		return DayofBirth;
	}

	public void setDayofBirth(String dayofBirth) {
		DayofBirth = dayofBirth;
	}

	public String getCreatedDay() {
		return CreatedDay;
	}

	public void setCreatedDay(String createdDay) {
		CreatedDay = createdDay;
	}

	public String getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}

}
