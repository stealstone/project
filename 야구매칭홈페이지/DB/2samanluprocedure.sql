CREATE OR REPLACE PROCEDURE MEMBER_INSERT
(
	v_id         IN      member.id%TYPE,
	v_pwd        IN      member.pwd%TYPE,
	v_mname	     IN      member.mname%TYPE,
	v_birthday       IN      member.birthday%TYPE,
	v_email      IN      member.email%TYPE,
	v_maddress    IN      member.maddress%TYPE,
	v_phone      IN      member.phone%TYPE,
	v_mposition   IN      member.mposition%TYPE,
	v_club       IN      member.club%TYPE,
	v_rating     IN	     member.rating%TYPE,
	v_gender     IN	     member.gender%TYPE,
	v_gpage		IN		member.gpage%TYPE
)
IS
BEGIN
	INSERT INTO MEMBER
	VALUES(v_id, v_pwd, v_mname, v_birthday, v_email, v_maddress, v_phone, v_mposition, v_club, v_rating, v_gender, v_gpage);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE MEMBER_UPDATE
(
	v_id         IN      member.id%TYPE,
	v_pwd        IN      member.pwd%TYPE,
	v_email      IN      member.email%TYPE,
	v_maddress    IN     member.maddress%TYPE,
	v_phone      IN      member.phone%TYPE,
	v_mposition   IN      member.mposition%TYPE,
	v_club	     IN      member.club%TYPE,
	v_rating     IN	     member.rating%TYPE
)
IS
BEGIN
	UPDATE MEMBER 
	SET pwd = v_pwd, email = v_email, maddress = v_maddress, phone = v_phone, mposition = v_mposition, club = v_club, rating = v_rating  
	WHERE id = v_id;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MEMBER_DELETE
(
	v_id    IN   member.id%TYPE
)
IS
BEGIN
	DELETE FROM MEMBER
	WHERE id = v_id;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE id_check
