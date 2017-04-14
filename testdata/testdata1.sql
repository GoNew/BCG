
/* Drop Tables */

DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE bookinfo CASCADE CONSTRAINTS;
DROP TABLE class CASCADE CONSTRAINTS;
DROP TABLE genre CASCADE CONSTRAINTS;

/* Create Tables */

CREATE TABLE bookinfo
(
	bookcode varchar2(100) NOT NULL,
	genrecode number NOT NULL,
	title varchar2(4000),
	imgurl varchar2(4000),
	totalscore number,
	wordcloud varchar2(4000),
	graph varchar2(4000),
	PRIMARY KEY (bookcode)
);


CREATE TABLE class
(
	classcode number NOT NULL,
	classname varchar2(100) NOT NULL,
	PRIMARY KEY (classcode)
);


CREATE TABLE genre
(
	genrecode number NOT NULL,
	genrename varchar2(100) NOT NULL,
	PRIMARY KEY (genrecode)
);


CREATE TABLE review
(
	bookcode varchar2(100) NOT NULL,
	classcode number NOT NULL,
	classscore number NOT NULL,
	UNIQUE (bookcode, classcode)
);



/* Create Foreign Keys */

ALTER TABLE review
	ADD FOREIGN KEY (bookcode)
	REFERENCES bookinfo (bookcode)
;


ALTER TABLE review
	ADD FOREIGN KEY (classcode)
	REFERENCES class (classcode)
;


ALTER TABLE bookinfo
	ADD FOREIGN KEY (genrecode)
	REFERENCES genre (genrecode)
;

-- ī�װ�
INSERT INTO class (classcode, classname) VALUES (10, '������');
INSERT INTO class (classcode, classname) VALUES (20, '����');
INSERT INTO class (classcode, classname) VALUES (30, '������');
INSERT INTO class (classcode, classname) VALUES (40, '����');
INSERT INTO class (classcode, classname) VALUES (50, '�۰�');
INSERT INTO class (classcode, classname) VALUES (60, 'ǥ��������');
INSERT INTO class (classcode, classname) VALUES (70, '���ͼ�');


-- å�帣
INSERT INTO genre (genrecode, genrename) VALUES (1, '�Ҽ�');
INSERT INTO genre (genrecode, genrename) VALUES (2, '�ÿ�����');
INSERT INTO genre (genrecode, genrename) VALUES (3, '�����濵');
INSERT INTO genre (genrecode, genrename) VALUES (4, '�ڱ���');
INSERT INTO genre (genrecode, genrename) VALUES (5, '��ȸ����');
INSERT INTO genre (genrecode, genrename) VALUES (6, '���繮ȭ');
INSERT INTO genre (genrecode, genrename) VALUES (7, '�ι�����');
INSERT INTO genre (genrecode, genrename) VALUES (8, '�ڿ�����');

-- å����
INSERT INTO bookinfo (bookcode, genrecode, title, imgurl, totalscore, wordcloud, graph) VALUES ('9788972756194', '1', '���̾� ��ȭ���� ����', 'http://image.yes24.com/momo/TopCate223/MidCate010/22291619(1).jpg', '', '', '');
INSERT INTO bookinfo (bookcode, genrecode, title, imgurl, totalscore, wordcloud, graph) VALUES ('9791186757093', '2', '������ ����', 'http://image.yes24.com/momo/TopCate963/MidCate003/96229066.jpg', '', '', '');


-- åī�װ�����������
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9788972756194', '10', 10);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9788972756194', '20', 20);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9788972756194', '30', 30);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9788972756194', '40', 40);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9788972756194', '50', 50);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9788972756194', '60', 60);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9788972756194', '70', 70);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9791186757093', '10', 20);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9791186757093', '20', 30);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9791186757093', '30', 40);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9791186757093', '40', 50);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9791186757093', '50', 60);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9791186757093', '60', 70);
INSERT INTO review (bookcode, classcode, classscore) VALUES ('9791186757093', '70', 80);
