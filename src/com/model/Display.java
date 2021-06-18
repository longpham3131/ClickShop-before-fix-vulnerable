package com.model;

import DAO.queryDAO;

public class Display {
	private String ProductId;
	private String Name;
	private String UnitPrice;
	private String ImagePath;
	private String Description;
	private String SubCategoryId;
	private String CategoryId;
	private String Quannity;
	public Display(){}
	public Display(String productId, String name, String unitprice, String imagePath, String description, String subCategoryId, String categoryId) {
		ProductId = productId;
		Name = name;
		UnitPrice = unitprice;
		ImagePath = imagePath;
		Description = description;
		SubCategoryId = subCategoryId;
		CategoryId = categoryId;
		queryDAO dao = new queryDAO();
		Quannity = dao.GetQuanityAvai(ProductId);
		System.out.print("* "+Quannity);
	}
	public String getProductId() {
		return ProductId;
	}
	public void setProductId(String productId) {
		ProductId = productId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getUnitPrice() {
		return UnitPrice;
	}
	public void setUnitPrice(String unitprice) {
		UnitPrice = unitprice;
	}

	public String getImagePath() {
		return ImagePath;
	}

	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getSubCategoryId() {
		return SubCategoryId;
	}

	public void setSubCategoryId(String subCategoryId) {
		SubCategoryId = subCategoryId;
	}

	public String getCategoryId() {
		return CategoryId;
	}

	public void setCategoryId(String categoryId) {
		CategoryId = categoryId;
	}

	public String getQuannity() {
		return Quannity;
	}

	public void setQuannity(String quannity) {
		Quannity=quannity;
	}
}
