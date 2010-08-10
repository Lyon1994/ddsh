package org.osinfo.core.webapp.model.custom;

import java.sql.Timestamp;

/**
 * DdUpload entity. @author MyEclipse Persistence Tools
 */

public class Upload implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private String name;
	private Integer amount;
	private String operator;
	private Timestamp date;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

}