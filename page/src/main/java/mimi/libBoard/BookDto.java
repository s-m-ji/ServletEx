package mimi.libBoard;

public class BookDto {
	
	private String idx;
	private String title;
	private String writer;
	private String publisher;
	private String post_date;
	private String rent_yn;
	private String rent_date;
	private String return_date;
	private String return_exp_date;
	private String ebook_file;
	private int rent_count;
	private String review;
	
	
	public BookDto() {
	}

	
	
	public BookDto(String idx, String title, String writer, String publisher, String rent_yn, String rent_date,
			String return_date, String return_exp_date, int rent_count) {
		super();
		this.idx = idx;
		this.title = title;
		this.writer = writer;
		this.publisher = publisher;
		this.rent_yn = rent_yn;
		this.rent_date = rent_date;
		this.return_date = return_date;
		this.return_exp_date = return_exp_date;
		this.rent_count = rent_count;
	}



	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}

	public String getRent_yn() {
		return rent_yn;
	}

	public void setRent_yn(String rent_yn) {
		this.rent_yn = rent_yn;
	}

	public String getRent_date() {
		return rent_date;
	}

	public void setRent_date(String rent_date) {
		this.rent_date = rent_date;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}

	public String getReturn_exp_date() {
		return return_exp_date;
	}

	public void setReturn_exp_date(String return_exp_date) {
		this.return_exp_date = return_exp_date;
	}

	public String getEbook_file() {
		return ebook_file;
	}

	public void setEbook_file(String ebook_file) {
		this.ebook_file = ebook_file;
	}

	public int getRent_count() {
		return rent_count;
	}

	public void setRent_count(int rent_count) {
		this.rent_count = rent_count;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	
}
