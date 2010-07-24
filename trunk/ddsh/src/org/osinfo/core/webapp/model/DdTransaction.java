package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdTransaction entity. @author MyEclipse Persistence Tools
 */

public class DdTransaction implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userid;
	private String shop;
	private String fromAccount;
	private String toAccount;
	private String transactionType;
	private Float transactionMoney;
	private String memo;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdTransaction() {
	}

	/** full constructor */
	public DdTransaction(String userid, String shop, String fromAccount,
			String toAccount, String transactionType, Float transactionMoney,
			String memo, String operator, Timestamp date) {
		this.userid = userid;
		this.shop = shop;
		this.fromAccount = fromAccount;
		this.toAccount = toAccount;
		this.transactionType = transactionType;
		this.transactionMoney = transactionMoney;
		this.memo = memo;
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

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getShop() {
		return this.shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public String getFromAccount() {
		return this.fromAccount;
	}

	public void setFromAccount(String fromAccount) {
		this.fromAccount = fromAccount;
	}

	public String getToAccount() {
		return this.toAccount;
	}

	public void setToAccount(String toAccount) {
		this.toAccount = toAccount;
	}

	public String getTransactionType() {
		return this.transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public Float getTransactionMoney() {
		return this.transactionMoney;
	}

	public void setTransactionMoney(Float transactionMoney) {
		this.transactionMoney = transactionMoney;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
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