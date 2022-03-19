package com.tripicker.comment.db;

import java.sql.Timestamp;

public class CommentDTO {
	private int commentNum; 
	private int boardNum;
	private String nickname;
	private String content;
	private Timestamp cReg_date;
	
	@Override
	public String toString() {
		return "CommentDTO [commentNum=" + commentNum + ", boardNum=" + boardNum + ", nickname=" + nickname
				+ ", content=" + content + ", cReg_date=" + cReg_date + "]";
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getcReg_date() {
		return cReg_date;
	}
	public void setcReg_date(Timestamp cReg_date) {
		this.cReg_date = cReg_date;
	}
	
	
	
}
