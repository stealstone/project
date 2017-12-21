package Baseball.libs.model;

public class MainTabBean {
	private int index;
	private String title;
	private String date;
	
	public MainTabBean(){}

	public MainTabBean(int index, String title, String date) {
		super();
		this.index = index;
		this.title = title;
		this.date = date;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}	
}
