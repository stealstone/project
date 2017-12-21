package Baseball.libs.model;

public class GudanJoinBean {
	private String gname; //구단명
	private String loc; //연고지
	private String gpage; //페이지
	private String gid; //구단주 아이디
	private String intro; //홍보글
	private int tot; //점수
	private String rating; //등급
	private String emblem; //엠블럼
	
	public GudanJoinBean(){}
	public GudanJoinBean(String gname, String loc, String gpage, 
			String gid, String intro, int tot, String rating, String emblem) {
		this.gname = gname;
		this.loc = loc;
		this.gpage = gpage;
		this.gid = gid;
		this.intro = intro;
		this.tot = tot;
		this.rating = rating;
		this.emblem = emblem;
	}

	public String getGudan() {
		return gname;
	}
	public void setGudan(String gudan) {
		this.gname = gudan;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getGpage() {
		return gpage;
	}
	public void setGpage(String gpage) {
		this.gpage = gpage;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getEmblem() {
		return emblem;
	}
	public void setEmblem(String emblem) {
		this.emblem = emblem;
	}
}
