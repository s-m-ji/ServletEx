package dto;

public class Board {
	
	private int num;
	private String title;
	private String content;
	private String id;
	private String postdate;
	private int count;

	public Board() {
	}
	
	public Board(int num, String title, String content, String id, String postdate, int count) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.postdate = postdate;
		this.count = count;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	
}
