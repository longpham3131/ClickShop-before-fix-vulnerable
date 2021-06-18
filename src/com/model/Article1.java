package com.model;

import java.util.List;

public class Article1 {
	private String ProductId;
	private String SubCategoryId;
	private String Name;
	private String UnitPrice;
	private String Gender;
	private String Description;
	private String Available;
	private String ImgPath;
	private List<ProductSize> Size;
	public Article1(String productId, String subcategoryId, String name, String unitprice, String gender,
			String description, String available, String imgpath, List<ProductSize> size) {
		ProductId = productId;
		SubCategoryId = subcategoryId;
		Name = name;
		UnitPrice = unitprice;
		Gender = gender;
		Description = description;
		Available = available;
		ImgPath = imgpath;
		Size = size;
	}
	public String getProductId() {
		return ProductId;
	}
	public void setProductId(String productId) {
		ProductId = productId;
	}

	public String getSubCategoryId() {
		return SubCategoryId;
	}
	public void setSubCategoryId(String subcategoryId) {
		SubCategoryId = subcategoryId;
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

	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}

	public String getAvailable() {
		return Available;
	}
	public void setAvailable(String available) {
		Available = available;
	}

	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}

	public String getImgPath() {
		return ImgPath;
	}
	public void setImgPath(String imgpath) {
		ImgPath = imgpath;
	}

	public List<ProductSize> getSize() {
		return Size;
	}
	public void setSize(List<ProductSize> size) {
		Size = size;
	}

}
