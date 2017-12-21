package Baseball.libs.model;

public class GudanMemberBean {
	private String memId;
	private String gumcomfirm;
	private String gumpostion;
	private int guno;
	
	public GudanMemberBean(){}
	public GudanMemberBean(String memId, String gumcomfirm, String gumpostion,
			int guno) {
		this.memId = memId;
		this.gumcomfirm = gumcomfirm;
		this.gumpostion = gumpostion;
		this.guno = guno;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getGumcomfirm() {
		return gumcomfirm;
	}
	public void setGumcomfirm(String gumcomfirm) {
		this.gumcomfirm = gumcomfirm;
	}
	public String getGumpostion() {
		return gumpostion;
	}
	public void setGumpostion(String gumpostion) {
		this.gumpostion = gumpostion;
	}
	public int getGuno() {
		return guno;
	}
	public void setGuno(int guno) {
		this.guno = guno;
	}
	
	
}
