package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdNotice entity. @author MyEclipse Persistence Tools
 */

public class DdNotice implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String detail;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdNotice() {
	}

	/** full constructor */
	public DdNotice(String name, String detail, String operator, Timestamp date) {
		this.name = name;
		this.detail = detail;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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