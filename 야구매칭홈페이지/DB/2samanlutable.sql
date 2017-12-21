
CREATE TABLE ZIPCODE (
	seq 	NUMBER(5),
	zicpdoe	VARCHAR2(7),
	sido	VARCHAR2(15),
	gugun 	VARCHAR2(50),
	dong	VARCHAR2(200),
	bunji 	VARCHAR2(200)
);
ALTER TABLE ZIPCODE
MODIFY
(
	seq	 NUMBER(5) CONSTRAINT zipcode_seq_nn NOT NULL,
	zicpdoe   VARCHAR2(7) CONSTRAINT zipcode_zipcode_nn NOT NULL,
	sido   VARCHAR2(15)  CONSTRAINT  zipcode_sido_nn NOT NULL,
	gugun   VARCHAR2(50)  CONSTRAINT  zipcode_gugun_nn NOT NULL,
	dong   VARCHAR2(200)  CONSTRAINT  zipcode_dong_nn NOT NULL,
	bunji   VARCHAR2(200)  CONSTRAINT  zipcode_bunji_nn NOT NULL
);

ALTER TABLE ZIPCODE
	ADD CONSTRAINT  seq_pk PRIMARY KEY (seq);


CREATE TABLE MEMBER
(
	id                 VARCHAR2(20)  NOT NULL,
	pwd                VARCHAR2(20)  NOT NULL,
	mname		      	  CHAR(20)	NOT NULL,
	birthday               DATE  NOT NULL,
	email              VARCHAR2(30)  NOT NULL,
	maddress		VARCHAR2(500)  NOT NULL,
	phone              VARCHAR2(20)  NOT NULL,
	mposition           VARCHAR2(15)  NOT NULL,
	club            VARCHAR2(20)  NULL,
	rating    		  VARCHAR2(5)  NOT NULL,
	gender		VARCHAR2(10) NOT NULL,
	gpage		VARCHAR2(200)	NULL
);
ALTER TABLE MEMBER
	ADD CONSTRAINT  id_pk PRIMARY KEY (id);
	

CREATE TABLE MESSAGE
(
	mesno                 NUMBER(30)  NOT NULL ,
	mesposts              VARCHAR2(1000)  NOT NULL ,
	send			VARCHAR2(20)	NOT NULL,
	mesdate                    VARCHAR2(20)  NOT NULL,
	receiv				  VARCHAR2(20) 	NOT NULL
);
ALTER TABLE MESSAGE
	ADD CONSTRAINT  mesno_pk PRIMARY KEY (mesno);

CREATE SEQUENCE MESSAGE_mesno START WITH 1 INCREMENT BY 1;

CREATE TABLE GUDAN
(
	guno                  NUMBER(30)  NOT NULL ,
	gname                 VARCHAR2(20)  NOT NULL,
	gaddress              VARCHAR2(30)  NOT NULL,
	gpage                 VARCHAR2(200)  NOT NULL,
	gid                   VARCHAR2(20)  NOT NULL,
	gposts                VARCHAR2(500)  NOT NULL,
	totpoint              NUMBER(6)  NOT NULL,
	gurating              VARCHAR2(5)  NOT NULL,
	emblem		      VARCHAR2(500)         NOT NULL
	
);

ALTER TABLE GUDAN
	ADD CONSTRAINT  guno_pk PRIMARY KEY (guno);

CREATE SEQUENCE GUDAN_guno START WITH 1 INCREMENT BY 1;

CREATE TABLE GUDANMEMBER
(
	gumno                 NUMBER(30)  NOT NULL ,
	id                    VARCHAR2(20)  NOT NULL ,
	gumcomfirm            VARCHAR2(10)  NULL ,
	gumposition           VARCHAR2(50)  NULL ,
	guno                  NUMBER(30)  NOT NULL, 
	FOREIGN KEY (id) REFERENCES MEMBER(id),
	FOREIGN KEY (guno) REFERENCES GUDAN(guno)
);

ALTER TABLE GUDANMEMBER
	ADD CONSTRAINT  gumno_pk PRIMARY KEY (gumno);

CREATE SEQUENCE GUNDANMEMBER_gumno START WITH 1 INCREMENT BY 1;

CREATE TABLE GUDANIMG
(
	guino                 NUMBER(20)  NOT NULL ,
	guiimg                VARCHAR2(500)  NOT NULL ,
	guno                  NUMBER(30)  NOT NULL 
);
ALTER TABLE GUDANIMG
	ADD CONSTRAINT  guino_pk PRIMARY KEY (guino);

