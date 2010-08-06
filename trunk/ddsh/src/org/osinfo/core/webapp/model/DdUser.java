package org.osinfo.core.webapp.model;

import java.sql.Timestamp;

/**
 * DdUser entity. @author MyEclipse Persistence Tools
 */

public class DdUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userid;
	private String name;
	private String brand;
	private String password;
	private String type;
	private String status;
	private String idcard;
	private String sex;
	private String address;
	private String mobile;
	private String telephone;
	private String fax;
	private String mail;
	private Timestamp submitdate;
	private String operator;
	private Timestamp date;

	// Constructors

	/** default constructor */
	public DdUser() {
	}

	/** minimal constructor */
	public DdUser(String userid, String name, String password, String type,
			String status) {
		this.userid = userid;
		this.name = name;
		this.password = password;
		this.type = type;
		this.status = status;
	}

	/** full constructor */
	public DdUser(String userid, String name, String brand, String password,
			String type, String status, String idcard, String sex,
			String address, String mobile, String telephone, String fax,
			String mail, Timestamp submitdate, String operator, Timestamp date) {
		this.userid = userid;
		this.name = name;
		this.brand = brand;
		this.password = password;
		this.type = type;
		this.status = status;
		this.idcard = idcard;
		this.sex = sex;
		this.address = address;
		this.mobile = mobile;
		this.telephone = telephone;
		this.fax = fax;
		this.mail = mail;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
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