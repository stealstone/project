package Baseball.libs.model;

public class GudanBean {
	private int guno;
	private String gname; //���ܸ�
	private String loc; //������
	private String gpage; //������
	private String gid; //������ ���̵�
	private String intro; //ȫ����
	private int tot; //����
	private String rating; //���
	private String emblem; //����
	
	public GudanBean(){}
	public GudanBean(int guno, String gname, String loc, String gpage, 
			String gid, String intro, int tot, String rating, String emblem) {
		this.guno = guno;
		this.gname = gname;
		this.loc = loc;
		this.gpage = gpage;
		this.gid = gid;
		this.intro = intro;
		this.tot = tot;
		this.rating = rating;
		this.emblem = emblem;
	}
	public GudanBean(String gname, String gid, String rating,  int tot) {
		this.gname = gname;		
		this.gid = gid;		
		this.tot = tot;
		this.rating = rating;		
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
	public int getGuno() {
		return guno;
	}
	public void setGuno(int guno) {
		this.guno = guno;
	}
	
}
