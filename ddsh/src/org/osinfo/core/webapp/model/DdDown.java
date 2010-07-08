package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdDown entity. @author MyEclipse Persistence Tools
 */

public class DdDown implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private String name;
	private Integer gridid;
	private Integer amount;
	private Float price;
	private String userid;
	private String reason;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdDown() {
	}

	/** minimal constructor */
	public DdDown(String barcode, Integer gridid, String userid, Timestamp date) {
		this.barcode = barcode;
		this.gridid = gridid;
		this.userid = userid;
		this.date = date;
	}

	/** full constructor */
	public DdDown(String barcode, String name, Integer gridid, Integer amount,
			Float price, String userid, String reason, String operator,
			Timestamp date) {
		this.barcode = barcode;
		this.name = name;
		this.gridid = gridid;
		this.amount = amount;
		this.price = price;
		this.userid = userid;
		this.reason = reason;
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

	public Integer getGridid() {
		return this.gridid;
	}

	public void setGridid(Integer gridid) {
		this.gridid = gridid;
	}

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
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

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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