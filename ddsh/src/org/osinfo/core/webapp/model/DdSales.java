package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdSales entity. @author MyEclipse Persistence Tools
 */

public class DdSales implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private String name;
	private Float discount;
	private Integer amount;
	private Float price;
	private Float totalprice;
	private String userid;
	private String operator;
	private Timestamp data;

	// Constructors

	/** default constructor */
	public DdSales() {
	}

	/** full constructor */
	public DdSales(String barcode, String name, Float discount, Integer amount,
			Float price, Float totalprice, String userid, String operator,
			Timestamp data) {
		this.barcode = barcode;
		this.name = name;
		this.discount = discount;
		this.amount = amount;
		this.price = price;
		this.totalprice = totalprice;
		this.userid = userid;
		this.operator = operator;
		this.data = data;
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

	public Float getDiscount() {
		return this.discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
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

	public Float getTotalprice() {
		return this.totalprice;
	}

	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
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

	public Timestamp getData() {
		return this.data;
	}

	public void setData(Timestamp data) {
		this.data = data;
	}

}