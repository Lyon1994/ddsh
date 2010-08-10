package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdWallet entity. @author MyEclipse Persistence Tools
 */

public class DdWallet implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userid;
	private String account;
	private String bankname;
	private String accounter;
	private String location;
	private Float money;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdWallet() {
	}

	/** minimal constructor */
	public DdWallet(String userid) {
		this.userid = userid;
	}

	/** full constructor */
	public DdWallet(String userid, String account, String bankname,
			String accounter, String location, Float money, String operator,
			Timestamp date) {
		this.userid = userid;
		this.account = account;
		this.bankname = bankname;
		this.accounter = accounter;
		this.location = location;
		this.money = money;
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

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getBankname() {
		return this.bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getAccounter() {
		return this.accounter;
	}

	public void setAccounter(String accounter) {
		this.accounter = accounter;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Float getMoney() {
		return this.money;
	}

	public void setMoney(Float money) {
		this.money = money;
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