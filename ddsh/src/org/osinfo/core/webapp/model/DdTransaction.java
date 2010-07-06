package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdTransaction entity. @author MyEclipse Persistence Tools
 */

public class DdTransaction implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userid;
	private String fromAccount;
	private String toAccount;
	private String transactionType;
	private Float transactionMoney;
	private String memo;
	private Integer operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdTransaction() {
	}

	/** full constructor */
	public DdTransaction(Integer userid, String fromAccount, String toAccount,
			String transactionType, Float transactionMoney, String memo,
			Integer operator, Timestamp date) {
		this.userid = userid;
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

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
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

	public Integer getOperator() {
		return this.operator;
	}

	public void setOperator(Integer operator) {
		this.operator = operator;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

}