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
	private String from;
	private String to;
	private String type;
	private Float money;
	private String memo;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdTransaction() {
	}

	/** full constructor */
	public DdTransaction(String userid, String shop, String from, String to,
			String type, Float money, String memo, String operator,
			Timestamp date) {
		this.userid = userid;
		this.shop = shop;
		this.from = from;
		this.to = to;
		this.type = type;
		this.money = money;
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

	public String getFrom() {
		return this.from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return this.to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
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