package com.tripicker.plan.db;

import java.sql.Date;

public class PlanDTO {
	
	private int planNum; //전체 계획 순서
	private String id;
	private Date startDate;
	private Date lastDate;
	private String period;
	private String pCityName;
	private String pSpotName;
	private int planSeqNum; //id별 계획 순서
	
	
	
	public int getPlanNum() {
		return planNum;
	}
	public void setPlanNum(int planNum) {
		this.planNum = planNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getpCityName() {
		return pCityName;
	}
	public void setpCityName(String pCityName) {
		this.pCityName = pCityName;
	}
	public String getpSpotName() {
		return pSpotName;
	}
	public void setpSpotName(String pSpotName) {
		this.pSpotName = pSpotName;
	}
	
	public int getPlanSeqNum() {
		return planSeqNum;
	}
	public void setPlanSeqNum(int planSeqNum) {
		this.planSeqNum = planSeqNum;
	}
	
	
	@Override
	public String toString() {
		return "PlanDTO [planNum=" + planNum + ", id=" + id + ", startDate=" + startDate + ", lastDate=" + lastDate
				+ ", period=" + period + ", pCityName=" + pCityName + ", pSpotName=" + pSpotName + ", planSeqNum="
				+ planSeqNum + "]";
	}
	
	

}
