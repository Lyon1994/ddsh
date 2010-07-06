package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdBack entity. @author MyEclipse Persistence Tools
 */

public class DdBack implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer topperid;
	private String reson;
	private Integer amount;
	private Integer operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdBack() {
	}

	/** full constructor */
	public DdBack(Integer topperid, String reson, Integer amount,
			Integer operator, Timestamp date) {
		this.topperid = topperid;
		this.reson = reson;
		this.amount = amount;
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

	public String getReson() {
		return this.reson;
	}

	public void setReson(String reson) {
		this.reson = reson;
	}

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
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