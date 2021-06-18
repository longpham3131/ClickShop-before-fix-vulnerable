package com.model;

public class Voucher {
	private String Code;
	private String Coin;
	private String Status;

	public Voucher() {
	}

	public Voucher(String code, String coin, String status) {
		Code = code;
		Coin = coin;
		Status = status;

	}
	public String getCode() {
		return Code;
	}

	public void setCode(String code) {
		Code = code;
	}

	public String getCoin() {
		return Coin;
	}

	public void setCoin(String coin) {
		Coin = coin;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}
}
