drop table board;
drop table users;

create table users(
	id 			varchar2(28) 	primary key,
	password 	varchar2(8)		not null,
	name 		varchar2(30)	not null,
	role 		varchar2(5)		default 'User'
)

create table board(
	seq			number(5) 		primary key,
	title		varchar2(200)	not null,
	nickname	varchar2(30)	not null,
	content		varchar2(2000)	not null,
	regdate		date 			default sysdate,
	cnt			number(5)		default 0,
	userid		varchar2(8)
)

insert into users values('hong', 'hong123', '홍길동', 'Admin');
insert into users values('abc', 'abc123', '임꺽정', 'User');
insert into users values('guest', 'guest123', '일지매', 'Guest');

insert into board(seq, title, nickname, content, regdate, userid) 
values(1, '첫 번째 게시물', '홍길동', '첫 번째 게시물 내용.', '2017-02-05', 'hong');

insert into board(seq, title, nickname, content, regdate, userid) 
values(2, '두 번째 게시물', '홍길동', '두 번째 게시물 내용.', '2017-03-15', 'hong');

insert into board(seq, title, nickname, content, regdate, userid) 
values(3, '세 번째 게시물', '홍길동', '세 번째 게시물 내용.', '2017-03-03', 'hong');

insert into board(seq, title, nickname, content, regdate, userid) 
values(4, '네 번째 게시물', '홍길동', '네 번째 게시물 내용.', '2017-05-17', 'hong');

insert into board(seq, title, nickname, content, regdate, userid) 
values(5, '다섯 번째 게시물', '일지매', '다섯 번째 게시물 내용.', '2017-05-19', 'guest');

insert into board(seq, title, nickname, content, regdate, userid) 
values(6, '여섯 번째 게시물', '일지매', '여섯 번째 게시물 내용.', '2017-12-25', 'guest');

insert into board(seq, title, nickname, content, regdate, userid) 
values((select nvl(max(seq), 0)+1 from board), '일곱 번째 게시물', '일지매', '일곱 번째 게시물 내용.', '2017-12-25', 'guest');


select * from users;

select * from board;

select * from board order by seq desc

select * from board where seq = 7


-- insert
select nvl(max(seq), 0) + 1 from board

insert into board(seq, nickname, title, content) 
values((select nvl(max(seq), 0) + 1 from board), 'test', 'test title', 'test Content')

-- update
update board set title = '변경된 값', content='변경된 컨텐츠' where seq = 8


-- delete
delete from board where seq = 8


-- USER 확인
select * from users where id = 'abc' and password = 'abc123'



