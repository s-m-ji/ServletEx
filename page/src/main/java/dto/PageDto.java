package dto;

public class PageDto {

	int startNo; 	// 페이징 블록 시작번호
	int endNo; 		// 페이징 블록 끝번호
	int realEndNo; 	// 게시물 끝번호
	boolean prev, next; // 이전, 다음 버튼 (true: 화면에 표시)
	
	int block = 2; // 페이징 블록 버튼 개수
	
	int total;		// 총 게시글 수
	Criteria cr;	// 페이지 번호, 페이지당 게시글 수
	
	
	// 페이징 블록을 생성하기 위해 필요한 요소
	public PageDto() {
	}
	
	public PageDto(int total, Criteria cr) {
		super();
		this.total = total;
		this.cr = cr;
		
		// n쪽 요청 : 올림(n/10.0) * 10
		endNo = (int)Math.ceil(cr.getPageNo()/(block*1.0)) * block;
		startNo = endNo - (block-1);
		/*
		 * endNo = (int)Math.ceil(cr.getPageNo()/10.0) * 10; startNo = endNo - (10-1);
		 */		
		// 예시: 총 게시글이 55개 경우 55/10=5.5 
		realEndNo = (int)Math.ceil((total*1.0)/cr.getAmount());
		
		// 기본 셋팅된 페이징블록 버튼 10개에서 총 게시글 수에 따라 진짜 끝 버튼을 조정
		endNo = endNo > realEndNo ? realEndNo : endNo;
		
		prev = startNo > 1 ? true : false;
		next = endNo == realEndNo ? false : true;
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

	public int getRealEndNo() {
		return realEndNo;
	}

	public void setRealEndNo(int realEndNo) {
		this.realEndNo = realEndNo;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCr() {
		return cr;
	}

	public void setCr(Criteria cr) {
		this.cr = cr;
	}

	
	
}
