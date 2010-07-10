package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdBack entity. @author MyEclipse Persistence Tools
 */

public class DdBack implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer topperid;
	private String userid;
	private String name;
	private Integer amount;
	private String reason;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdBack() {
	}

	/** full constructor */
	public DdBack(Integer topperid, String userid, String name, Integer amount,
			String reason, String operator, Timestamp date) {
		this.topperid = topperid;
		this.userid = userid;
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

	public Integer getTopperid() {
		return this.topperid;
	}

	public void setTopperid(Integer topperid) {
		this.topperid = topperid;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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