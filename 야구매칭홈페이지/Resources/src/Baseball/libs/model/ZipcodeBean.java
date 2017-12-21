package Baseball.libs.model;

public class ZipcodeBean {
	private String sido;
	private String gugun;
	private String dong;
	
	public ZipcodeBean(){}
	
	public ZipcodeBean(String sido, String gugun, String dong) {
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
	}
	
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	
	@Override
	public String toString(){
		return String.format("%s %s %s",  this.sido, this.gugun, this.dong);
	}
}













