package com.admin.orm.model;

public class ProccessingAppl {
	String applId, custId;
	String appDate;
	String lnTypeId;
	String lnAmt, emiFrom, emiTo;
	String nomR;
	String annInc, dispInc;
	String cblScr;
	String appSts, remarks;
	
	public ProccessingAppl() {
		super();
	}

	@Override
	public String toString() {
		return "ProccessingAppl [applId=" + applId + ", custId=" + custId + ", appDate=" + appDate + ", lnTypeId="
				+ lnTypeId + ", lnAmt=" + lnAmt + ", emiFrom=" + emiFrom + ", emiTo=" + emiTo + ", nomR=" + nomR
				+ ", annInc=" + annInc + ", dispInc=" + dispInc + ", cblScr=" + cblScr + ", appSts=" + appSts
				+ ", remarks=" + remarks + "]";
	}

	public ProccessingAppl(String applId, String custId, String appDate, String lnTypeId, String lnAmt, String emiFrom,
			String emiTo, String nomR, String annInc, String dispInc, String cblScr, String appSts, String remarks) {
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

	public String getApplId() {
		return applId;
	}

	public void setApplId(String applId) {
		this.applId = applId;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getAppDate() {
		return appDate;
	}

	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}

	public String getLnTypeId() {
		return lnTypeId;
	}

	public void setLnTypeId(String lnTypeId) {
		this.lnTypeId = lnTypeId;
	}

	public String getLnAmt() {
		return lnAmt;
	}

	public void setLnAmt(String lnAmt) {
		this.lnAmt = lnAmt;
	}

	public String getEmiFrom() {
		return emiFrom;
	}

	public void setEmiFrom(String emiFrom) {
		this.emiFrom = emiFrom;
	}

	public String getEmiTo() {
		return emiTo;
	}

	public void setEmiTo(String emiTo) {
		this.emiTo = emiTo;
	}

	public String getNomR() {
		return nomR;
	}

	public void setNomR(String nomR) {
		this.nomR = nomR;
	}

	public String getAnnInc() {
		return annInc;
	}

	public void setAnnInc(String annInc) {
		this.annInc = annInc;
	}

	public String getDispInc() {
		return dispInc;
	}

	public void setDispInc(String dispInc) {
		this.dispInc = dispInc;
	}

	public String getCblScr() {
		return cblScr;
	}

	public void setCblScr(String cblScr) {
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
