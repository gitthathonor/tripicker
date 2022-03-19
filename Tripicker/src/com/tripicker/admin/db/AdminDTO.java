package com.tripicker.admin.db;

import java.sql.Date;

public class AdminDTO {
	private String id;
	private String pass;
	private String name;
	private String nickname;
	private String email;
	private String addr;
	private int grade;
	private Date reg_date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "AdminDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", nickname=" + nickname + ", email="
				+ email + ", addr=" + addr + ", grade=" + grade + ", reg_date=" + reg_date + "]";
	}
	
	
}
