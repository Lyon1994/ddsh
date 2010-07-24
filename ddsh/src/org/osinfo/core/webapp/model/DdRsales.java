package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdRsales entity. @author MyEclipse Persistence Tools
 */

public class DdRsales implements java.io.Serializable {

	// Fields

	private Integer id;
	private String transaction;
	private String barcode;
	private String name;
	private Integer amount;
	private String reason;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdRsales() {
	}

	/** minimal constructor */
	public DdRsales(String barcode, Integer amount, String operator,
			Timestamp date) {
		this.barcode = barcode;
		this.amount = amount;
		this.operator = operator;
		this.date = date;
	}

	/** full constructor */
	public DdRsales(String transaction, String barcode, String name,
			Integer amount, String reason, String operator, Timestamp date) {
		this.transaction = transaction;
		this.barcode = barcode;
		this.name = name;
		this.amount = amount;
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

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
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