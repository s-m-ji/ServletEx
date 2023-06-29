package com.library.vo;

public class Book {
	private int no;		// 도서 일련번호
	private String title;	// 도서명
	private String author;	// 작가
	private String publisher;	// 출판사
	private String ofile;	
	private String sfile;	
	private String id;	
	private String rent_yn;	// 도서 대여여부
	private String rent_no;	// 도서 대여번호
	private String rent_date;	// 도서 대여일 startDate
	private String return_exp_date;	// 반납예정일 endDate
	private String return_date;	// 반납일 returnDate
	private int rest_date;	// 잔여일
	private String basket ; // 책 바구니
	private String reserve_no; // 도서 예약번호

	
	// 도서를 추가할 경우 도서명과 작가명만 알고 있으면 생성 가능
	public Book(String title, String author) {
		this.title = title;
		this.author = author;
		// 신규도서이므로 N
		this.rent_yn = "N";
	}
	
	public Book(int no, String title, String rent_yn, String author) {
		super();
		this.no = no;
		this.title = title;
		this.rent_yn = rent_yn;
		this.author = author;
	}
	
	public Book(int no, String title, String author, String publisher, String rent_yn) {
		super();
		this.no = no;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.rent_yn = rent_yn;
	}

	public Book() {
		// TODO Auto-generated constructor stub
	}

	
	
	@Override
	public String toString() {
		String rent_ynStr = "";
		
		// 도서가 rent_yn=Y(대여중)인 경우 대여중으로 표시
		if("Y".equals(getRent_yn())) {
			rent_ynStr="대여중";
		}
		return getNo()
				+ " " + getTitle()
				+ " " + getAuthor()
				+ " " + rent_ynStr;
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getRent_yn() {
		return rent_yn;
	}
	
	public void setRent_yn(String rent_yn) {
		this.rent_yn = rent_yn;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getOfile() {
		return ofile;
	}

	public void setOfile(String ofile) {
		this.ofile = ofile;
	}

	public String getSfile() {
		return sfile;
	}

	public void setSfile(String sfile) {
		this.sfile = sfile;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRent_no() {
		return rent_no;
	}

	public void setRent_no(String rent_no) {
		this.rent_no = rent_no;
	}

	public String getRent_date() {
		return rent_date;
	}

	public void setRent_date(String rent_date) {
		this.rent_date = rent_date;
	}

	public String getReturn_exp_date() {
		return return_exp_date;
	}

	public void setReturn_exp_date(String return_exp_date) {
		this.return_exp_date = return_exp_date;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}

	public int getRest_date() {
		return rest_date;
	}

	public void setRest_date(int rest_date) {
		this.rest_date = rest_date;
	}

	public String getBasket() {
		return basket;
	}

	public void setBasket(String basket) {
		this.basket = basket;
	}

	public String getReserve_no() {
		return reserve_no;
	}

	public void setReserve_no(String reserve_no) {
		this.reserve_no = reserve_no;
	}
	
	
	
}
