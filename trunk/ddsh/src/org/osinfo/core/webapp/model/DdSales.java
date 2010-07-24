package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdSales entity. @author MyEclipse Persistence Tools
 */

public class DdSales implements java.io.Serializable {

	// Fields

	private Integer id;
	private String transaction;
	private String barcode;
	private String name;
	private Float discount;
	private Integer amount;
	private Float price;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdSales() {
	}

	/** minimal constructor */
	public DdSales(String barcode, String name, Float discount, Integer amount,
			Float price, String operator, Timestamp date) {
		this.barcode = barcode;
		this.name = name;
		this.discount = discount;
		this.amount = amount;
		this.price = price;
		this.operator = operator;
		this.date = date;
	}

	/** full constructor */
	public DdSales(String transaction, String barcode, String name,
			Float discount, Integer amount, Float price, String operator,
			Timestamp date) {
		this.transaction = transaction;
		this.barcode = barcode;
		this.name = name;
		this.discount = discount;
		this.amount = amount;
		this.price = price;
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

	public String getTransaction() {
		return this.transaction;
	}

	public void setTransaction(String transaction) {
		this.transaction = transaction;
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