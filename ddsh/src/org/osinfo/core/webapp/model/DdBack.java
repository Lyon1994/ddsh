package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdBack entity. @author MyEclipse Persistence Tools
 */

public class DdBack implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private String transaction;
	private Integer amount;
	private String type;
	private String reason;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdBack() {
	}

	/** minimal constructor */
	public DdBack(String barcode, Integer amount, String type) {
		this.barcode = barcode;
		this.amount = amount;
		this.type = type;
	}

	/** full constructor */
	public DdBack(String barcode, String transaction, Integer amount,
			String type, String reason, String operator, Timestamp date) {
		this.barcode = barcode;
		this.transaction = transaction;
		this.amount = amount;
		this.type = type;
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

	public String getTransaction() {
		return this.transaction;
	}

	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
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