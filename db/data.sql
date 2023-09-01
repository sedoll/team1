-- db 더미 데이터 입력

-- memmber
-- 관리자
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('admin', '1234', '관리자', 'admin@edu.com', '010-1234-5678', 0);

-- 학생
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('hong', 'h5678', '홍길동', 'hong@edu.com', '010-1111-2222', 1);
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('kang', 'kang12', '강감찬', 'kang@edu.com', '010-3333-4444', 1);
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('kim', '1234', '김철수', 'son@edu.com', '010-3333-2222', 1);
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('sej123', '1234', '강감찬', 'sej@edu.com', '010-2323-4444', 1);

-- 선생
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('son', 'sony1234', '손흥민', 'son@edu.com', '010-5555-6666', 2);
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('lee', 'lee4885', '이순신', 'lee@edu.com', '010-8765-4321', 2);
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('kong', '1234', '오킹콩', 'kong@edu.com', '010-3828-6666', 2);
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('usin', '1234', '김유신', 'usin@edu.com', '010-8765-1234', 2);
	
-- board
-- 본문 더미 자유게시판
INSERT INTO board(title, content, author) VALUES('본문 제목1', '본문 내용1', 'admin');
UPDATE board SET par=bno WHERE bno=1;

INSERT INTO board(title, content, author) VALUES('본문 제목2', '본문 내용2', 'hong'); 
UPDATE board SET par=bno WHERE bno=2;

INSERT INTO board(title, content, author) VALUES('본문 제목3', '본문 내용3', 'kang');
UPDATE board SET par=bno WHERE bno=3;

INSERT INTO board(title, content, author) VALUES('본문 제목4', '본문 내용4', 'lee');
UPDATE board SET par=bno WHERE bno=4;

INSERT INTO board(title, content, author) VALUES('본문 제목5', '본문 내용5', 'son');
UPDATE board SET par=bno WHERE bno=5;

INSERT INTO board(title, content, author) VALUES('본문 제목6', '본문 내용6', 'hong');
UPDATE board SET par=bno WHERE bno=6; 


-- 댓글 더미 
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글 내용1', 'son', 1, 1);

INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글 내용2', 'admin', 1, 2);

INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글 내용3', 'hong', 1, 3);

INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글 내용4', 'kang', 1, 4);

INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글 내용5', 'lee', 1, 5);