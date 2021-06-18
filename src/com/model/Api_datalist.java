package com.model;
import java.util.List;

public class Api_datalist {


	private List<Api_data> ListApi_data;
	public Api_datalist() {
		super();
	}

	public Api_datalist(List<Api_data> listApi_data) {
		this.ListApi_data = listApi_data;
	}
	public List<Api_data> getListApi_data() {
		return ListApi_data;
	}

	public void setListApi_data(List<Api_data> listApi_data) {
		ListApi_data = listApi_data;
	}

}
