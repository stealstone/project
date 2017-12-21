package Baseball.libs.model;

import java.util.Date;

public class MemberJoinBean {
	private String userid;
	private String passwd;
	private String name;
	private String address;
	private String email;
	private String sex;
	private Date birthday;
	private String position;
	private String tell;
	private String grade;
	private String club;
	
	public MemberJoinBean(){}
	public MemberJoinBean(String userid, String passwd,
			String name, String address, String email, String sex,
			Date birthday, String position, String tell, String grade, String club) {
		
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.address = address;
		this.email = email;
		this.sex = sex;
		this.birthday = birthday;
		this.position = position;
		this.tell = tell;
		this.grade = grade;
		this.club = club;
		
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
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
	public String getClub() {
		return club;
	}
	public void setClub(String club) {
		this.club = club;
	}
	
}