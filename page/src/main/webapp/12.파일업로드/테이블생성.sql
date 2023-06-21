--파일 업로드와 다운로드를 위한 테이블 생성
create table myfile (
    idx number primary key          -- 시퀀스
    , name varchar2(50) not null    -- form 전달
    , title varchar2(200) not null  -- form 전달
    , cate varchar2(30)             -- form 전달
    , ofile varchar2(100) not null 
    , sfile varchar2(30) not null 
    , postdate date default sysdate not null
);

-- 시퀀스 생성
create sequence seq_myfile_num;

-- 데이터 입력
insert into myfile values 
	(seq_myfile_num.nextval, '작성자1', '제목1' ,'카테고리1' ,'원본파일명', '수정파일명', sysdate);

-- 데이터 조회
select * from myfile order by idx desc;

-- 코멘트 입력
COMMENT ON TABLE myfile IS '파일 업로드' ;
COMMENT ON COLUMN myfile.postdate IS '등록한 날짜';