(
	v_id    IN   member.id%TYPE,
	out_id  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_id
	FOR
	SELECT id
	FROM MEMBER
	WHERE id = v_id;
END;
/

CREATE OR REPLACE PROCEDURE MEMBER_LOGIN
(
	v_id    IN   member.id%TYPE,
	out_login  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_login 
	FOR
	SELECT pwd
	FROM MEMBER
	WHERE id = v_id;
END;
/

CREATE OR REPLACE PROCEDURE MEMBER_INFO
(
	v_id    IN   member.id%TYPE,
	out_member  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_member 
	FOR
	SELECT id, mname, birthday, email, maddress, phone, mposition, club, rating, gender, gpage  
	FROM MEMBER
	WHERE id = v_id;
END;
/
commit;

CREATE OR REPLACE PROCEDURE zipcode_select
(
	v_dong1    IN   zipcode.dong%TYPE,
	out_zipcode  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_zipcode 
	FOR
	SELECT  sido, gugun, dong
	FROM zipcode
	WHERE dong LIKE CONCAT(CONCAT('%', v_dong1), '%');
END;
/

CREATE OR REPLACE PROCEDURE GUDAN_INSERT
(
	v_gname         IN      gudan.gname%TYPE,
	v_gaddress        IN      gudan.gaddress%TYPE,
	v_gpage	     IN      gudan.gpage%TYPE,
	v_gid       IN      gudan.gid%TYPE,
	v_gposts      IN      gudan.gposts%TYPE,
	v_totpoint    IN      gudan.totpoint%TYPE,
	v_gurating      IN     gudan.gurating%TYPE,
	v_emblem	IN	gudan.emblem%TYPE
	
)
IS
BEGIN
	INSERT INTO GUDAN(guno, gname, gaddress, gpage, gid, gposts, totpoint, gurating, emblem)
	VALUES(GUDAN_guno.nextval, v_gname, v_gaddress, v_gpage, v_gid, v_gposts, v_totpoint, v_gurating, v_emblem);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE GUDAN_UPDATE
(
	v_gname        IN      gudan.gname%TYPE,
	v_gaddress        IN      gudan.gaddress%TYPE,
	v_gposts      IN      gudan.gposts%TYPE,
	v_totpoint    IN      gudan.totpoint%TYPE,
	v_gurating      IN     gudan.gurating%TYPE,
	v_emblem	IN	gudan.emblem%TYPE
)
IS
BEGIN
	UPDATE GUDAN 
	SET gaddress = v_gaddress, gposts = v_gposts, totpoint = v_totpoint, gurating = v_gurating, emblem = v_emblem  
	WHERE gname = v_gname;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE GUDAN_DELETE
(
	v_gname    IN   gudan.gname%TYPE
)
IS
BEGIN
	DELETE FROM GUDAN
	WHERE gname = v_gname;
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE GUDAN_SELECT
(
	v_gname   IN   gudan.gname%TYPE,
	out_gadan  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_gadan 
	FOR
	SELECT  guno, gname, gpage, gid, totpoint, gurating
	FROM GUDAN
	WHERE gname = v_gname;
END;
/
CREATE OR REPLACE PROCEDURE gname_check
(
	v_gname    IN   gudan.gname%TYPE,
	out_id  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_id
	FOR
	SELECT gname
	FROM GUDAN
	WHERE gname = v_gname;
END;
/


CREATE OR REPLACE PROCEDURE GUDANMEMBER_INSERT
(	
	v_id         IN      gudanmember.id%TYPE,
	v_gumcomfirm        IN      gudanmember.gumcomfirm%TYPE,
	v_gumposition	     IN      gudanmember.gumposition%TYPE,
	v_guno       IN      gudanmember.guno%TYPE
	
)
IS
BEGIN
	INSERT INTO GUDANMEMBER(gumno, id, gumcomfirm, gumposition, guno)
	VALUES(GUNDANMEMBER_gumno.nextval, v_id, v_gumcomfirm, v_gumposition, v_guno);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE GUDANMEMBER_UPDATE
(
	v_id		    IN	     gudanmember.id%TYPE,   
	v_gumcomfirm        IN      gudanmember.gumcomfirm%TYPE,
	v_gumposition        IN      gudanmember.gumposition%TYPE
)
IS
BEGIN
	UPDATE GUDANMEMBER 
	SET gumcomfirm = v_gumcomfirm, gumposition = v_gumposition 
	WHERE id = v_id;
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE GUDANMEMBER_COM_UPDATE
(
	v_id		    IN	     gudanmember.id%TYPE,   
	v_guno		    IN		gudanmember.guno%TYPE,
	v_gumcomfirm        IN      gudanmember.gumcomfirm%TYPE
	

)
IS
BEGIN
	UPDATE GUDANMEMBER 
	SET gumcomfirm = v_gumcomfirm
	WHERE id = v_id AND guno = v_guno;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE GUDANMEMBER_COM_DELETE
(
	v_id		    IN	     gudanmember.id%TYPE,   
	v_guno		    IN		gudanmember.guno%TYPE
	

)
IS
BEGIN
	DELETE 
	FROM GUDANMEMBER
	WHERE id = v_id AND guno = v_guno;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE GUDANMEMBER_DELETE
(
	v_id    IN   gudanmember.id%TYPE
)
IS
BEGIN
	DELETE FROM GUDANMEMBER
	WHERE id = v_id;
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE GUDANMEMBER_SELECT
(
	v_id   IN   gudanmember.id%TYPE,
	out_gadanmember  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_gadanmember 
	FOR
	SELECT  gumcomfirm, gumposition, guno
	FROM GUDANMEMBER
	WHERE id = v_id;
END;
/

CREATE OR REPLACE PROCEDURE GUDANIMG_INSERT
(	
	v_guiimg         IN      gudanimg.guiimg%TYPE,
	v_guno        IN      gudanimg.guno%TYPE
	
)
IS
BEGIN
	INSERT INTO GUDANIMG(guino, guiimg, guno)
	VALUES(GUDANIMG_guino.nextval, v_guiimg, v_guno);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE GUDANIMG_UPDATE
(
	v_guno        IN      gudanimg.guno%TYPE,
	v_guiimg         IN      gudanimg.guiimg%TYPE
)
IS
BEGIN
	UPDATE GUDANIMG 
	SET guiimg = v_guiimg
	WHERE guno = v_guno;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE GUDANIMG_DELETE
(
	v_guno         IN      gudanimg.guno%TYPE,
	v_guiimg         IN      gudanimg.guiimg%TYPE
)
IS
BEGIN
	DELETE FROM GUDANIMG
	WHERE guno = v_guno AND guiimg = v_guiimg;
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE GUDANIMG_SELECT
(
	v_guno         IN      gudanimg.guno%TYPE,
	out_gadanimg  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_gadanimg 
	FOR
	SELECT  guiimg
	FROM GUDANIMG
	WHERE guno = v_guno;
END;
/





CREATE OR REPLACE PROCEDURE MATCHINGGP_INSERT
(	
	
	v_magsubject    IN      matchinggp.magsubject%TYPE,
	v_id		IN      matchinggp.id%TYPE,
	v_gname		IN	matchinggp.gname%TYPE,
	v_magdate       IN      matchinggp.magdate%TYPE,
	v_magstart      IN      matchinggp.magstart%TYPE,
	v_magclose      IN      matchinggp.magclose%TYPE,
	v_magplace      IN      matchinggp.magplace%TYPE,
	v_magsdate      IN      matchinggp.magsdate%TYPE,
	v_magviews		IN	matchinggp.magviews%TYPE,
	v_magposts      IN      matchinggp.magposts%TYPE
	
)
IS
BEGIN
	INSERT INTO MATCHINGGP(magno, magsubject, id, gname, magdate, magstart, magclose, magplace, magsdate, magviews,  magposts)
	VALUES(MATCHINGGP_magno.nextval, v_magsubject, v_id, v_gname, v_magdate, v_magstart, v_magclose, v_magplace, v_magsdate, v_magviews, v_magposts);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE MATCHINGGP_UPDATE
(
	v_magno		IN      matchinggp.magno%TYPE,
	v_magsubject    IN      matchinggp.magsubject%TYPE,
	v_magdate       IN      matchinggp.magdate%TYPE,
	v_magstart      IN      matchinggp.magstart%TYPE,
	v_magclose      IN      matchinggp.magclose%TYPE,
	v_magplace      IN      matchinggp.magplace%TYPE,
	v_magviews	IN	matchinggp.magviews%TYPE,
	v_magposts      IN      matchinggp.magposts%TYPE
)
IS
BEGIN
	UPDATE MATCHINGGP 
	SET magsubject = v_magsubject, magdate = v_magdate, magstart = v_magstart, magclose = v_magclose, magplace = v_magplace, magviews = v_magviews,  magposts = v_magposts
	WHERE magno = v_magno;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MATCHINGGP_DELETE
(
	v_magno		IN      matchinggp.magno%TYPE
)
IS
BEGIN
	DELETE FROM MATCHINGGP
	WHERE magno = v_magno; 
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE MATCHINGGP_SELECT
(
	v_magno		IN      matchinggp.magno%TYPE,
	out_matchinggp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_matchinggp 
	FOR
	SELECT  magsubject, id, gname, magdate, magstart, magclose, magplace, magsdate, magposts
	FROM MATCHINGGP
	WHERE magno = v_magno;
END;
/



CREATE OR REPLACE PROCEDURE MATCHINGGP_ALL_SELECT
(	
	out_matchinggp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_matchinggp 
	FOR
	SELECT magno, magsubject, id, gname, magdate, magstart, magclose, magplace, magsdate, magviews
	FROM MATCHINGGP
	ORDER BY magno DESC ;	
END;
/

CREATE OR REPLACE PROCEDURE matchinggp_update_readcount
(
	v_magno    IN   matchinggp.magno%TYPE
)
IS
BEGIN
	UPDATE matchinggp 
	SET magviews = magviews + 1  
	WHERE magno = v_magno;
	COMMIT;
END;

CREATE OR REPLACE PROCEDURE MATCHINGGP_INCOUNT
(	
	v_gname		IN	matchinggp.gname%TYPE,
	v_magsdate	IN	matchinggp.magsdate%TYPE,
	out_magincount  OUT  SYS_REFCURSOR

)
AS
BEGIN
	OPEN out_magincount
	FOR
	SELECT COUNT(*)
	FROM MATCHINGGP
	WHERE gname = v_gname AND magsdate = v_magsdate;
END;
/


CREATE OR REPLACE PROCEDURE MATCHING_INSERT
(	
	v_magno		IN	matching.magno%TYPE,
	v_madate		IN      matching.madate%TYPE,
	v_mastart       IN      matching.mastart%TYPE,
	v_maclose      IN      matching.maclose %TYPE,
	v_maplace      IN      matching.maplace%TYPE,
	v_maforteam      IN      matching.maforteam%TYPE,
	v_magname      IN      matching.magname%TYPE
)
IS
BEGIN
	INSERT INTO MATCHING(mano, magno, madate, mastart, maclose, maplace, maforteam, magname)
	VALUES(MATCHING_mano.nextval, v_magno, v_madate, v_mastart, v_maclose, v_maplace, v_maforteam, v_magname);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE MATCHING_UPDATE
(
	v_mano		IN      matching.mano%TYPE,	
	v_macondition      IN      matching.macondition%TYPE,
	v_maresult      IN      matching.maresult%TYPE
)
IS
BEGIN
	UPDATE MATCHING 
	SET macondition = v_macondition, maresult = v_maresult 
	WHERE mano = v_mano;
	COMMIT;
END;


CREATE or replace PROCEDURE MATCHING_SELECT_GETONE
(
	v_mano		IN	matching.mano%TYPE,
	out_matching  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_matching 
	FOR
	SELECT  magno, madate, mastart, maclose, maplace, maforteam, magname, macondition, maresult
	FROM MATCHING
	WHERE mano = v_mano;
END;

create or replace PROCEDURE MATCHING_DELETE
(
	v_magno		IN      matching.magno%TYPE
)
IS
BEGIN
	DELETE FROM MATCHING
	WHERE magno = v_magno AND macondition IS NULL; 
	COMMIT;
END;


CREATE OR REPLACE PROCEDURE MATCHING_DELETE2
(
	v_madate		IN      matching.madate%TYPE,
	v_maforteam 	IN		matching.maforteam%TYPE
)
IS
BEGIN
	DELETE FROM MATCHING
	WHERE madate = v_madate AND maforteam = v_maforteam AND macondition IS NULL; 
	COMMIT;
END;

CREATE OR REPLACE PROCEDURE MATCHING_ALL_DELETE
(
	v_mano		IN      matching.mano%TYPE
)
IS
BEGIN
	DELETE FROM MATCHING
	WHERE mano = v_mano; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MATCHING_COUNT_SELECT
(
	v_maforteam	IN	matching.maforteam%TYPE,
	v_madate	IN	matching.madate%TYPE,
	out_matchingcount  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_matchingcount
	FOR
	SELECT COUNT(*)
	FROM MATCHING
	WHERE maforteam = v_maforteam AND madate = v_madate;
END;


CREATE OR REPLACE PROCEDURE MATCHING_SELECT
(
	v_magno		IN	matching.magno%TYPE,
	out_matching  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_matching 
	FOR
	SELECT  mano, madate, mastart, maclose, maplace, maforteam, magname, macondition, maresult
	FROM MATCHING
	WHERE magno = v_magno;
END;
/

CREATE OR REPLACE PROCEDURE MATCHING_INCOUNT
(	
	v_magno		IN	matching.magno%TYPE,
	v_macondition	IN	matching.macondition%TYPE,
	out_maincount  OUT  SYS_REFCURSOR

)
AS
BEGIN
	OPEN out_maincount
	FOR
	SELECT COUNT(*)
	FROM MATCHING
	WHERE magno = v_magno AND macondition = v_macondition;
END;
/


CREATE OR REPLACE PROCEDURE MATCH_INSERT
(	
	v_mano       IN      match.mano%TYPE,
	v_matdate      IN      match.matdate %TYPE,
	v_matgname      IN      match.matgname %TYPE,
	v_matforteams      IN      match.matforteams%TYPE,
	v_matresult      IN      match.matresult%TYPE
	
)
IS
BEGIN
	INSERT INTO MATCH(matno, mano, matdate, matgname, matforteams, matresult)
	VALUES(MATCH_matno.nextval, v_mano, v_matdate, v_matgname, v_matforteams, v_matresult);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE MATCH_UPDATE
(
	v_matno		IN      match.matno%TYPE,
	v_mano       IN      match.mano%TYPE,
	v_matresult      IN      match.matresult%TYPE
)
IS
BEGIN
	UPDATE MATCH
	SET mano = v_mano, matresult = v_matresult
	WHERE matno = v_matno;
	COMMIT;
END;
/




CREATE OR REPLACE PROCEDURE MATCH_DELETE
(
	v_matno		IN      match.matno%TYPE
)
IS
BEGIN
	DELETE FROM MATCH
	WHERE matno = v_matno; 
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE MATCH_SELECT
(
	v_matno		IN      match.matno%TYPE,
	v_matdate		IN      match.matdate%TYPE,
	out_match  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_match 
	FOR
	SELECT  matdate, matgname, matforteams, matresult
	FROM MATCH
	WHERE matno = v_matno OR matdate= v_matdate;
END;
/


CREATE OR REPLACE PROCEDURE NOTICEGP_INSERT
(	
	
	v_nogdate		IN	noticegp.nogdate%TYPE,
	v_nogsubject		IN      noticegp.nogsubject%TYPE,
	v_nogviews		IN	noticegp.nogviews%TYPE,
	v_nogposts		IN      noticegp.nogposts%TYPE
	
)
IS
BEGIN
	INSERT INTO NOTICEGP(nogno, nogdate, nogsubject, nogviews, nogposts)
	VALUES(NOTICEGP_nogno.nextval, v_nogdate, v_nogsubject, v_nogviews, v_nogposts);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE NOTICEGP_UPDATE
(
	v_nogno			IN	noticegp.nogno%TYPE,
	v_nogdate		IN	noticegp.nogdate%TYPE,
	v_nogsubject		IN      noticegp.nogsubject%TYPE,
	v_nogposts		IN      noticegp.nogposts%TYPE
)
IS
BEGIN
	UPDATE NOTICEGP 
	SET nogdate = v_nogdate, nogsubject = v_nogsubject, nogposts = v_nogposts
	WHERE nogno = v_nogno;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE NOTICEGPVI_UPDATE
(
	v_nogno			IN	noticegp.nogno%TYPE
)
IS
BEGIN
	UPDATE NOTICEGP 
	SET  nogviews =  nogviews + 1
	WHERE nogno = v_nogno;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE NOTICEGP_DELETE
(
	v_nogno		IN      noticegp.nogno%TYPE
)
IS
BEGIN
	DELETE FROM NOTICEGP
	WHERE nogno = v_nogno; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE NOTICEGP_SELECT
(
	v_nogno			IN	noticegp.nogno%TYPE,
	out_noticegp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_noticegp 
	FOR
	SELECT nogdate, nogsubject, nogviews, nogposts
	FROM NOTICEGP
	WHERE nogno = v_nogno;
END;
/

CREATE OR REPLACE PROCEDURE NOTICEGP_ALL_SELECT
(
	out_noticegp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_noticegp
	FOR
	SELECT nogno, nogdate, nogsubject, nogviews
	FROM NOTICEGP
	ORDER BY nogno DESC;
END;
/



CREATE OR REPLACE PROCEDURE FREEGP_INSERT
(	
	
	v_id			IN      freegp.id%TYPE,
	v_frgdate		IN      freegp.frgdate%TYPE,
	v_frgsubject		IN      freegp.frgsubject%TYPE,
	v_frgviews		IN	freegp.frgviews%TYPE,
	v_frgposts		IN      freegp.frgposts%TYPE
	
)
IS
BEGIN
	INSERT INTO FREEGP(frgno, id, frgdate, frgsubject, frgviews, frgposts)
	VALUES(FREEGP_frgno.nextval, v_id, v_frgdate, v_frgsubject, v_frgviews, v_frgposts);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE FREEGP_UPDATE
(
	v_frgno			IN	freegp.frgno%TYPE,
	v_frgsubject		IN      freegp.frgsubject%TYPE,
	v_frgdate		IN      freegp.frgdate%TYPE,
	v_frgposts		IN      freegp.frgposts%TYPE
)
IS
BEGIN
	UPDATE FREEGP 
	SET frgsubject = v_frgsubject, frgdate = v_frgdate, frgposts = v_frgposts
	WHERE frgno = v_frgno;
	COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE FREEGP_DELETE
(
	v_frgno		IN      freegp.frgno%TYPE
)
IS
BEGIN
	DELETE FROM FREEGP
	WHERE frgno = v_frgno; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE FREEGP_SELECT
(
	v_frgno			IN	freegp.frgno%TYPE,
	out_freegp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_freegp 
	FOR
	SELECT  frgno, id, frgdate, frgsubject, frgviews, frgposts
	FROM FREEGP
	WHERE frgno = v_frgno;
END;
/

CREATE OR REPLACE PROCEDURE FREEGP_ALL_SELECT
(
	out_freegp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_freegp
	FOR
	SELECT frgno, frgdate, frgsubject, frgviews, id
	FROM FREEGP
	ORDER BY frgno DESC;
END;
/

CREATE OR REPLACE PROCEDURE FREEGP_UPDATE_READCOUNT
(
	v_frgno    IN   freegp.frgno%TYPE
)
IS
BEGIN
	UPDATE FREEGP 
	SET frgviews = frgviews + 1  
	WHERE frgno = v_frgno;
	COMMIT;
END;



CREATE OR REPLACE PROCEDURE PROMOTIONGP_INSERT
(	
	
	v_prgdate		IN	promotiongp.prgdate%TYPE,
	v_prgsubject		IN      promotiongp.prgsubject%TYPE,
	v_prgid			IN      promotiongp.prgid%TYPE,
	v_prgviews		IN	promotiongp.prgid%TYPE,
	v_prgposts		IN      promotiongp.prgposts%TYPE,
	v_guno			IN	promotiongp.guno%TYPE
	
)
IS
BEGIN
	INSERT INTO PROMOTIONGP(prgno, prgdate, prgsubject, prgid, prgviews, prgposts, guno)
	VALUES(PROMOTIONGP_prgno.nextval, v_prgdate, v_prgsubject, v_prgid, v_prgviews, v_prgposts, v_guno);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE PROMOTIONGP_UPDATE
(
	v_prgno			IN	promotiongp.prgno%TYPE,
	v_prgsubject		IN      promotiongp.prgsubject%TYPE,
	v_prgviews			IN	promotiongp.prgid%TYPE,
	v_prgposts		IN      promotiongp.prgposts%TYPE
)
IS
BEGIN
	UPDATE PROMOTIONGP 
	SET prgsubject = v_prgsubject, prgviews = v_prgviews, prgposts = v_prgposts
	WHERE prgno = v_prgno;
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE PROMOTIONGP_DELETE
(
	v_prgno		IN      promotiongp.prgno%TYPE
)
IS
BEGIN
	DELETE FROM PROMOTIONGP
	WHERE prgno = v_prgno; 
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE PROMOTIONGP_SELECT
(
	v_prgno			IN	promotiongp.prgno%TYPE,
	out_promotiongp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_promotiongp 
	FOR
	SELECT  prgno, TO_CHAR(prgdate, 'YYYY-MM-DD'), prgsubject, prgid, guno, prgposts
	FROM PROMOTIONGP
	WHERE prgno = v_prgno;
END;
/

CREATE OR REPLACE PROCEDURE PROMOTIONGP_ALL_SELECT
(
	out_promotiongp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_promotiongp
	FOR
	SELECT prgno, TO_CHAR(prgdate, 'YYYY-MM-DD'), prgsubject, prgid, guno
	FROM PROMOTIONGP
	ORDER BY prgno DESC;
END;
/

CREATE OR REPLACE PROCEDURE QNAGP_INSERT
(	
	
	v_qngdate		IN	qnagp.qngdate%TYPE,
	v_qngsubject	IN      qnagp.qngsubject%TYPE,
	v_qngviews		IN	 qnagp.qngviews%TYPE,
	v_qngposts		IN      qnagp.qngposts	%TYPE,
	v_id			IN      qnagp.id%TYPE
	
)
IS
BEGIN
	INSERT INTO QNAGP(qngno, qngdate, qngsubject, qngviews, qngposts, id)
	VALUES(QNAGP_qngno.nextval, v_qngdate, v_qngsubject, v_qngviews, v_qngposts, v_id);
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE QNAGP_UPDATE
(
	v_qngno			IN	qnagp.qngno%TYPE,
	v_qngsubject		IN      qnagp.qngsubject%TYPE,
	v_qngviews		IN	 qnagp.qngviews%TYPE,
	v_qngposts		IN      qnagp.qngposts%TYPE
)
IS
BEGIN
	UPDATE QNAGP 
	SET qngsubject = v_qngsubject, qngviews = v_qngviews, qngposts = v_qngposts
	WHERE qngno = v_qngno;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE QNAGP_DELETE
(
	v_qngno		IN      qnagp.qngno%TYPE
)
IS
BEGIN
	DELETE FROM QNAGP
	WHERE qngno = v_qngno; 
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE QNAGP_SELECT
(
	v_qngno			IN	qnagp.qngno%TYPE,
	out_qnagp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_qnagp
	FOR
	SELECT  qngno, TO_CHAR(qngdate, 'YYYY-MM-DD'), qngsubject, qngviews, id, qngposts
	FROM QNAGP
	WHERE qngno = v_qngno;
END;
/

CREATE OR REPLACE PROCEDURE QNAGP_ALL_SELECT
(
	out_qnagp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_qnagp
	FOR
	SELECT qngno, TO_CHAR(qngdate, 'YYYY-MM-DD'), qngviews, qngsubject, id
	FROM QNAGP
	ORDER BY qngno DESC;
END;
/


CREATE OR REPLACE PROCEDURE MESSAGE_INSERT
(	
	
	v_mesposts    IN      message.mesposts%TYPE,
	v_send		IN      message.send%TYPE,
	v_mesdate		IN	message.mesdate%TYPE,
	v_receiv       IN      message.receiv%TYPE
	
)
IS
BEGIN
	INSERT INTO MESSAGE(mesno, mesposts, send, mesdate, receiv)
	VALUES(MESSAGE_mesno.nextval, v_mesposts, v_send, v_mesdate, v_receiv);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE MESSAGE_DELETE
(
	v_mesno		IN      message.mesno%TYPE
)
IS
BEGIN
	DELETE FROM MESSAGE
	WHERE mesno = v_mesno; 
	COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE MESSAGE_SELECT
(
	v_mesno		IN      message.mesno%TYPE,
	v_receiv      IN      message.receiv%TYPE,
	out_message  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_message 
	FOR
	SELECT  mesno, mesposts, mesdate, send, receiv
	FROM MESSAGE
	WHERE mesno = v_mesno AND receiv = v_receiv ;
END;
/

CREATE OR REPLACE PROCEDURE MESSAGE_ALL_SELECT
(	
	v_receiv      IN      message.receiv%TYPE,
	out_message  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_message 
	FOR
	SELECT mesno, mesposts, send, mesdate, receiv 
	FROM MESSAGE
	WHERE receiv = v_receiv
	ORDER BY mesno DESC;	
END;
/


CREATE OR REPLACE PROCEDURE MATCHINGGP_COUNT
(
	out_magcount  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_magcount 
	FOR
	SELECT COUNT(magno)
	FROM MATCHINGGP;
END;
/



CREATE OR REPLACE PROCEDURE NOTICEGP_COUNT
(
	out_nogcount  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_nogcount 
	FOR
	SELECT COUNT(nogno)
	FROM NOTICEGP;
END;
/


CREATE OR REPLACE PROCEDURE FREEGP_COUNT
(
	out_frgcount  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_frgcount 
	FOR
	SELECT COUNT(frgno)
	FROM FREEGP;
END;
/


CREATE OR REPLACE PROCEDURE PROMOTIONGP_COUNT
(
	out_prgcount  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_prgcount 
	FOR
	SELECT COUNT(prgno)
	FROM PROMOTIONGP;
END;
/

CREATE OR REPLACE PROCEDURE QNAGP_COUNT
(
	out_qngcount  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_qngcount 
	FOR
	SELECT COUNT(qngno)
	FROM QNAGP;
END;
/


CREATE OR REPLACE PROCEDURE MESSAGE_COUNT
(
	v_receiv      IN      message.receiv%TYPE,
	out_mescount  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_mescount 
	FOR
	SELECT COUNT(mesno)
	FROM MESSAGE
	WHERE receiv = v_receiv;
END;
/




CREATE OR REPLACE PROCEDURE MATCHINGDP_INSERT
(	
	
	v_magno		IN	matchingdp.magno%TYPE,
	v_maddate		IN      matchingdp.maddate%TYPE,
	v_madreply			IN      matchingdp.madreply%TYPE,
	v_madid		IN	matchingdp.madid%TYPE
	
	
)
IS
BEGIN
	INSERT INTO MATCHINGDP(madno, magno, maddate, madreply, madid)
	VALUES(MATCHINGDP_madno.nextval, v_magno, v_maddate, v_madreply, v_madid);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE MATCHINGDP_UPDATE
(
	v_madno			IN	matchingdp.madno%TYPE,
	v_madreply			IN      matchingdp.madreply%TYPE
)
IS
BEGIN
	UPDATE MATCHINGDP 
	SET madreply = v_madreply
	WHERE madno = v_madno;
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE MATCHINGDP_DELETE
(
	v_madno			IN	matchingdp.madno%TYPE
)
IS
BEGIN
	DELETE FROM MATCHINGDP
	WHERE madno = v_madno; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MATCHINGDP_TO_DELETE
(
	v_magno		IN	matchingdp.magno%TYPE
)
IS
BEGIN
	DELETE FROM MATCHINGDP
	WHERE magno = v_magno; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MATCHINGDP_ALL_SELECT
(
	v_madno			IN	matchingdp.madno%TYPE,
	v_magno		IN	matchingdp.magno%TYPE,
	out_matchingdp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_matchingdp
	FOR
	SELECT madno, magno, maddate, madreply, madid
	FROM MATCHINGDP
	WHERE magno = v_magno AND madno = v_madno
	ORDER BY madno ASC;
END;
/


CREATE OR REPLACE PROCEDURE MEMBER_CLUB_UPDATE
(
	v_id			IN		member.id%TYPE,
	v_rating		IN		member.rating%TYPE,
	v_club			IN      member.club%TYPE
)
IS
BEGIN
	UPDATE MEMBER 
	SET rating = v_rating, club = v_club
	WHERE id = v_id;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE GUDAN_TWO_UPDATE
(
	v_gname			IN		gudan.gname%TYPE,
	v_gpage			IN		gudan.gpage%TYPE,
	v_emblem		IN		gudan.emblem%TYPE
)
IS
BEGIN
	UPDATE GUDAN 
	SET gpage = v_gpage, emblem = v_emblem
	WHERE gname = v_gname;
	COMMIT;
END;
/





CREATE OR REPLACE PROCEDURE QNADP_INSERT
(	
	
	v_qngno		IN		qnadp.qngno%TYPE,
	v_qnddate	IN      qnadp.qnddate%TYPE,
	v_qndreply	IN      qnadp.qndreply%TYPE,
	v_qndid		IN		qnadp.qndid%TYPE
	
	
)
IS
BEGIN
	INSERT INTO QNADP(qndno, qngno, qnddate, qndreply, qndid)
	VALUES(QNADP_qndno.nextval, v_qngno, v_qnddate, v_qndreply, v_qndid);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE QNADP_UPDATE
(
	v_qndno			IN		qnadp.qndno%TYPE,
	v_qndreply		IN      qnadp.qndreply%TYPE
)
IS
BEGIN
	UPDATE QNADP 
	SET qndreply = v_qndreply
	WHERE qndno = v_qndno;
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE QNADP_DELETE
(
	v_qndno			IN	qnadp.qndno%TYPE
)
IS
BEGIN
	DELETE FROM QNADP
	WHERE qndno = v_qndno; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE QNADP_ALL_SELECT
(
	v_qndno		IN	qnadp.qndno%TYPE,
	v_qngno		IN	qnadp.qngno%TYPE,
	out_qnadp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_qnadp
	FOR
	SELECT qndno, qngno, qnddate, qndreply, qndid
	FROM QNADP
	WHERE qngno = v_qngno AND qndno = v_qndno
	ORDER BY qndno ASC;
END;
/

CREATE OR REPLACE PROCEDURE FREEGPDG_INSERT
(	
	
	v_frgno		IN		freegpdg.frgno%TYPE,
	v_frddate	IN      freegpdg.frddate%TYPE,
	v_frdreply	IN      freegpdg.frdreply%TYPE,
	v_frdid		IN		freegpdg.frdid%TYPE
	
	
)
IS
BEGIN
	INSERT INTO FREEGPDG(frdno, frgno, frddate, frdreply, frdid)
	VALUES(FREEGPDG_frdno.nextval, v_frgno, v_frddate, v_frdreply, v_frdid);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE FREEGPDG_UPDATE
(
	v_frdno			IN		freegpdg.frdno%TYPE,
	v_frdreply		IN      freegpdg.frdreply%TYPE
)
IS
BEGIN
	UPDATE FREEGPDG
	SET frdreply = v_frdreply
	WHERE frdno = v_frdno;
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE FREEGPDG_DELETE
(
	v_frdno			IN	freegpdg.frdno%TYPE
)
IS
BEGIN
	DELETE FROM FREEGPDG
	WHERE frdno = v_frdno; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE FREEGPDG_DELETE_ALL
(
	v_frgno			IN	freegpdg.frgno%TYPE
)
IS
BEGIN
	DELETE FROM FREEGPDG
	WHERE frgno = v_frgno; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE FREEGPDG_SELECT_ALL
(
	v_frgno		IN	freegpdg.frgno%TYPE,
	out_freegpdp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_freegpdp
	FOR
	SELECT frdno, frddate, frdreply, frdid
	FROM FREEGPDG
	WHERE frgno = v_frgno
	ORDER BY frdno ASC;
END;
/



CREATE OR REPLACE PROCEDURE PROMOTIONDP_INSERT
(	
	
	v_prgno		IN	promotiondp.prgno%TYPE,
	v_prddate	IN      promotiondp.prddate%TYPE,
	v_prdreply	IN      promotiondp.prdreply%TYPE,
	v_prdid		IN	promotiondp.prdid%TYPE
	
	
)
IS
BEGIN
	INSERT INTO PROMOTIONDP(prdno, prgno, prddate, prdreply, prdid)
	VALUES(PROMOTIONDP_prdno.nextval, v_prgno, v_prddate, v_prdreply, v_prdid);
	COMMIT;
END;
/
	
CREATE OR REPLACE PROCEDURE PROMOTIONDP_UPDATE
(
	v_prdno			IN	promotiondp.prdno%TYPE,
	v_prdreply		IN      promotiondp.prdreply%TYPE
)
IS
BEGIN
	UPDATE PROMOTIONDP
	SET prdreply = v_prdreply
	WHERE prdno = v_prdno;
	COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE PROMOTIONDP_DELETE
(
	v_prdno			IN	promotiondp.prdno%TYPE
)
IS
BEGIN
	DELETE FROM PROMOTIONDP
	WHERE prdno = v_prdno; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE PROMOTIONDP_ALL_SELECT
(
	v_prdno		IN	promotiondp.prdno%TYPE,
	v_prgno		IN	promotiondp.prgno%TYPE,
	out_promotiondp  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_promotiondp
	FOR
	SELECT prdno, prgno, prddate, prdreply, prdid
	FROM PROMOTIONDP
	WHERE prgno = v_prgno AND prdno = v_prdno
	ORDER BY prdno ASC;
END;
/

CREATE OR REPLACE PROCEDURE GUDAN_GPAGE_SELECT
(
	v_gname		IN	gudan.gname%TYPE,
	out_gpage  OUT  SYS_REFCURSOR	
)
AS
BEGIN
	OPEN out_gpage
	FOR
	SELECT gpage 
	FROM GUDAN
	WHERE gname = v_gname;
END;
/


CREATE OR REPLACE PROCEDURE MEMBER_GPAGE_UPDATE
(
	v_id		IN	member.id%TYPE,
	v_gpage		IN	member.gpage%TYPE	
)
AS
BEGIN
	UPDATE MEMBER
	SET gpage = v_gpage
	WHERE id = v_id;
END;
/


CREATE OR REPLACE PROCEDURE MEMBER_GPAGE_SELECT
(
	v_id		IN	member.id%TYPE,
	out_mgpage  OUT  SYS_REFCURSOR	
)
AS
BEGIN
	OPEN out_mgpage
	FOR
	SELECT gpage 
	FROM MEMBER
	WHERE id = v_id;
END;
/

CREATE OR REPLACE PROCEDURE MEMBER_ADMIN_SELECT
(
	v_id    IN   member.id%TYPE,
	out_memberadmin  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_memberadmin 
	FOR
	SELECT id, mname, club, rating
	FROM MEMBER
	WHERE id != v_id;
END;
/
commit;

CREATE OR REPLACE PROCEDURE GUDAN_ADMIN_SELECT
(
	out_gudanadmin  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_gudanadmin
	FOR
	SELECT gname, gid, gurating, totpoint 
	FROM GUDAN;
END;
/
commit;

CREATE OR REPLACE PROCEDURE MATCH_ADMIN_SELECT
(
	out_matchadmin  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_matchadmin
	FOR
	SELECT mano, magname, maforteam, maclose, macondition 
	FROM MATCHING
	WHERE (macondition = 'matched' AND maresult IS null) OR (macondition = 'matched' AND maresult IS NOT null);
END;
/
commit;

CREATE OR REPLACE PROCEDURE GUDAN_GID_SELECT
(
	v_gname		IN	gudan.gname%TYPE,
	out_gudangid  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_gudangid
	FOR
	SELECT gid
	FROM GUDAN
	WHERE gname = v_gname;
END;
/
commit;


CREATE OR REPLACE PROCEDURE GUDAN_INFO
(
	v_gname   IN   gudan.gname%TYPE,
	out_gadaninfo  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_gadaninfo 
	FOR
	SELECT  guno, gname, gaddress, gpage, gid, gposts,  totpoint, gurating, emblem
	FROM GUDAN
	WHERE gname = v_gname;
END;
/
CREATE OR REPLACE PROCEDURE GUDAN_TOTPOINT_UPDATE
(
	v_gname		IN	gudan.gname%TYPE
)
AS
BEGIN
	UPDATE GUDAN
	SET totpoint = totpoint - 100
	WHERE gname = v_gname;
END;
/

CREATE OR REPLACE PROCEDURE GUDAN_GPOSTS_UPDATE
(
	v_gid		IN	gudan.gid%TYPE,
	v_gposts	IN	gudan.gposts%TYPE
)
AS
BEGIN
	UPDATE GUDAN
	SET gposts = v_gposts
	WHERE gid = v_gid;
END;
/

CREATE OR REPLACE PROCEDURE GUDAN_EMBLEM_UPDATE
(
	v_gid		IN	gudan.gid%TYPE,
	v_emblem	IN	gudan.emblem%TYPE
)
AS
BEGIN
	UPDATE GUDAN
	SET emblem = v_emblem
	WHERE gid = v_gid;
END;
/



CREATE OR REPLACE PROCEDURE MAGFIVE_SELECT
(	
	out_matfive  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_matfive 
	FOR
	SELECT magno, magsubject, magdate  
	FROM MATCHINGGP
	WHERE rownum <= 5
	ORDER BY magno DESC;
END;
/


CREATE OR REPLACE PROCEDURE NOGFIVE_SELECT
(	
	out_nogfive  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_nogfive 
	FOR
	SELECT nogno, nogsubject, nogdate
	FROM NOTICEGP
	WHERE rownum <= 5
	ORDER BY nogno DESC ;	
END;
/



CREATE OR REPLACE PROCEDURE FRGFIVE_SELECT
(	
	out_frgfive  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_frgfive 
	FOR
	SELECT frgno, frgsubject, frgdate
	FROM FREEGP
	WHERE rownum <= 5
	ORDER BY frgno DESC ;	
END;
/



CREATE OR REPLACE PROCEDURE PRGFIVE_SELECT
(	
	out_prgfive  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_prgfive 
	FOR
	SELECT prgno, prgsubject, prgdate
	FROM PROMOTIONGP
	WHERE rownum <= 5
	ORDER BY prgno DESC ;	
END;
/


CREATE OR REPLACE PROCEDURE GUDANMEMBER_GU_SELECT
(	
	v_id	IN	gudanmember.id%TYPE,
	out_gudanmembergu  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_gudanmembergu 
	FOR
	SELECT guno
	FROM GUDANMEMBER
	WHERE id = v_id;
END;
/


CREATE OR REPLACE PROCEDURE GUDANMEMBER_ID_SELECT
(	
	v_guno	IN	gudanmember.guno%TYPE,
	v_gumcomfirm	IN	gudanmember.gumcomfirm%TYPE,
	out_gudanmemberid  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_gudanmemberid
	FOR
	SELECT id
	FROM GUDANMEMBER
	WHERE guno = v_guno AND gumcomfirm = v_gumcomfirm;
END;
/

CREATE OR REPLACE PROCEDURE GUDAN_GPOSTS_SELECT
(
	v_gid		IN	gudan.gid%TYPE,
	out_gposts  OUT  SYS_REFCURSOR	
)
AS
BEGIN
	OPEN out_gposts
	FOR
	SELECT gposts 
	FROM GUDAN
	WHERE gid = v_gid;
END;
/


CREATE OR REPLACE PROCEDURE GUDAN_USERID_SELECT
(
	v_gid		IN	gudan.gid%TYPE,
	out_gidgg  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_gidgg
	FOR
	SELECT gname
	FROM GUDAN
	WHERE gid = v_gid;
END;
/



CREATE OR REPLACE PROCEDURE QNADP_UID_DELETE
(
	v_qndid		IN      qnadp.qndid%TYPE
)
IS
BEGIN
	DELETE FROM QNADP
	WHERE qndid = v_qndid; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE FREEGPDG_UID_DELETE
(
	v_frdid		IN      freegpdg.frdid%TYPE
)
IS
BEGIN
	DELETE FROM FREEGPDG
	WHERE frdid = v_frdid; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MATCHINGDP_UID_DELETE
(
	v_madid		IN      matchingdp.madid%TYPE
)
IS
BEGIN
	DELETE FROM MATCHINGDP
	WHERE madid = v_madid; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MATCH_UID_DELETE
(
	v_matgname		IN      match.matgname%TYPE
)
IS
BEGIN
	DELETE FROM MATCH
	WHERE matgname = v_matgname; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MATCHING_UID_DELETE
(
	v_magname		IN      matching.magname%TYPE
)
IS
BEGIN
	DELETE FROM MATCHING
	WHERE magname = v_magname; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MATCHINGGP_UID_DELETE
(
	v_id		IN      matchinggp.id%TYPE
)
IS
BEGIN
	DELETE FROM MATCHINGGP
	WHERE id = v_id; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE FREEGP_UID_DELETE
(
	v_id		IN      freegp.id%TYPE
)
IS
BEGIN
	DELETE FROM FREEGP
	WHERE id = v_id; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MESSAGE_UID_DELETE
(
	v_receiv	IN      message.receiv%TYPE,
	v_send		IN	message.send%TYPE	
)
IS
BEGIN
	DELETE FROM MESSAGE
	WHERE receiv = v_receiv OR send = v_send; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE GUDANMEMBER_UID_DELETE
(
	v_id		IN      gudanmember.id%TYPE
)
IS
BEGIN
	DELETE FROM GUDANMEMBER
	WHERE id = v_id; 
	COMMIT;
END;
/



CREATE OR REPLACE PROCEDURE GUDAN_UID_DELETE
(
	v_gid		IN      gudan.gid%TYPE
)
IS
BEGIN
	DELETE FROM GUDAN
	WHERE gid = v_gid; 
	COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE MEMBER_UID_DELETE
(
	v_id		IN      member.id%TYPE
)
IS
BEGIN
	DELETE FROM MEMBER
	WHERE id = v_id; 
	COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE MEMBER_CLUB_SELECT
(
	v_club		IN	member.club%TYPE,
	out_memberclub  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_memberclub
	FOR
	SELECT id
	FROM MEMBER
	WHERE club = v_club;
END;
/

CREATE OR REPLACE PROCEDURE MEMBER_CLID_UPDATE
(
	v_id		IN	member.id%TYPE
)
AS
BEGIN
	UPDATE MEMBER
	SET club = '', rating = '1', gpage = ''
	WHERE id = v_id;
	COMMIT;
END;
/




