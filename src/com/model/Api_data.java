package com.model;
import java.util.List;
public class Api_data{

	private String Idsize;
	private String Size;
	private String Available;
	public Api_data() {
		super();
	}

	public Api_data(String idsize,String size,String available) {
		super();
		this.Idsize = idsize;
		this.Size = size;
		this.Available = available;
	}
	public String getidsize() {
		return Idsize;
	}

	public void setidsize(String idsize) {
		Idsize = idsize;
	}
	public String getsize() {
		return Size;
	}

	public void setsize(String size) {
		Size = size;
	}
	public String getavailable() {
		return Available;
	}

	public void setavailable(String available) {
		Available = available;
	}

}
