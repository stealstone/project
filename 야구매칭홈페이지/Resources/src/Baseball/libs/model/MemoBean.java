package Baseball.libs.model;

public class MemoBean {
	int idx;	
	String sendid;
	String receivid;
	String content;
	String date;
	
	public MemoBean(){ }
	
	public MemoBean(int idx, String sendid, String receivid, String content,
			String date) {
		
		this.idx = idx;		
		this.sendid = sendid;
		this.receivid = receivid;
		this.content = content;
		this.date = date;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}	

	public String getSendid() {
		return sendid;
	}

	public void setSendid(String sendid) {
		this.sendid = sendid;
	}

	public String getReceivid() {
		return receivid;
	}

	public void setReceivid(String receivid) {
		this.receivid = receivid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}	
	
	
}