CREATE SEQUENCE GUDANIMG_guino START WITH 1 INCREMENT BY 1;

ALTER TABLE GUDANIMG
	ADD (CONSTRAINT  GUDANIMG FOREIGN KEY (guno) REFERENCES GUDAN(guno));



CREATE TABLE MATCHINGGP
(
	magno                 NUMBER(30)  NOT NULL ,
	magsubject            VARCHAR2(50)  NOT NULL ,
	id                    VARCHAR2(20)  NOT NULL, 
	gname			VARCHAR2(20)	NOT NULL,
	magdate               DATE  NOT NULL ,
	magstart              VARCHAR2(20)  NOT NULL ,
	magclose              VARCHAR2(20)  NOT NULL ,
	magplace              VARCHAR2(100)  NOT NULL ,
	magsdate              DATE  NOT NULL,
	magviews		NUMBER(5)		 NOT NULL,
	magposts              VARCHAR2(2000)  NOT NULL
	
);
ALTER TABLE MATCHINGGP
	ADD CONSTRAINT  magno_pk PRIMARY KEY (magno);

CREATE SEQUENCE MATCHINGGP_magno START WITH 1 INCREMENT BY 1;

ALTER TABLE MATCHINGGP
	ADD (CONSTRAINT  MATCHINGGP FOREIGN KEY (id) REFERENCES MEMBER(id));


CREATE TABLE MATCHING
(
	mano                  NUMBER(30)  NOT NULL ,
	magno                 NUMBER(30)  NOT NULL ,
	madate                DATE  NOT NULL ,
	mastart               VARCHAR2(20)  NOT NULL ,
	maclose               VARCHAR2(20)  NOT NULL ,
	maplace               VARCHAR2(100)  NOT NULL ,
	maforteam             VARCHAR2(20)  NOT NULL ,
	magname		 VARCHAR2(20)  NOT NULL ,
	macondition           VARCHAR2(20)  NULL ,
	maresult              VARCHAR2(20)  NULL,
	FOREIGN KEY (magno) REFERENCES MATCHINGGP(magno)
);

ALTER TABLE MATCHING
	ADD CONSTRAINT  mano_pk PRIMARY KEY (mano);

CREATE SEQUENCE MATCHING_mano START WITH 1 INCREMENT BY 1;

CREATE TABLE MATCH
(
	matno                 NUMBER(30)  NOT NULL ,
	matdate			DATE	NOT NULL,
	matgname              VARCHAR2(20)  NOT NULL ,
	matforteams           VARCHAR2(20)  NOT NULL ,
	matresult             VARCHAR2(5)  NOT NULL 
);

ALTER TABLE MATCH
	ADD CONSTRAINT  matno_pk PRIMARY KEY (matno);

CREATE SEQUENCE MATCH_matno START WITH 1 INCREMENT BY 1;

CREATE TABLE NOTICEGP
(
	nogno                 NUMBER(30)  NOT NULL ,
	nogdate               DATE  NOT NULL ,
	nogsubject            VARCHAR2(50)  NOT NULL ,
	nogviews		NUMBER(5)		NOT NULL,
	nogposts              VARCHAR2(2000)  NOT NULL 
);

ALTER TABLE NOTICEGP
	ADD CONSTRAINT  nogno_pk PRIMARY KEY (nogno);

CREATE SEQUENCE NOTICEGP_nogno START WITH 1 INCREMENT BY 1;

CREATE TABLE FREEGP
(
	frgno                 NUMBER(30)  NOT NULL ,
	id                    VARCHAR2(50)  NOT NULL ,
	frgdate               DATE  NOT NULL ,
	frgsubject            VARCHAR2(20)  NOT NULL ,
	frgviews		NUMBER(5)		NOT NULL,
	frgposts              VARCHAR2(2000)  NOT NULL 
);

ALTER TABLE FREEGP
	ADD CONSTRAINT  frgno_pk PRIMARY KEY (frgno);

CREATE SEQUENCE FREEGP_frgno START WITH 1 INCREMENT BY 1;

ALTER TABLE FREEGP
	ADD (CONSTRAINT  FREEGP FOREIGN KEY (id) REFERENCES MEMBER(id));



