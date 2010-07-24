package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdBill entity. @author MyEclipse Persistence Tools
 */

public class DdBill implements java.io.Serializable {

	// Fields

	private Integer id;
	private String transaction;
	private Float receive;
	private Float changes;
	private Float totalprice;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdBill() {
	}

	/** full constructor */
	public DdBill(String transaction, Float receive, Float changes,
			Float totalprice, String operator, Timestamp date) {
		this.transaction = transaction;
		this.receive = receive;
		this.changes = changes;
		this.totalprice = totalprice;
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

	public Float getReceive() {
		return this.receive;
	}

	public void setReceive(Float receive) {
		this.receive = receive;
	}

	public Float getChanges() {
		return this.changes;
	}

	public void setChanges(Float changes) {
		this.changes = changes;
	}

	public Float getTotalprice() {
		return this.totalprice;
	}

	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
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