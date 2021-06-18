package com.model;

public class Category {
	private String categoryId;
	private String name;
	public Category(){
	}
	public Category(String Category, String Name){
		categoryId = Category;
		name = Name;
	}
	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
