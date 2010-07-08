package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdUpload entity. @author MyEclipse Persistence Tools
 */

public class DdUpload implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private String name;
	private Integer amount;
	private Integer gridid;
	private Float price;
	private String userid;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdUpload() {
	}

	/** minimal constructor */
	public DdUpload(String barcode, Integer gridid, String userid,
			Timestamp date) {
		this.barcode = barcode;
		this.gridid = gridid;
		this.userid = userid;
		this.date = date;
	}

	/** full constructor */
	public DdUpload(String barcode, String name, Integer amount,
			Integer gridid, Float price, String userid, String operator,
			Timestamp date) {
		this.barcode = barcode;
		this.name = name;
		this.amount = amount;
		this.gridid = gridid;
		this.price = price;
		this.userid = userid;
		this.operator = operator;
		this.date = date;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBarcode() {
		return this.barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getGridid() {
		return this.gridid;
	}

	public void setGridid(Integer gridid) {
		this.gridid = gridid;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

}