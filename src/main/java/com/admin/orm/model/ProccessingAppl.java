package com.admin.orm.model;

public class ProccessingAppl {
	Integer applId, custId;
	String appDate;
	Integer lnTypeId;
	Double lnAmt, emiFrom, emiTo;
	Integer nomR;
	Double annInc, dispInc;
	Integer cblScr;
	String appSts, remarks;
	
	public ProccessingAppl() {
		super();
	}

	public ProccessingAppl(Integer applId, Integer custId, String appDate, Integer lnTypeId, Double lnAmt,
			Double emiFrom, Double emiTo, Integer nomR, Double annInc, Double dispInc, Integer cblScr, String appSts,
			String remarks) {
		super();
		this.applId = applId;
		this.custId = custId;
		this.appDate = appDate;
		this.lnTypeId = lnTypeId;
		this.lnAmt = lnAmt;
		this.emiFrom = emiFrom;
		this.emiTo = emiTo;
		this.nomR = nomR;
		this.annInc = annInc;
		this.dispInc = dispInc;
		this.cblScr = cblScr;
		this.appSts = appSts;
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "ProccessingAppl [applId=" + applId + ", custId=" + custId + ", appDate=" + appDate + ", lnTypeId="
				+ lnTypeId + ", lnAmt=" + lnAmt + ", emiFrom=" + emiFrom + ", emiTo=" + emiTo + ", nomR=" + nomR
				+ ", annInc=" + annInc + ", dispInc=" + dispInc + ", cblScr=" + cblScr + ", appSts=" + appSts
				+ ", remarks=" + remarks + "]";
	}

	public Integer getApplId() {
		return applId;
	}

	public void setApplId(Integer applId) {
		this.applId = applId;
	}

	public Integer getCustId() {
		return custId;
	}

	public void setCustId(Integer custId) {
		this.custId = custId;
	}

	public String getAppDate() {
		return appDate;
	}

	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}

	public Integer getLnTypeId() {
		return lnTypeId;
	}

	public void setLnTypeId(Integer lnTypeId) {
		this.lnTypeId = lnTypeId;
	}

	public Double getLnAmt() {
		return lnAmt;
	}

	public void setLnAmt(Double lnAmt) {
		this.lnAmt = lnAmt;
	}

	public Double getEmiFrom() {
		return emiFrom;
	}

	public void setEmiFrom(Double emiFrom) {
		this.emiFrom = emiFrom;
	}

	public Double getEmiTo() {
		return emiTo;
	}

	public void setEmiTo(Double emiTo) {
		this.emiTo = emiTo;
	}

	public Integer getNomR() {
		return nomR;
	}

	public void setNomR(Integer nomR) {
		this.nomR = nomR;
	}

	public Double getAnnInc() {
		return annInc;
	}

	public void setAnnInc(Double annInc) {
		this.annInc = annInc;
	}

	public Double getDispInc() {
		return dispInc;
	}

	public void setDispInc(Double dispInc) {
		this.dispInc = dispInc;
	}

	public Integer getCblScr() {
		return cblScr;
	}

	public void setCblScr(Integer cblScr) {
		this.cblScr = cblScr;
	}

	public String getAppSts() {
		return appSts;
	}

	public void setAppSts(String appSts) {
		this.appSts = appSts;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}