CREATE TABLE PROMOTIONGP
(
	prgno                 NUMBER(30)  NOT NULL ,
	prgdate               DATE  NOT NULL ,
	prgsubject            VARCHAR2(50)  NOT NULL ,
	prgid                 VARCHAR2(20)  NOT NULL ,
	prgviews		NUMBER(5)		NOT NULL,
	prgposts              VARCHAR2(2000)  NOT NULL ,
	guno                  NUMBER(30)  NOT NULL 
);

ALTER TABLE PROMOTIONGP
	ADD CONSTRAINT  prgno_pk PRIMARY KEY (prgno);

CREATE SEQUENCE PROMOTIONGP_prgno START WITH 1 INCREMENT BY 1;

ALTER TABLE PROMOTIONGP
	ADD (CONSTRAINT  PROMOTIONGP FOREIGN KEY (guno) REFERENCES GUDAN(guno));


CREATE TABLE QNAGP
(
	qngno                 NUMBER(30)  NOT NULL ,
	qngdate               DATE  NOT NULL ,
	qngsubject            VARCHAR2(50)  NOT NULL ,
	qngviews		NUMBER(5)	NOT NULL,
	qngposts              VARCHAR2(2000)  NOT NULL ,
	id                    VARCHAR2(20)  NOT NULL 
);

ALTER TABLE QNAGP
	ADD CONSTRAINT  qngno_pk PRIMARY KEY (qngno);

CREATE SEQUENCE QNAGP_qngno START WITH 1 INCREMENT BY 1;

ALTER TABLE QNAGP
	ADD (CONSTRAINT  QNAGP FOREIGN KEY (id) REFERENCES MEMBER(id));


CREATE TABLE QNADP
(
	qndno                 NUMBER(30)  NOT NULL ,
	qngno                 NUMBER(30)  NOT NULL ,
	qnddate               DATE  NOT NULL ,
	qndreply              VARCHAR2(500)  NOT NULL ,
	qndid                 VARCHAR2(20)  NOT NULL 
);
ALTER TABLE QNADP
	ADD CONSTRAINT  qndno_pk PRIMARY KEY (qndno);

CREATE SEQUENCE QNADP_qndno START WITH 1 INCREMENT BY 1;

ALTER TABLE QNADP
	ADD (CONSTRAINT  QNADP FOREIGN KEY (qngno) REFERENCES QNAGP(qngno));



CREATE TABLE MATCHINGDP
(
	madno                 NUMBER(30)  NOT NULL ,
	magno                 NUMBER(30)  NOT NULL ,
	maddate               DATE  NOT NULL ,
	madreply              VARCHAR2(500)  NOT NULL ,
	madid                 VARCHAR2(20)  NOT NULL 
);

ALTER TABLE MATCHINGDP
	ADD CONSTRAINT  madno_pk PRIMARY KEY (madno);

CREATE SEQUENCE MATCHINGDP_madno START WITH 1 INCREMENT BY 1;

ALTER TABLE MATCHINGDP
	ADD (CONSTRAINT  MATCHINGDP FOREIGN KEY (magno) REFERENCES MATCHINGGP(magno));

CREATE TABLE FREEGPDG
(
	frdno                 NUMBER(30)  NOT NULL ,
	frgno                 NUMBER(30)  NOT NULL ,
	frddate               DATE  NOT NULL ,
	frdreply              VARCHAR2(500)  NOT NULL ,
	frdid                 VARCHAR2(20)  NOT NULL 
);

ALTER TABLE FREEGPDG
	ADD CONSTRAINT  frdno_pk PRIMARY KEY (frdno);

CREATE SEQUENCE FREEGPDG_frdno START WITH 1 INCREMENT BY 1;

ALTER TABLE FREEGPDG
	ADD (CONSTRAINT  FREEGPDG FOREIGN KEY (frgno) REFERENCES FREEGP(frgno));

CREATE TABLE PROMOTIONDP
(
	prdno                 NUMBER(30)  NOT NULL ,
	prgno                 NUMBER(30)  NOT NULL ,
	prddate               DATE  NOT NULL ,
	prdreply              VARCHAR2(500)  NOT NULL ,
	prdid                 VARCHAR2(20)  NOT NULL 
);

ALTER TABLE PROMOTIONDP
	ADD CONSTRAINT  prdno_pk PRIMARY KEY (prdno);

CREATE SEQUENCE PROMOTIONDP_prdno START WITH 1 INCREMENT BY 1;

ALTER TABLE PROMOTIONDP
	ADD (CONSTRAINT  PROMOTIONDP FOREIGN KEY (prgno) REFERENCES PROMOTIONGP(prgno));















