--모델2 방식의 파일첨부형 게시판 테이블 생성
create table mvcboard (
	idx number primary key, 
	name varchar2(50) not null, 
	title varchar2(200) not null, 
	content varchar2(2000) not null, 
	postdate date default sysdate not null, 
	ofile varchar2(200), 
	sfile varchar2(30), 
	downcount number(5) default 0 not null, 
	pass varchar2(50) not null, 
	visitcount number default 0 not null
);

comment on table mvcboard is 'MVC게시판';
comment on column mvcboard.idx is '일련번호. 기본키';
comment on column mvcboard.name is '작성자 이름';
comment on column mvcboard.title is '제목';
comment on column mvcboard.content is '내용';
comment on column mvcboard.postdate is '작성일';
comment on column mvcboard.ofile is '원본 파일명';
comment on column mvcboard.sfile is '저장된 파일명';
comment on column mvcboard.downcount is '다운로드 횟수';
comment on column mvcboard.pass is '비밀번호';
comment on column mvcboard.visitcount is '조회수';