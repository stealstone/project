package Baseball.libs.model;

import java.util.Date;

public class CommentBean {
	private int idx;	//댓글 번호
	private int gesipanidx;	//게시판 번호	
	private Date date; 	//댓글 날짜
	private String reply;	//댓글 내용
	private String id;	//댓글 입력한 사람
	
	public CommentBean(){}
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public int getGesipanidx() {
		return gesipanidx;
	}

	public void setGesipanidx(int gesipanidx) {
		this.gesipanidx = gesipanidx;
	}
}
