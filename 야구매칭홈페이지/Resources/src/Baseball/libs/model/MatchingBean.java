package Baseball.libs.model;

import java.util.Date;

public class MatchingBean {
	private int mano;	//매칭 신청 번호
	private int magno;	//게시판 번호	
	private Date madate; 	//경기 날짜
	private String mastart;	//경기 시작 시간
	private String maclose; //경기 종료 시간
	private String maplace;		//경기 지역	
	private String maforteam;	//경기 신청 구단
	private String magname;	//경기 신청 구단
	private String macondition;		//신청 상태
	private String maresult;		//경기 결과

	public MatchingBean(){}
	
	public String getMagname() {
		return magname;
	}

	public void setMagname(String magname) {
		this.magname = magname;
	}

	public String getMaplace() {
		return maplace;
	}

	public void setMaplace(String maplace) {
		this.maplace = maplace;
	}

	public int getMano() {
		return mano;
	}
	public void setMano(int mano) {
		this.mano = mano;
	}
	public int getMagno() {
		return magno;
	}
	public void setMagno(int magno) {
		this.magno = magno;
	}
	public Date getMadate() {
		return madate;
	}
	public void setMadate(Date madate) {
		this.madate = madate;
	}
	public String getMastart() {
		return mastart;
	}
	public void setMastart(String mastart) {
		this.mastart = mastart;
	}
	public String getMaclose() {
		return maclose;
	}
	public void setMaclose(String maclose) {
		this.maclose = maclose;
	}
	
	public String getMaforteam() {
		return maforteam;
	}
	public void setMaforteam(String maforteam) {
		this.maforteam = maforteam;
	}
	
	public String getMacondition() {
		return macondition;
	}
	public void setMacondition(String macondition) {
		this.macondition = macondition;
	}

	public String getMaresult() {
		return maresult;
	}

	public void setMaresult(String maresult) {
		this.maresult = maresult;
	}
	
	
}
