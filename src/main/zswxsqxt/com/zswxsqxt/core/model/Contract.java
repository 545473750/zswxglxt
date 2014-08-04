package com.zswxsqxt.core.model;

import java.util.Date;

import com.opendata.organiz.model.User;

/**
 * 合约
 */
public class Contract {
	
	private String id;
	
	/**
	 * 客户号
	 */
	private String customernr;
	
	/**
	 * 合约号
	 * 生成规则（区号+自然码）
	 */
	private String contractnr;
	
	/**
	 * 客户名称
	 */
	private String customername;
	
	/**
	 * 地址
	 */
	private String address;
	
	/**
	 * 邮编
	 */
	private String postcode;
	
	/**
	 * 签约人
	 */
	private String careofname;
	
	private String telephone;
	private String fax;
	
	/**
	 * 产品英文名
	 */
	private String productDesceng;
	
	/**
	 * 产品中文名
	 */
	private String productDescchn;
	
	/**
	 * 单位数量
	 */
	private String noofUnit;
	
	/**
	 * 单价
	 */
	private String priceUnit;
	
	/**
	 * 总金额
	 */
	private String totalAmount;
	
	/**
	 * 合约开始日期
	 */
	private Date contractStartdate;
	
	/**
	 * 合约结束日期
	 */
	private Date contractEnddate;
	
	/**
	 * 周期
	 */
	private String psContractPeriod;
	
	/**
	 * 创建日期
	 */
	private Date ts;
	
	private User creationUser;
	
	private Date changeTime;
	
	private User changeUser;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCustomernr() {
		return customernr;
	}

	public void setCustomernr(String customernr) {
		this.customernr = customernr;
	}

	public String getContractnr() {
		return contractnr;
	}

	public void setContractnr(String contractnr) {
		this.contractnr = contractnr;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getCareofname() {
		return careofname;
	}

	public void setCareofname(String careofname) {
		this.careofname = careofname;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getProductDesceng() {
		return productDesceng;
	}

	public void setProductDesceng(String productDesceng) {
		this.productDesceng = productDesceng;
	}

	public String getProductDescchn() {
		return productDescchn;
	}

	public void setProductDescchn(String productDescchn) {
		this.productDescchn = productDescchn;
	}

	public String getNoofUnit() {
		return noofUnit;
	}

	public void setNoofUnit(String noofUnit) {
		this.noofUnit = noofUnit;
	}

	public String getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(String priceUnit) {
		this.priceUnit = priceUnit;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPsContractPeriod() {
		return psContractPeriod;
	}

	public void setPsContractPeriod(String psContractPeriod) {
		this.psContractPeriod = psContractPeriod;
	}

	public Date getTs() {
		return ts;
	}

	public void setTs(Date ts) {
		this.ts = ts;
	}

	public User getCreationUser() {
		return creationUser;
	}

	public void setCreationUser(User creationUser) {
		this.creationUser = creationUser;
	}

	public Date getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}

	public User getChangeUser() {
		return changeUser;
	}

	public void setChangeUser(User changeUser) {
		this.changeUser = changeUser;
	}

	public void setContractStartdate(Date contractStartdate) {
		this.contractStartdate = contractStartdate;
	}

	public void setContractEnddate(Date contractEnddate) {
		this.contractEnddate = contractEnddate;
	}

	public Date getContractStartdate() {
		return contractStartdate;
	}

	public Date getContractEnddate() {
		return contractEnddate;
	}
}
