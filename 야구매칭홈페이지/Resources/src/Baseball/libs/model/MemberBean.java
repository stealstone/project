package Baseball.libs.model;

import java.util.Date;

public class MemberBean {
	private String userid;

	private String name;
	private String address;
	private String email;
	private String sex;
	private Date birthday;
	private String position;
	private String tell;
	private String grade;
	private String gudan;
	private String gpage;
	
	public MemberBean(){}
	public MemberBean(String userid, String name, Date birthday, String email,
			String address, String tell, String position,
			String gudan, String grade, String sex, String gpage) {
		
		this.userid = userid;
		this.name = name;
		this.address = address;
		this.email = email;
		this.sex = sex;
		this.birthday = birthday;
		this.position = position;
		this.tell = tell;
		this.grade = grade;
		this.gudan = gudan;
		this.setGpage(gpage);
	}

	public MemberBean(String userid, String name, String gudan, String grade) {		
		this.userid = userid;
		this.name = name;
		this.grade = grade;
		this.gudan = gudan;		
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}


	public String getTell() {
		return tell;
	}


	public void setTell(String tell) {
		this.tell = tell;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public String getGudan() {
		return gudan;
	}


	public void setGudan(String gudan) {
		this.gudan = gudan;
	}
	public String getGpage() {
		return gpage;
	}
	public void setGpage(String gpage) {
		this.gpage = gpage;
	}
	
}
