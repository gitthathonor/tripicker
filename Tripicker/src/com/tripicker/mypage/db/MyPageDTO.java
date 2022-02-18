package com.tripicker.mypage.db;

import java.sql.Date;

public class MyPageDTO {

	// 회원정보를 담는 객체(member 테이블)
		private String id;
		private String pass;
		private String name;
		private String nickname;
		private int age;
		private String gender; 
		private String email;
		private String addr;
		private int grade; //회원등급(일반1~3,관리자4)
		public int getGrade() {
			return grade;
		}
		public void setGrade(int grade) {
			this.grade = grade;
		}

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
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
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
		public Date getReg_date() {
			return reg_date;
		}
		public void setReg_date(Date reg_date) {
			this.reg_date = reg_date;
		}
		
		@Override
		public String toString() {
			return "MyPageDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", nickname=" + nickname + ", age="
					+ age + ", gender=" + gender + ", email=" + email + ", addr=" + addr + ", grade=" + grade
					+ ", reg_date=" + reg_date + "]";
		}
		
		
		
		
		
	
	
}
