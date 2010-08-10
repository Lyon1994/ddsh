package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdTransaction entity. @author MyEclipse Persistence Tools
 */

public class DdTransaction implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userid;
	private String user;
	private String type;
	private String status;
	private Float money;
	private String memo;
	private Timestamp submitdate;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdTransaction() {
	}

	/** minimal constructor */
	public DdTransaction(String userid, String type, String status,
			Float money, Timestamp submitdate) {
		this.userid = userid;
		this.type = type;
		this.status = status;
		this.money = money;
		this.submitdate = submitdate;
	}

	/** full constructor */
	public DdTransaction(String userid, String user, String type,
			String status, Float money, String memo, Timestamp submitdate,
			String operator, Timestamp date) {
		this.userid = userid;
		this.user = user;
		this.type = type;
		this.status = status;
		this.money = money;
		this.memo = memo;
		this.submitdate = submitdate;
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

	public String getUser() {
		return this.user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Float getMoney() {
		return this.money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Timestamp getSubmitdate() {
		return this.submitdate;
	}

	public void setSubmitdate(Timestamp submitdate) {
		this.submitdate = submitdate;
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