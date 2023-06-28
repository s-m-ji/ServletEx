/**
 * 
 */
// window.onload = () => {
	  function rentBook(){
		// 체크박스가 선택된 요소의 value값을 ,(콤마)로 연결하고 삭제 요청
		 delNoList = document.querySelectorAll('[name=delNo]:checked');
		 let delNo = "";
		 delNoList.forEach((e)=>{
			delNo += e.value + ','; 
		 });
		 delNo = delNo.substr(0, delNo.length-1);
		 
		 console.log(delNo);
		 
		 searchForm.action = "../book/rent.book";
		 searchForm.delNo.value = delNo;
		 searchForm.submit();
	 }
	 
	 function returnBook(){
		// 체크박스가 선택된 요소의 value값을 ,(콤마)로 연결하고 삭제 요청
		 delNoList = document.querySelectorAll('[name=delNo]:checked');
		 let delNo = "";
		 delNoList.forEach((e)=>{
			delNo += e.value + ','; 
		 });
		 delNo = delNo.substr(0, delNo.length-1);
		 
		 console.log(delNo);
		 
		 searchForm.action = "../book/return.book";
		 searchForm.delNo.value = delNo;
		 searchForm.submit();
	 }
	 
	 function deleteBook(){
		 // 체크박스가 선택된 요소의 value값을 ,(콤마)로 연결하고 삭제 요청
		 delNoList = document.querySelectorAll('[name=delNo]:checked');
		 let delNo = "";
		 delNoList.forEach((e)=>{
			delNo += e.value + ','; 
		 });
		 delNo = delNo.substr(0, delNo.length-1);
		 
		 console.log(delNo);
		 
		 searchForm.action = "../book/delete.book";
		 searchForm.delNo.value = delNo;
		 searchForm.submit();
	 }
	 /*
	 let message = "${message}";
	 if(message != null && "" != message){
		 alert(message);
	 }
	 */
 //}