package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdRsales entity. @author MyEclipse Persistence Tools
 */

public class DdRsales implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private String name;
	private Float discount;
	private Integer amount;
	private Float price;
	private Float totalprice;
	private Integer userid;
	private String reason;
	private Integer operator;
	private Timestamp data;

	// Constructors

	/** default constructor */
	public DdRsales() {
	}

	/** minimal constructor */
	public DdRsales(String barcode, Float discount, Integer amount,
			Float price, Float totalprice, Integer operator, Timestamp data) {
		this.barcode = barcode;
		this.discount = discount;
		this.amount = amount;
		this.price = price;
		this.totalprice = totalprice;
		this.operator = operator;
		this.data = data;
	}

	/** full constructor */
	public DdRsales(String barcode, String name, Float discount,
			Integer amount, Float price, Float totalprice, Integer userid,
			String reason, Integer operator, Timestamp data) {
		this.barcode = barcode;
		this.name = name;
		this.discount = discount;
		this.amount = amount;
		this.price = price;
		this.totalprice = totalprice;
		this.userid = userid;
		this.reason = reason;
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

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Integer getOperator() {
		return this.operator;
	}

	public void setOperator(Integer operator) {
		this.operator = operator;
	}

	public Timestamp getData() {
		return this.data;
	}

	public void setData(Timestamp data) {
		this.data = data;
	}

}