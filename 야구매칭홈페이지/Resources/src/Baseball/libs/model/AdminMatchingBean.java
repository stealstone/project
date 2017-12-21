package Baseball.libs.model;

public class AdminMatchingBean {
	int idx;
	String homegudan;
	String awaygudan;
	String closeTime;
	String con;
	
	public AdminMatchingBean(){}
	public AdminMatchingBean(int idx, String homegudan, String awaygudan,
			String closeTime, String con) {
		
		this.idx = idx;
		this.homegudan = homegudan;
		this.awaygudan = awaygudan;
		this.closeTime = closeTime;
		this.con = con;
	}
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getHomegudan() {
		return homegudan;
	}
	public void setHomegudan(String homegudan) {
		this.homegudan = homegudan;
	}
	public String getAwaygudan() {
		return awaygudan;
	}
	public void setAwaygudan(String awaygudan) {
		this.awaygudan = awaygudan;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}	
}
