package com.tripicker.notice.db;

import java.sql.Date;

public class NoticeDTO {
	private int nNum;
	private String nTitle;
	private String nContent;
	private String file;
	private int re_ref;        
    private int re_lev;        
    private int re_seq;
	private int nReadCount;
	private Date nReg_date;
	
	public int getnNum() {
		return nNum;
	}
	public void setnNum(int nNum) {
		this.nNum = nNum;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public int getnReadCount() {
		return nReadCount;
	}
	public void setnReadCount(int nReadCount) {
		this.nReadCount = nReadCount;
	}
	public Date getnReg_date() {
		return nReg_date;
	}
	public void setnReg_date(Date nReg_date) {
		this.nReg_date = nReg_date;
	}
	@Override
	public String toString() {
		return "BoardDTO [nNum=" + nNum + ", nTitle=" + nTitle + ", nContent=" + nContent + ", file=" + file
				+ ", re_ref=" + re_ref + ", re_lev=" + re_lev + ", re_seq=" + re_seq + ", nReadCount=" + nReadCount
				+ ", nReg_date=" + nReg_date + "]";
	}
	
	
	
	
	
}
