package com.library.vo;

public class Criteria {

	private String sField_test = ""; // 검색조건
	private String sWord = ""; 	// 검색어
	
	int pageNo = 1; // 요청한 페이지 번호
	int amount = 10; // 한 페이지 당 보여질 게시물 수
	
	int startNo = 1;
	int endNo = 10;

	
	public Criteria(int pageNo) {
		if(pageNo > 0) {
			this.pageNo = pageNo;	
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount-1);
		}
	}
	
	public Criteria(int pageNo, int amount) {
		this.pageNo = pageNo;
		this.amount = amount;
	}

	public Criteria(String sField, String sWord, String pageNoStr, String amountStr) {
		if(sWord != null) {
			this.sField_test = sField;
			this.sWord = sWord;
		} 

		if (pageNoStr != null && !pageNoStr.equals("")
				&& amountStr != null && !amountStr.equals("")) {
			pageNo = Integer.parseInt(pageNoStr);
			amount = Integer.parseInt(amountStr);
			if(pageNo > 0) {
				endNo = pageNo * amount;
				startNo = pageNo * amount - (amount-1);
			} else {
				pageNo = 1;
				amount = 10;
			}	
		}
	}
	
	public Criteria(String sField, String sWord, int pageNo, int amount) {
		this.sField_test = sField;
		this.sWord = sWord;
		this.amount = amount;
		if(pageNo > 0) {
			this.pageNo = pageNo;
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount - 1);
		}
	}

	
	
	public String getsField() {
		return sField_test;
	}
	public void setsField(String sField) {
		this.sField_test = sField;
	}
	public String getsWord() {
		return sWord;
	}
	public void setsWord(String sWord) {
		this.sWord = sWord;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
	
}
