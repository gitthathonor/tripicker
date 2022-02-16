package com.tripicker.board.db;

import java.sql.Date;

public class BoardDTO {
	
	private int boardNum;
	private String boardPass;
	private String nickname;
	private String boardTitle;
	private String boardContent;
	private String boardFile;
	private String tag;
	private int likeCount;
	private int readCount;
	private Date bReg_date;
	
	
	public BoardDTO() {
		
	}
	
	public BoardDTO(int boardNum, String boardTitle, String nickname, String boardFile, int readCount, int likeCount) {
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.nickname = nickname;
		this.boardFile = boardFile;
		this.readCount = readCount;
		this.likeCount = likeCount;
	}
	
	public BoardDTO(int boardNum, String boardPass, String nickname, String boardTitle, String boardContent, String boardFile, String tag) {
		this.boardNum = boardNum;
		this.boardPass = boardPass;
		this.boardTitle = boardTitle;
		this.nickname = nickname;
		this.boardContent = boardContent;
		this.boardFile = boardFile;
		this.tag = tag;
	}
	
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardPass() {
		return boardPass;
	}
	public void setBoardPass(String boardPass) {
		this.boardPass = boardPass;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Date getbReg_date() {
		return bReg_date;
	}
	public void setbReg_date(Date bReg_date) {
		this.bReg_date = bReg_date;
	}
	
	
	@Override
	public String toString() {
		return "BoardDTO [boardNum=" + boardNum + ", boardPass=" + boardPass + ", nickname=" + nickname
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardFile=" + boardFile + ", tag="
				+ tag + ", likeCount=" + likeCount + ", readCount=" + readCount + ", bReg_date=" + bReg_date + "]";
	}
	


}
