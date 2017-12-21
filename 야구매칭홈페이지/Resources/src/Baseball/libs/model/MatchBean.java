package Baseball.libs.model;

import java.util.Date;

public class MatchBean {
	private int matno;
	private int mano;
	private Date matdate;
	private String matgname;
	private String maforteams;
	private String maresult;
	
	public MatchBean(){}
	
	public Date getMatdate() {
		return matdate;
	}

	public void setMatdate(Date matdate) {
		this.matdate = matdate;
	}


	public int getMatno() {
		return matno;
	}

	public void setMatno(int matno) {
		this.matno = matno;
	}

	public int getMano() {
		return mano;
	}

	public void setMano(int mano) {
		this.mano = mano;
	}

	public String getMatgname() {
		return matgname;
	}

	public void setMatgname(String matgname) {
		this.matgname = matgname;
	}

	public String getMaforteams() {
		return maforteams;
	}

	public void setMaforteams(String maforteams) {
		this.maforteams = maforteams;
	}

	public String getMaresult() {
		return maresult;
	}

	public void setMaresult(String maresult) {
		this.maresult = maresult;
	}
		
}
