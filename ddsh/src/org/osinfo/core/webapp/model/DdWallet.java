package org.osinfo.core.webapp.model;

/**
 * DdWallet entity. @author MyEclipse Persistence Tools
 */

public class DdWallet implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userid;
	private String bankname;
	private String location;
	private String accounter;
	private Integer money;
	private String account;

	// Constructors

	/** default constructor */
	public DdWallet() {
	}

	/** full constructor */
	public DdWallet(String userid, String bankname, String location,
			String accounter, Integer money, String account) {
		this.userid = userid;
		this.bankname = bankname;
		this.location = location;
		this.accounter = accounter;
		this.money = money;
		this.account = account;
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

	public String getBankname() {
		return this.bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAccounter() {
		return this.accounter;
	}

	public void setAccounter(String accounter) {
		this.accounter = accounter;
	}

	public Integer getMoney() {
		return this.money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

}