package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdSubmit entity. @author MyEclipse Persistence Tools
 */

public class DdSubmit implements java.io.Serializable {

	// Fields

	private Integer id;
	private String barcode;
	private Integer amount;
	private String place;
	private String ems;
	private Timestamp begin;
	private Timestamp end;
	private String pay;
	private Float money;
	private String memo;
	private Timestamp submitdate;
	private Timestamp date;
	private String operator;

	// Constructors

	/** default constructor */
	public DdSubmit() {
	}

	/** minimal constructor */
	public DdSubmit(String barcode, Integer amount, String place, String ems,
			Timestamp begin, Timestamp end, String pay, Float money,
			Timestamp submitdate) {
		this.barcode = barcode;
		this.amount = amount;
		this.place = place;
		this.ems = ems;
		this.begin = begin;
		this.end = end;
		this.pay = pay;
		this.money = money;
		this.submitdate = submitdate;
	}

	/** full constructor */
	public DdSubmit(String barcode, Integer amount, String place, String ems,
			Timestamp begin, Timestamp end, String pay, Float money,
			String memo, Timestamp submitdate, Timestamp date, String operator) {
		this.barcode = barcode;
		this.amount = amount;
		this.place = place;
		this.ems = ems;
		this.begin = begin;
		this.end = end;
		this.pay = pay;
		this.money = money;
		this.memo = memo;
		this.submitdate = submitdate;
		this.date = date;
		this.operator = operator;
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

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getEms() {
		return this.ems;
	}

	public void setEms(String ems) {
		this.ems = ems;
	}

	public Timestamp getBegin() {
		return this.begin;
	}

	public void setBegin(Timestamp begin) {
		this.begin = begin;
	}

	public Timestamp getEnd() {
		return this.end;
	}

	public void setEnd(Timestamp end) {
		this.end = end;
	}

	public String getPay() {
		return this.pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
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

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

}