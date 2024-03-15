SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM ADMIN;



--○1. 호스트 회원정보 테이블 생성
CREATE TABLE HOST
(  HO_CODE   VARCHAR2(20)
 , HO_ID     VARCHAR2(20)   NOT NULL
 , HO_PW     VARCHAR2(20)   NOT NULL
 , HO_DATE   DATE   DEFAULT SYSDATE
 , CONSTRAINT HOST_PK_CODE PRIMARY KEY(HO_CODE)
 , CONSTRAINT HOST_CK_ID CHECK ((LENGTH(HO_ID) >= 5) AND (LENGTH(HO_ID) <= 10))
 , CONSTRAINT HOST_UK_ID UNIQUE (HO_ID)
);



--○2. 관리자 정보 테이블 생성
CREATE TABLE ADMIN
( AD_CODE   VARCHAR2(20)
, AD_PW     VARCHAR2(20)   NOT NULL
, AD_NICK   VARCHAR2(20)   NOT NULL
, AD_DATE   DATE   DEFAULT SYSDATE 
, CONSTRAINT ADMIN_PK_CODE PRIMARY KEY(AD_CODE)
);

--○3. 성별 범례 테이블 생성
CREATE TABLE GENDER
( GENDER_CODE   VARCHAR2(20)  
, GENDER_RANGE  VARCHAR2(10)    NOT NULL
, CONSTRAINT GENDER_PK_CODE PRIMARY KEY(GENDER_CODE)
);


--○ 4. 그룹 공개 여부 범례 테이블 생성
CREATE TABLE GROUP_OPEN
( GO_CODE   VARCHAR2(20)
, GO_CHECK  VARCHAR2(10)    NOT NULL
, CONSTRAINT GROUP_OPEN_PK_CODE PRIMARY KEY(GO_CODE)
);

--○ 5. 카테고리 범례 테이블 생성
CREATE TABLE CATEGORY
( CATEGORY_CODE     VARCHAR2(20)
, CATEGORY_LIST     VARCHAR2(20)    NOT NULL
, CONSTRAINT CATEGORY_PK_CODE PRIMARY KEY(CATEGORY_CODE)
);


--○ 6. 연령대 범례 테이블 생성
CREATE TABLE AGE
( AGE_CODE      VARCHAR2(20)
, AGE_RANGE     VARCHAR2(10)    NOT NULL
, CONSTRAINT AGE_PK_CODE PRIMARY KEY(AGE_CODE)
);


--○ 7. 사유 범례 테이블 생성
CREATE TABLE REASON
( REASON_CODE   VARCHAR2(20)
, REASON        VARCHAR2(100)   NOT NULL
, CONSTRAINT REASON_PK_CODE PRIMARY KEY(REASON_CODE)
);


--○ 8. 신고처리상태 범례 테이블 생성
CREATE TABLE REDSTATE
( RED_CODE      VARCHAR2(20)
, REDSTATE      VARCHAR2(10)    NOT NULL
, CONSTRAINT REDSTATE_PK_CODE PRIMARY KEY(RED_CODE)
);


--○ 9. 게시판 대분류 범례 테이블 생성
CREATE TABLE BOARD_FIRST
( BF_CODE   VARCHAR2(20)
, BF_LIST   VARCHAR2(20)    NOT NULL
, CONSTRAINT BOARD_FIRST_PK_CODE PRIMARY KEY(BF_CODE)
);

--○ 10. 모집 기간 분류 범례 테이블 생성
CREATE TABLE PERIOD
( PERIOD_CODE   VARCHAR2(20)
, PERIOD_STATE  VARCHAR2(10)    NOT NULL
, CONSTRAINT PERIOD_PK_CODE PRIMARY KEY(PERIOD_CODE)
);

--○11. 이웃 유형 범례 테이블 생성
CREATE TABLE FRIEND_TYPE
( FT_CODE   VARCHAR2(20)
, FT_STATE  VARCHAR2(10)    NOT NULL
, CONSTRAINT FRIEND_TYPE_PK_CODE PRIMARY KEY(FT_CODE)
);

--○12. 지역 대분류 범례 테이블 생성
CREATE TABLE LOCATION_FIRST
( LF_CODE   VARCHAR2(20)
, LF_LIST   VARCHAR2(20)    NOT NULL
, CONSTRAINT LOCATION_FIRST_PK_CODE PRIMARY KEY(LF_CODE)
);

--○13. 모집 기간 종료 후 처리 상태 범례 테이블 생성
CREATE TABLE REGISTRATION_STATE
( RS_CODE   VARCHAR2(20)
, RS_STATE  VARCHAR2(10)    NOT NULL
, CONSTRAINT REGISTRATION_STATE_PK_CODE PRIMARY KEY(RS_CODE)
);

--○14. 이용 피드백 판별 볌례 테이블 생성
CREATE TABLE FEEDBACK_STATE
( FB_STATECODE  VARCHAR2(20)
, FB_STATE      VARCHAR2(10)    NOT NULL
, CONSTRAINT FEEDBACK_STATE_PK_CODE PRIMARY KEY(FB_STATECODE)
);

--○15. 관리자 확인 상태 범례 테이블 생성
CREATE TABLE ADMIN_CHECK
( AD_CHCODE     VARCHAR2(20)
, AD_CHECK      VARCHAR2(10)    NOT NULL
, CONSTRAINT ADMIN_CHECK_PK_CODE PRIMARY KEY(AD_CHCODE)
);

--○16. 일정 참석자 유무 범례 테이블 생성
CREATE TABLE ATTENDANCE
( ATT_CODE  VARCHAR2(20)
, ATT_STATE VARCHAR2(10)    NOT NULL
, CONSTRAINT ATTENDANCE_PK_CODE PRIMARY KEY(ATT_CODE)
);


--○17. 게스트 회원정보 테이블 생성
CREATE TABLE GUEST
( GU_CODE           VARCHAR2(20)
, GU_ID             VARCHAR2(20)    NOT NULL
, GU_PW             VARCHAR2(20)    NOT NULL
, GU_NICK           VARCHAR2(20)    NOT NULL
, GU_DATE           DATE    DEFAULT SYSDATE
, CATEGORY_CODE     VARCHAR2(20)
, CONSTRAINT GUEST_PK_CODE PRIMARY KEY(GU_CODE)
, CONSTRAINT GUEST_CK_ID CHECK ((LENGTH(GU_ID) >= 5) AND (LENGTH(GU_ID) <= 10))
, CONSTRAINT GUEST_UK_ID UNIQUE (GU_ID)
, CONSTRAINT GUEST_FK_CODE FOREIGN KEY(CATEGORY_CODE) REFERENCES CATEGORY(CATEGORY_CODE)
);

--○18. 지역 중분류 범례 테이블 생성
CREATE TABLE LOCATION_SECOND
( LS_CODE      VARCHAR2(20)
, LS_LIST      VARCHAR2(20) NOT NULL
, LF_CODE      VARCHAR2(20)
, CONSTRAINT LOCATION_SECOND_PK_CODE PRIMARY KEY(LS_CODE)
, CONSTRAINT LOCATION_SECOND_FK_CODE FOREIGN KEY(LF_CODE) REFERENCES LOCATION_FIRST(LF_CODE)
);

--○19. 스터디카페 정보 테이블 생성
CREATE TABLE STUDYCAFE
( SC_CODE       VARCHAR2(20)
, SC_NAME       VARCHAR2(100)   NOT NULL
, SC_ADDR1      VARCHAR2(500)   NOT NULL
, SC_ADDR2      VARCHAR2(500)   NOT NULL
, SC_TEL        CHAR(11)        NOT NULL
, SC_OPENHOUR   VARCHAR2(10)    NOT NULL
, SC_CLOSEHOUR  VARCHAR2(10)    NOT NULL
, SC_CONVENIENT VARCHAR2(200)   NOT NULL
, SC_SURROUND   VARCHAR2(200)   NOT NULL
, SC_CAUTION    VARCHAR2(4000)  NOT NULL
, SC_DETAIL     VARCHAR2(4000)  NOT NULL
, SC_RESNUMBER  CHAR(10)        NOT NULL
, SC_DATE       DATE            DEFAULT SYSDATE
, SC_FILE       VARCHAR2(320)   
, AD_PERDATE    DATE
, HO_CODE       VARCHAR2(20)
, AD_CODE       VARCHAR2(20)
, AD_CHCODE     VARCHAR2(20)    DEFAULT 0
, CONSTRAINT STUDYCAFE_PK_CODE PRIMARY KEY(SC_CODE)
, CONSTRAINT STUDYCAFE_FK_HO_CODE FOREIGN KEY(HO_CODE) REFERENCES HOST(HO_CODE)
, CONSTRAINT STUDYCAFE_FK_AD_CODE FOREIGN KEY(AD_CODE) REFERENCES ADMIN(AD_CODE)
, CONSTRAINT STUDYCAFE_FK_AD_CHCODE FOREIGN KEY(AD_CHCODE) REFERENCES ADMIN_CHECK(AD_CHCODE)
);

--○20. 게시판 소분류 코드 범례 테이블 생성
CREATE TABLE BOARD_SECOND
( BS_CODE       VARCHAR2(20)
, BS_LIST       VARCHAR2(20)    NOT NULL
, BF_CODE       VARCHAR2(20)    
, CONSTRAINT BOARD_SECOND_PK_BS_CODE PRIMARY KEY(BS_CODE)
, CONSTRAINT BOARD_SECOND_FK_BF_CODE FOREIGN KEY(BF_CODE) REFERENCES BOARD_FIRST(BF_CODE)
);

--○21. 호스트 개인정보 테이블 생성
CREATE TABLE HOST_INFO
( HO_NAME       VARCHAR2(20)    NOT NULL
, HO_TEL        CHAR(11)        NOT NULL
, HO_SSN        CHAR(13)        NOT NULL
, HO_EMAIL      VARCHAR2(320)   NOT NULL
, HO_CODE       VARCHAR2(20)
, CONSTRAINT HOST_INFO_UK_TEL UNIQUE(HO_TEL)
, CONSTRAINT HOST_INFO_UK_EMAIL UNIQUE(HO_EMAIL)
, CONSTRAINT HOST_INFO_FK_HO_CODE FOREIGN KEY(HO_CODE) REFERENCES HOST(HO_CODE)
);

--○22. 호스트 회원 탈퇴 테이블 생성
CREATE TABLE HOST_UNREG
( HO_UNCODE     VARCHAR2(20)
, HO_UNDATE     DATE    DEFAULT SYSDATE
, HO_CODE       VARCHAR2(20)
, REASON_CODE   VARCHAR2(20)
, CONSTRAINT HOST_UNREG_PK_HO_UNCODE PRIMARY KEY(HO_UNCODE)
, CONSTRAINT HOST_UNREG_FK_HO_CODE FOREIGN KEY(HO_CODE) REFERENCES HOST(HO_CODE)
, CONSTRAINT HOST_UNREG_FK_REASON_CODE FOREIGN KEY(REASON_CODE) REFERENCES REASON(REASON_CODE)
);

--○23. 공지사항 테이블 생성
CREATE TABLE NOTICE
( NT_CODE       VARCHAR2(20)
, NT_TITLE      VARCHAR2(100)   NOT NULL
, NT_CONTENT    VARCHAR2(4000)  NOT NULL
, NT_DATE       DATE            DEFAULT SYSDATE
, NT_VIEW       NUMBER(5)       DEFAULT 0
, NT_MODATE     DATE            DEFAULT SYSDATE
, AD_CODE       VARCHAR2(20)
, CONSTRAINT NOTICE_PK_NT_CODE PRIMARY KEY(NT_CODE)
, CONSTRAINT NOTICE_FK_AD_CODE FOREIGN KEY(AD_CODE) REFERENCES ADMIN(AD_CODE)
);

--○24. 관리자 비활성화 테이블 생성
CREATE TABLE ADMIN_STATE
( AD_STATEDATE      DATE            DEFAULT SYSDATE
, AD_CODE           VARCHAR2(20)
, CONSTRAINT ADMIN_STATE_FK_AD_CODE FOREIGN KEY(AD_CODE) REFERENCES ADMIN(AD_CODE)
);

--○25. 이웃 관리 테이블 생성
CREATE TABLE FRIEND_MANAGE
( FM_CODE       VARCHAR2(20)
, FM_DATE       DATE    DEFAULT SYSDATE
, GU_CODE       VARCHAR2(20)
, GU_FMCODE     VARCHAR2(20)
, FT_CODE   VARCHAR2(20)
, CONSTRAINT FRIEND_MANAGE_PK_FM_CODE PRIMARY KEY(FM_CODE)
, CONSTRAINT FRINED_MANAGE_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
, CONSTRAINT FRINED_MANAGE_FK_GU_FMCODE FOREIGN KEY(GU_FMCODE) REFERENCES GUEST(GU_CODE)
, CONSTRAINT FREIND_MANAGE_FK_FT_CODE FOREIGN KEY(FT_CODE) REFERENCES FRIEND_TYPE(FT_CODE)
);

--○26. 그룹 개설 요청 테이블 생성
CREATE TABLE GROUP_REGISTRATION
( GR_CODE       VARCHAR2(20)
, GR_DATE       DATE            DEFAULT SYSDATE
, GR_NAME       VARCHAR2(100)   NOT NULL
, GR_COUNT      NUMBER(1)       NOT NULL
, GR_SUBJECT    VARCHAR2(50)    NOT NULL
, GR_COMMENT    VARCHAR2(500)   NOT NULL
, GU_CODE       VARCHAR2(20) 
, AGE_CODE      VARCHAR2(20)
, GENDER_CODE   VARCHAR2(20)
, LS_CODE       VARCHAR2(20)
, CATEGORY_CODE VARCHAR2(20)
, GO_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_REG_PK_GR_CODE PRIMARY KEY(GR_CODE)
, CONSTRAINT GROUP_REG_CK_GR_COUNT CHECK ((GR_COUNT>=3) AND (GR_COUNT<=8))
, CONSTRAINT GROUP_REG_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
, CONSTRAINT GROUP_REG_FK_AGE_CODE FOREIGN KEY(AGE_CODE) REFERENCES AGE(AGE_CODE)
, CONSTRAINT GROUP_REG_FK_GENDER_CODE FOREIGN KEY(GENDER_CODE) REFERENCES GENDER(GENDER_CODE)
, CONSTRAINT GROUP_REG_FK_LS_CODE FOREIGN KEY(LS_CODE) REFERENCES LOCATION_SECOND(LS_CODE)
, CONSTRAINT GROUP_REG_FK_CATEGORY_CODE FOREIGN KEY(CATEGORY_CODE) REFERENCES CATEGORY(CATEGORY_CODE)
, CONSTRAINT GROUP_REG_FK_GO_CODE FOREIGN KEY(GO_CODE) REFERENCES GROUP_OPEN(GO_CODE)
);


--○27. 스터디룸 정보 테이블 생성
CREATE TABLE STUDYROOM
( SR_CODE       VARCHAR2(20)
, SR_NAME       VARCHAR2(100)   NOT NULL
, SR_COUNT      NUMBER(2)       NOT NULL
, SR_PRICE      NUMBER(5)       NOT NULL
, SC_CODE       VARCHAR2(20)   
, CONSTRAINT STUDYROOM_PK_SR_CODE PRIMARY KEY(SR_CODE)
, CONSTRAINT SUTDYROOM_CK_SR_COUNT CHECK(SR_COUNT > 0)
, CONSTRAINT SUTDYROOM_CK_SR_PRICE CHECK(SR_PRICE > 0)
, CONSTRAINT STUDYROON_FK_SC_CODE FOREIGN KEY(SC_CODE) REFERENCES STUDYCAFE(SC_CODE)
);

--○28. 게시글 테이블 생성
CREATE TABLE BOARD
( BO_CODE       VARCHAR2(20)
, BO_DATE       DATE            DEFAULT SYSDATE
, BO_TITLE      VARCHAR2(100)   NOT NULL
, BO_CONTENT    VARCHAR2(4000)  NOT NULL
, BO_VIEW       NUMBER(5)       DEFAULT 0
, BO_MODATE     DATE            DEFAULT SYSDATE
, BO_FILE       VARCHAR2(320)
, BS_CODE       VARCHAR2(20)
, GU_CODE       VARCHAR2(20)
, CONSTRAINT BOARD_PK_BO_CODE PRIMARY KEY(BO_CODE)
, CONSTRAINT BOARD_FK_BS_CODE FOREIGN KEY(BS_CODE) REFERENCES BOARD_SECOND(BS_CODE)
, CONSTRAINT BOARD_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
);

--○29. 개인 일정 테이블 생성
CREATE TABLE SCHEDULE
( SCH_CODE      VARCHAR2(20)
, SCH_DATE      DATE            NOT NULL
, SCH_NAME      VARCHAR2(100)   NOT NULL
, SCH_CONTENT   VARCHAR2(4000)  NOT NULL
, SCH_REGDATE   DATE            DEFAULT SYSDATE
, GU_CODE       VARCHAR2(20)    
, CONSTRAINT SCHEDULE_PK_SCH_CODE PRIMARY KEY(SCH_CODE)
, CONSTRAINT SCHEDULE_CK_SCH_DATE CHECK(SCH_DATE >= SCH_REGDATE)
, CONSTRAINT SCHEDULE_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
);

--○30. 스터디카페 즐겨찾기 테이블 생성
CREATE TABLE BOOKMARK
( BM_CODE       VARCHAR2(20)
, BM_DATE       DATE            DEFAULT SYSDATE
, SC_CODE       VARCHAR2(20)
, GU_CODE       VARCHAR2(20)
, CONSTRAINT BOOKMARK_PK_BM_CODE PRIMARY KEY(BM_CODE)
, CONSTRAINT BOOKMARK_FK_SC_CODE FOREIGN KEY(SC_CODE) REFERENCES STUDYCAFE(SC_CODE)
, CONSTRAINT BOOKMARK_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
);

--○31. 게스트 개인정보 테이블 생성
CREATE TABLE GUEST_INFO
( GU_NAME       VARCHAR2(20)    NOT NULL
, GU_TEL        CHAR(11)        NOT NULL
, GU_SSN        CHAR(13)        NOT NULL
, GU_EMAIL      VARCHAR2(320)   NOT NULL
, GU_CODE       VARCHAR2(20)
, CONSTRAINT GUEST_INFO_UK_TEL UNIQUE(GU_TEL)
, CONSTRAINT GUEST_INFO_UK_EMAIL UNIQUE(GU_EMAIL)
, CONSTRAINT GUEST_INFO_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
);

--○32. 게스트 회원 탈퇴 테이블 생성
CREATE TABLE GUEST_UNREG
( GU_UNCODE     VARCHAR2(20)
, GU_UNDATE     DATE    DEFAULT SYSDATE
, GU_CODE       VARCHAR2(20)
, REASON_CODE   VARCHAR2(20)
, CONSTRAINT GUEST_UNREG_PK_GU_UNCODE PRIMARY KEY(GU_UNCODE)
, CONSTRAINT GUEST_UNREG_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
, CONSTRAINT GUEST_UNREG_FK_REASON_CODE FOREIGN KEY(REASON_CODE) REFERENCES REASON(REASON_CODE)
);

--○33. 비공개 스터디그룹 비밀번호 테이블 생성
CREATE TABLE GROUP_PW
( GP_CODE   VARCHAR2(20)
, GP_PW     NUMBER(4)
, GR_CODE   VARCHAR2(20)
, CONSTRAINT GROUP_PW_PK_GP_CODE PRIMARY KEY(GP_CODE)
, CONSTRAINT GROUP_PW_CK_GP_PW CHECK(LENGTH(GP_PW)= 4 )
, CONSTRAINT GROUP_PW_FK_GR_CODE FOREIGN KEY(GR_CODE) REFERENCES GROUP_REGISTRATION(GR_CODE)
);

--○34. 스터디그룹 가입 요청 테이블
CREATE TABLE GROUP_JOIN
( GJ_CODE       VARCHAR2(20)
, GJ_DATE       DATE        DEFAULT SYSDATE
, GU_CODE       VARCHAR2(20)
, GR_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_JOIN_PK_GJ_CODE PRIMARY KEY(GJ_CODE)
, CONSTRAINT GROUP_JOIN_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
, CONSTRAINT GROUP_JOIN_FK_GR_CODE FOREIGN KEY(GR_CODE) REFERENCES GROUP_REGISTRATION(GR_CODE)
);

--○35. 스터디룸 예약 테이블 생성
CREATE TABLE RESERVATION
( RE_CODE       VARCHAR2(20)
, RE_STARTDATE  DATE            NOT NULL
, RE_STARTHOUR   VARCHAR2(10)    NOT NULL
, RE_ENDHOUR    VARCHAR2(10)    NOT NULL
, RE_COUNT      NUMBER(2)       NOT NULL
, RE_DATE       DATE            DEFAULT SYSDATE
, GJ_CODE       VARCHAR2(20)
, SR_CODE       VARCHAR2(20)
, CONSTRAINT RESERVATION_PK_RE_CODE PRIMARY KEY(RE_CODE)
, CONSTRAINT RESERVATION_CK_RE_STARTDATE CHECK(RE_STARTDATE >= RE_DATE)
, CONSTRAINT RESERVATION_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
, CONSTRAINT RESERVATION_FK_SR_CODE FOREIGN KEY(SR_CODE) REFERENCES STUDYROOM(SR_CODE)
);

--○36. 게시글 스크랩 테이블 생성
CREATE TABLE SCRAP
( SCRAP_CODE        VARCHAR2(20)
, SCRAP_DATE        DATE            DEFAULT SYSDATE
, BO_CODE           VARCHAR2(20)
, GU_CODE           VARCHAR2(20)
, CONSTRAINT SCRAP_PK_SCRAP_CODE PRIMARY KEY(SCRAP_CODE)
, CONSTRAINT SCRAP_FK_BO_CODE FOREIGN KEY(BO_CODE) REFERENCES BOARD(BO_CODE)
, CONSTRAINT SCRAP_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
);

--○37. 댓글 테이블 생성
CREATE TABLE REPLY
( RP_CODE       VARCHAR2(20)
, RP_DATE       DATE            DEFAULT SYSDATE
, RP_CONTENT    VARCHAR2(500)   NOT NULL
, RP_MODATE     DATE            DEFAULT SYSDATE
, BO_CODE       VARCHAR2(20)
, GU_CODE       VARCHAR2(20)
, CONSTRAINT REPLY_PK_RP_CODE PRIMARY KEY(RP_CODE)
, CONSTRAINT REPLY_FK_BO_CODE FOREIGN KEY(BO_CODE) REFERENCES BOARD(BO_CODE)
, CONSTRAINT REPLY_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
);

--○38. 게시판 신고 요청 테이블
CREATE TABLE BOARD_RED
( BOR_CODE      VARCHAR2(20)
, BOR_DATE      DATE            DEFAULT SYSDATE
, REASON_CODE   VARCHAR2(20)
, BO_CODE       VARCHAR2(20)
, GU_CODE       VARCHAR2(20)
, CONSTRAINT BOARD_RED_BOR_CODE PRIMARY KEY(BOR_CODE)
, CONSTRAINT BOARD_RED_FK_BO_CODE FOREIGN KEY(BO_CODE) REFERENCES BOARD(BO_CODE)
, CONSTRAINT BOARD_RED_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
);

--○39. 그룹 추가 모집 테이블 생성
CREATE TABLE GROUP_ADD
( GA_CODE       VARCHAR2(20)
, GA_DATE       DATE            DEFAULT SYSDATE
, GR_CODE       VARCHAR2(20)
, PERIOD_CODE   VARCHAR2(20)
, CONSTRAINT GROUP_ADD_PK_GA_CODE PRIMARY KEY(GA_CODE)
, CONSTRAINT GROUP_ADD_FK_GR_CODE FOREIGN KEY(GR_CODE) REFERENCES GROUP_REGISTRATION(GR_CODE)
, CONSTRAINT GROUP_ADD_FK_PERIOD_CODE FOREIGN KEY(PERIOD_CODE) REFERENCES PERIOD(PERIOD_CODE)
);

--○40. 스터디그룹 개설 요청 처리 테이블 생성
CREATE TABLE GROUP_CONFIRM
( GC_CODE       VARCHAR2(20)
, RS_CODE       VARCHAR2(20)
, GR_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_CONFIRM_PK_GC_CODE PRIMARY KEY(GC_CODE)
, CONSTRAINT GROUP_CONFIRM_FK_RS_CODE FOREIGN KEY(RS_CODE) REFERENCES REGISTRATION_STATE(RS_CODE)
, CONSTRAINT GROUP_CONFIRM_FK_GR_CODE FOREIGN KEY(GR_CODE) REFERENCES GROUP_REGISTRATION(GR_CODE)
);

--○41. 스터디그룹 모집 기간 종료 전 철회 테이블 생성
CREATE TABLE GROUP_UNREGISTRATION
( GUR_CODE      VARCHAR2(20)
, GUR_DATE      DATE        DEFAULT SYSDATE
, GR_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_UNREG_PK_GUR_CODE PRIMARY KEY(GUR_CODE)
, CONSTRAINT GROUP_UNREG_FK_GR_CODE FOREIGN KEY(GR_CODE) REFERENCES GROUP_REGISTRATION(GR_CODE)
);

--○42. 스터디그룹 탈퇴 테이블 생성
CREATE TABLE GROUP_UNREG
( GUN_CODE      VARCHAR2(20)
, GUN_DATE      DATE        DEFAULT SYSDATE
, REASON_CODE   VARCHAR2(20)
, GJ_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_UNREG_PK_GUN_CODE PRIMARY KEY(GUN_CODE)
, CONSTRAINT GROUP_UNREG_FK_REASON_CODE FOREIGN KEY(REASON_CODE) REFERENCES REASON(REASON_CODE)
, CONSTRAINT GROUP_UNREG_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○43. 스터디그룹 해체 테이블 생성
CREATE TABLE BREAK
( BR_CODE       VARCHAR2(20)
, BR_DATE       DATE        DEFAULT SYSDATE
, REASON_CODE   VARCHAR2(20)
, GC_CODE       VARCHAR2(20) 
, CONSTRAINT BREAK_PK_BR_CODE PRIMARY KEY(BR_CODE)
, CONSTRAINT BREAK_FK_REASON_CODE FOREIGN KEY(REASON_CODE) REFERENCES REASON(REASON_CODE)
, CONSTRAINT BREAK_FK_GC_CODE FOREIGN KEY(GC_CODE) REFERENCES GROUP_CONFIRM(GC_CODE)
);

--○44. 게시글 신고 처리 결과 테이블 생성
CREATE TABLE BOARD_REDDONE
( BRD_CODE  VARCHAR2(20)
, BRD_DATE  DATE        DEFAULT SYSDATE
, RED_CODE  VARCHAR2(20)
, BOR_CODE  VARCHAR2(20)
, CONSTRAINT BOARD_REDDONE_PK_BRD_CODE PRIMARY KEY(BRD_CODE)
, CONSTRAINT BOARD_REDDONE_FK_RED_CODE FOREIGN KEY(RED_CODE) REFERENCES REDSTATE(RED_CODE)
, CONSTRAINT BOARD_REDDONE_FK_BOR_CODE FOREIGN KEY(BOR_CODE) REFERENCES BOARD_RED(BOR_CODE)
);

--○45. 게시판 대댓글 테이블 생성
CREATE TABLE RE_REPLY
( RRE_CODE       VARCHAR2(20)
, RRE_DATE       DATE            DEFAULT SYSDATE
, RRE_CONTENT    VARCHAR2(500)   NOT NULL
, RRE_MODATE     DATE            DEFAULT SYSDATE
, RP_CODE        VARCHAR2(20)
, GU_CODE        VARCHAR2(20)
, CONSTRAINT RE_REPLY_PK_RRE_CODE PRIMARY KEY(RRE_CODE)
, CONSTRAINT RE_REPLY_FK_RP_CODE FOREIGN KEY(RP_CODE) REFERENCES REPLY(RP_CODE)
, CONSTRAINT RE_REPLY_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
);

--○46. 그룹 일정 테이블 생성
CREATE TABLE GROUP_SCHEDULE
( GSCH_CODE      VARCHAR2(20)
, GSCH_DATE      DATE            NOT NULL
, GSCH_NAME      VARCHAR2(100)   NOT NULL
, GSCH_CONTENT   VARCHAR2(4000)  NOT NULL
, GSCH_REGDATE   DATE            DEFAULT SYSDATE
, GSCH_LOCATION  VARCHAR2(500)   NOT NULL
, GSCH_STARTHOUR CHAR(5)         NOT NULL
, GSCH_ENDHOUR   CHAR(5)         NOT NULL
, GSCH_MODATE    DATE            DEFAULT SYSDATE
, GJ_CODE        VARCHAR2(20)    
, ATT_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_SCHEDULE_PK_GSCH_CODE PRIMARY KEY(GSCH_CODE)
, CONSTRAINT GROUP_SCHEDULE_CK_GSCH_DATE CHECK(GSCH_DATE >= GSCH_REGDATE)
, CONSTRAINT GROUP_SCHEDULE_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
, CONSTRAINT GROUP_SCHEDULE_FK_ATT_CODE FOREIGN KEY(ATT_CODE) REFERENCES ATTENDANCE(ATT_CODE)
);

--○47. 그룹 게시글 테이블 생성
CREATE TABLE GROUP_BOARD
( GB_CODE       VARCHAR2(20)
, GB_DATE       DATE            DEFAULT SYSDATE
, GB_TITLE      VARCHAR2(100)   NOT NULL
, GB_CONTENT    VARCHAR2(4000)  NOT NULL
, GB_VIEW       NUMBER(5)       DEFAULT 0
, GB_MODATE     DATE            DEFAULT SYSDATE
, GB_FILE       VARCHAR2(320)
, GJ_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_BOARD_PK_GB_CODE PRIMARY KEY(GB_CODE)
, CONSTRAINT GROUP_BOARD_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○48. 댓글 신고요청 테이블 생성
CREATE TABLE REPLY_RED
( RR_CODE       VARCHAR2(20)
, RR_DATE       DATE        DEFAULT SYSDATE
, REASON_CODE   VARCHAR2(20)
, GU_CODE       VARCHAR2(20)
, RP_CODE       VARCHAR2(20)
, CONSTRAINT REPLY_RED_PK_RR_CODE PRIMARY KEY(RR_CODE)
, CONSTRAINT REPLY_RED_FK_REASON_CODE FOREIGN KEY(REASON_CODE) REFERENCES REASON(REASON_CODE)
, CONSTRAINT REPLY_RED_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
, CONSTRAINT REPLY_RED_FK_RP_CODE FOREIGN KEY(RP_CODE) REFERENCES REPLY(RP_CODE)
);

--○49. 휴공 티켓 사용 내역 테이블 생성
CREATE TABLE REST_TICKET
( RT_CODE       VARCHAR2(20)
, RT_DATE       DATE        DEFAULT SYSDATE
, GJ_CODE       VARCHAR2(20)
, CONSTRAINT REST_TICKET_PK_RT_CODE PRIMARY KEY(RT_CODE)
, CONSTRAINT REST_TICKET_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○50. 스터디룸 예약 취소 내역 테이블 생성
CREATE TABLE RECANCEL
( RC_CODE   VARCHAR2(20)
, RC_DATE   DATE        DEFAULT SYSDATE
, RE_CODE   VARCHAR2(20)
, CONSTRAINT RECANCEL_PK_RC_CODE PRIMARY KEY(RC_CODE)
, CONSTRAINT RECANCEL_FK_RE_CODE FOREIGN KEY(RE_CODE) REFERENCES RESERVATION(RE_CODE)
);

--○51. 스터디룸 이용내역 피드백 테이블 생성
CREATE TABLE FEEDBACK
( FB_CODE       VARCHAR2(20)
, FB_STATECODE  VARCHAR2(20)
, RE_CODE       VARCHAR2(20)
, CONSTRAINT FEEDBACK_PK_FB_CODE PRIMARY KEY(FB_CODE)
, CONSTRAINT FEEDBACK_FK_RE_CODE FOREIGN KEY(RE_CODE) REFERENCES RESERVATION(RE_CODE)
);

--○52. 그룹장 변경 테이블 생성
CREATE TABLE LEADER_CHANGE
( LC_CODE   VARCHAR2(20)
, LC_DATE   DATE        DEFAULT SYSDATE
, GJ_CODE   VARCHAR2(20)
, CONSTRAINT LEADER_CHANGE_PK_LC_CODE PRIMARY KEY(LC_CODE)
, CONSTRAINT LEADER_CHANGE_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○53. 그룹 해체 패널티 테이블 생성
CREATE TABLE PENALTY_BREAK
( PB_CODE   VARCHAR2(20)
, BR_CODE   VARCHAR2(20)
, GJ_CODE   VARCHAR2(20)
, CONSTRAINT PENALTY_BREAK_PK_PB_CODE PRIMARY KEY(PB_CODE)
, CONSTRAINT PENALTY_BREAK_FK_BR_CODE FOREIGN KEY(BR_CODE) REFERENCES BREAK(BR_CODE)
, CONSTRAINT PENALTY_BREAK_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○54. 대댓글 신고요청 테이블 생성
CREATE TABLE REREPLY_RED
( RER_CODE       VARCHAR2(20)
, RER_DATE       DATE        DEFAULT SYSDATE
, REASON_CODE   VARCHAR2(20)
, GU_CODE       VARCHAR2(20)
, RRE_CODE       VARCHAR2(20)
, CONSTRAINT REREPLY_RED_PK_RER_CODE PRIMARY KEY(RER_CODE)
, CONSTRAINT REREPLY_RED_FK_REASON_CODE FOREIGN KEY(REASON_CODE) REFERENCES REASON(REASON_CODE)
, CONSTRAINT REREPLY_RED_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
, CONSTRAINT REREPLY_RED_FK_RRE_CODE FOREIGN KEY(RRE_CODE) REFERENCES RE_REPLY(RRE_CODE)
); 

--○55. 댓글 신고처리 결과 테이블 생성
CREATE TABLE REPLY_REDDONE
( RRD_CODE  VARCHAR2(20)
, RRD_DATE  DATE        DEFAULT SYSDATE
, RED_CODE  VARCHAR2(20)
, RR_CODE  VARCHAR2(20)
, CONSTRAINT REPLY_REDDONE_PK_RRD_CODE PRIMARY KEY(RRD_CODE)
, CONSTRAINT REPLY_REDDONE_FK_RED_CODE FOREIGN KEY(RED_CODE) REFERENCES REDSTATE(RED_CODE)
, CONSTRAINT REPLY_REDDONE_FK_RR_CODE FOREIGN KEY(RR_CODE) REFERENCES REPLY_RED(RR_CODE)
);

--○56. 그룹 게시글 스크랩 테이블 생성
CREATE TABLE GROUP_SCRAP
( GBS_CODE        VARCHAR2(20)
, GBS_DATE        DATE            DEFAULT SYSDATE
, GB_CODE           VARCHAR2(20)
, GJ_CODE           VARCHAR2(20)
, CONSTRAINT GROUP_SCRAP_PK_GBS_CODE PRIMARY KEY(GBS_CODE)
, CONSTRAINT GROUP_SCRAP_FK_GB_CODE FOREIGN KEY(GB_CODE) REFERENCES GROUP_BOARD(GB_CODE)
, CONSTRAINT GROUP_SCRAP_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○57. 호스트 신고 요청 테이블 생성
CREATE TABLE HOST_RED
( HR_CODE   VARCHAR2(20)
, HR_DATE   DATE        DEFAULT SYSDATE
, HR_FILE   VARCHAR2(320)
, FB_CODE   VARCHAR2(20)
, REASON_CODE   VARCHAR2(20)
, CONSTRAINT HOST_RED_PK_HR_CODE PRIMARY KEY(HR_CODE)
, CONSTRAINT HOST_RED_FK_FB_CODE FOREIGN KEY(FB_CODE) REFERENCES FEEDBACK(FB_CODE)
, CONSTRAINT HOST_RED_FK_REASON_CODE FOREIGN KEY(REASON_CODE) REFERENCES REASON(REASON_CODE)
);

--○58. 게시글 개인 패널티 테이블 생성
CREATE TABLE PENALTY_BOARD
( PBO_CODE  VARCHAR2(20)
, PBO_DATE  DATE        DEFAULT SYSDATE
, BRD_CODE  VARCHAR2(20)
, CONSTRAINT PENALTY_BOARD_PK_PBO_CODE PRIMARY KEY(PBO_CODE)
, CONSTRAINT PENALTY_BOARD_FK_BRD_CODE FOREIGN KEY(BRD_CODE) REFERENCES BOARD_REDDONE(BRD_CODE)
);

--○59. 그룹 게시판 댓글 테이블 생성
CREATE TABLE GROUP_REPLY
( GRE_CODE      VARCHAR2(20)
, GRE_DATE      DATE        DEFAULT SYSDATE
, GRE_CONTENT   VARCHAR2(500)   NOT NULL
, GRE_MODATE   DATE    DEFAULT SYSDATE
, GB_CODE       VARCHAR2(20)
, GJ_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_REPLY_PK_GRE_CODE PRIMARY KEY(GRE_CODE)
, CONSTRAINT GROUP_REPLY_FK_GB_CODE FOREIGN KEY(GB_CODE) REFERENCES GROUP_BOARD(GB_CODE)
, CONSTRAINT GROUP_REPLY_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○60. 그룹 게시글 신고 요청 테이블 생성
CREATE TABLE GROUP_BOARDRED
( GBR_CODE      VARCHAR2(20)
, GBR_DATE      DATE            DEFAULT SYSDATE
, REASON_CODE   VARCHAR2(20)
, GB_CODE       VARCHAR2(20)
, GJ_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_BOARDRED_GBR_CODE PRIMARY KEY(GBR_CODE)
, CONSTRAINT GROUP_BOARDRED_FK_REASON_CODE FOREIGN KEY(REASON_CODE) REFERENCES REASON(REASON_CODE)
, CONSTRAINT GROUP_BOARDRED_FK_GB_CODE FOREIGN KEY(GB_CODE) REFERENCES GROUP_BOARD(GB_CODE)
, CONSTRAINT GROUP_BOARDRED_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○61. 스터디카페 리뷰 테이블 생성
CREATE TABLE REVIEW
( RV_CODE       VARCHAR2(20)
, RV_CONTENT    VARCHAR2(500)   NOT NULL
, RV_DATE       DATE            DEFAULT SYSDATE
, RV_MODATE     DATE            DEFAULT SYSDATE
, FB_CODE       VARCHAR2(20)
, CONSTRAINT REVIEW_PK_RV_CODE PRIMARY KEY(RV_CODE)
, CONSTRAINT REVIEW_FK_FB_CODE FOREIGN KEY(FB_CODE) REFERENCES FEEDBACK(FB_CODE)
);

--○62. 참석자 명단 내역 테이블 생성
CREATE TABLE ATTENDANCE_LIST
( ATTL_CODE     VARCHAR2(20)
, GSCH_CODE     VARCHAR2(20)
, GJ_CODE       VARCHAR2(20)
, CONSTRAINT ATTENDANCE_LIST_PK_ATTL_CODE PRIMARY KEY(ATTL_CODE)
, CONSTRAINT ATTENDANCE_LIST_FK_GSCH_CODE FOREIGN KEY(GSCH_CODE) REFERENCES GROUP_SCHEDULE(GSCH_CODE)
, CONSTRAINT ATTENDANCE_LIST_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○63. 스터디그룹 모임 내역 테이블 생성
CREATE TABLE GROUP_MEETLIST
( GM_CODE       VARCHAR2(20)
, GM_CONTENT    VARCHAR2(4000)    NOT NULL
, GSCH_CODE     VARCHAR2(20)
, CONSTRAINT GROUP_MEETLIST_PK_GM_CODE PRIMARY KEY(GM_CODE)
, CONSTRAINT GROUP_MEETLIST_FK_GSCH_CODE FOREIGN KEY(GSCH_CODE) REFERENCES GROUP_SCHEDULE(GSCH_CODE)
);

--○64. 대댓글 신고처리 결과 테이블 생성
CREATE TABLE REREPLY_REDDONE
( RERD_CODE     VARCHAR2(20)
, RERD_DATE     DATE            DEFAULT SYSDATE
, RED_CODE      VARCHAR2(20)
, RER_CODE      VARCHAR2(20)
, CONSTRAINT REREPLY_REDDONE_PK_RERD_CODE PRIMARY KEY(RERD_CODE)
, CONSTRAINT REREPLY_REDDONE_FK_RED_CODE FOREIGN KEY(RED_CODE) REFERENCES REDSTATE(RED_CODE)
, CONSTRAINT REREPLY_REDDONE_FK_RER_CODE FOREIGN KEY(RER_CODE) REFERENCES REREPLY_RED(RER_CODE)
);

--○65. 호스트 신고처리 결과 테이블 생성
CREATE TABLE HOST_REDDONE
( HRD_CODE      VARCHAR2(20)
, HRD_DATE      DATE            DEFAULT SYSDATE
, HR_CODE       VARCHAR2(20)
, RED_CODE      VARCHAR2(20)
, CONSTRAINT HOST_REDDONE_PK_HRD_CODE PRIMARY KEY(HRD_CODE)
, CONSTRAINT HOST_REDDONE_FK_HR_CODE FOREIGN KEY(HR_CODE) REFERENCES HOST_RED(HR_CODE)
, CONSTRAINT HOST_REDDONE_FK_RED_CODE FOREIGN KEY(RED_CODE) REFERENCES REDSTATE(RED_CODE) 
);

--○66. 댓글 개인 패널티 테이블 생성
CREATE TABLE PENALTY_REPLY
( PR_CODE   VARCHAR2(20)
, PR_DATE   DATE        DEFAULT SYSDATE
, RRD_CODE  VARCHAR2(20)
, CONSTRAINT PENALTY_REPLY_PK_PR_CODE PRIMARY KEY(PR_CODE)
, CONSTRAINT PENALTY_REPLY_FK_RRD_CODE FOREIGN KEY(RRD_CODE) REFERENCES REPLY_REDDONE(RRD_CODE)
);

--○67. 그룹 게시판 댓글 신고요청 테이블 생성
CREATE TABLE GROUP_REPLYRED
( GRR_CODE       VARCHAR2(20)
, GRR_DATE       DATE            DEFAULT SYSDATE
, REASON_CODE    VARCHAR2(20)
, GRE_CODE       VARCHAR2(20)
, GJ_CODE        VARCHAR2(20)
, CONSTRAINT GROUP_REPLYRED_GRR_CODE PRIMARY KEY(GRR_CODE)
, CONSTRAINT GROUP_REPLYRED_FK_REASON_CODE FOREIGN KEY(REASON_CODE) REFERENCES REASON(REASON_CODE)
, CONSTRAINT GROUP_REPLYRED_FK_GRE_CODE FOREIGN KEY(GRE_CODE) REFERENCES GROUP_REPLY(GRE_CODE)
, CONSTRAINT GROUP_REPLYRED_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

--○68. 그룹 게시글 신고 처리결과 테이블 생성
CREATE TABLE GROUP_BOARDREDDONE
( GBRD_CODE       VARCHAR2(20)
, GBRD_DATE       DATE            DEFAULT SYSDATE
, RED_CODE        VARCHAR2(20)
, GBR_CODE        VARCHAR2(20)
, CONSTRAINT GROUP_BOARDREDDONE_GBRD_CODE PRIMARY KEY(GBRD_CODE)
, CONSTRAINT GROUP_BOARDREDDONE_FK_RED_CODE FOREIGN KEY(RED_CODE) REFERENCES REDSTATE(RED_CODE)
, CONSTRAINT GROUP_BOARDREDDONE_FK_GBR_CODE FOREIGN KEY(GBR_CODE) REFERENCES GROUP_BOARDRED(GBR_CODE)
);

--○69. 불참 테이블 생성
CREATE TABLE UNATTENDANCE
( UNATT_CODE    VARCHAR2(20)
, ATTL_CODE     VARCHAR2(20)
, CONSTRAINT UNATTENDANCE_PK_UNATT_CODE PRIMARY KEY(UNATT_CODE)
, CONSTRAINT UNATTENDANCE_FK_ATTL_CODE FOREIGN KEY(ATTL_CODE) REFERENCES ATTENDANCE_LIST(ATTL_CODE)
);

--○70. 그룹 패널티 테이블 생성
CREATE TABLE PENALTY_GROUP
( PG_CODE   VARCHAR2(20)
, PG_DATE   DATE        DEFAULT SYSDATE
, HRD_CODE  VARCHAR2(20)
, CONSTRAINT PENALTY_GROUP_PK_PG_CODE PRIMARY KEY(PG_CODE)
, CONSTRAINT PENALTY_GROUP_FK_HRD_CODE FOREIGN KEY(HRD_CODE) REFERENCES HOST_REDDONE(HRD_CODE)
);

--○71. 그룹 내 댓글 신고처리결과 테이블 생성
CREATE TABLE GROUP_REPLYREDDONE
( GRRD_CODE     VARCHAR2(20)
, GRRD_DATE     DATE    DEFAULT SYSDATE
, RED_CODE      VARCHAR2(20)
, GRR_CODE      VARCHAR2(20)
, CONSTRAINT GROUP_REREDDONE_PK_GRRD_CODE PRIMARY KEY(GRRD_CODE)
, CONSTRAINT GROUP_REREDDONE_FK_RED_CODE FOREIGN KEY(RED_CODE) REFERENCES REDSTATE(RED_CODE)
, CONSTRAINT GROUP_REREDDONE_FK_GRR_CODE FOREIGN KEY(GRR_CODE) REFERENCES GROUP_REPLYRED(GRR_CODE)
);

--○72. 그룹 내 게시글 개인 패널티 테이블 생성
CREATE TABLE PENALTY_GROUPBOARD
( PGB_CODE  VARCHAR2(20)
, PGB_DATE  DATE        DEFAULT SYSDATE
, GBRD_CODE VARCHAR2(20)
, CONSTRAINT PENALTY_GRBOARD_PK_PGB_CODE PRIMARY KEY(PGB_CODE)
, CONSTRAINT PENALTY_GRBOARD_FK_GBRD_CODE FOREIGN KEY(GBRD_CODE) REFERENCES GROUP_BOARDREDDONE(GBRD_CODE)
);

--○73. 불참 패널티 테이블 생성
CREATE TABLE PENALTY_UNATTENDANCE
( PU_CODE       VARCHAR2(20)
, PU_DATE       DATE    DEFAULT SYSDATE
, UNATT_CODE    VARCHAR2(20)
, CONSTRAINT PENALTY_UNATT_PK_PU_CODE PRIMARY KEY(PU_CODE)
, CONSTRAINT PENALTY_UNATT_FK_UNATT_CODE FOREIGN KEY(UNATT_CODE) REFERENCES UNATTENDANCE(UNATT_CODE)
);

--○74. 그룹 내 댓글 개인패널티 테이블 생성
CREATE TABLE PENALTY_GROUPREPLY
( PGR_CODE  VARCHAR2(20)
, PGR_DATE  DATE    DEFAULT SYSDATE
, GRRD_CODE VARCHAR2(20)
, CONSTRAINT PENALTY_GROUPRE_PK_PGR_CODE PRIMARY KEY(PGR_CODE)
, CONSTRAINT PENALTY_GROUPRE_FK_GRRD_CODE FOREIGN KEY(GRRD_CODE) REFERENCES GROUP_REPLYREDDONE(GRRD_CODE)
);

--○75. 대댓글 개인패널티 테이블 생성
CREATE TABLE PENALTY_REREPLY
( PRR_CODE  VARCHAR2(20)
, PRR_DATE  DATE        DEFAULT SYSDATE
, RERD_CODE VARCHAR2(20)
, CONSTRAINT PENALTY_REREPLY_PK_RRR_CODE PRIMARY KEY(PRR_CODE)
, CONSTRAINT PENALTY_REREPLY_FK_RERD_CODE FOREIGN KEY(RERD_CODE) REFERENCES REREPLY_REDDONE(RERD_CODE)
);

CREATE TABLE CAFEUNREG
( CM_CODE   VARCHAR2(20)  
, CM_DATE   DATE          DEFAULT SYSDATE
, SC_CODE   VARCHAR2(20)  NOT NULL
, CONSTRAINT CAFEUNREG_PK_CM_CODE PRIMARY KEY(CM_CODE)
, CONSTRAINT CAFEUNREG_FK_SC_CODE FOREIGN KEY(SC_CODE) REFERENCES STUDYCAFE(SC_CODE)
);

--○77. 스터디룸 비활성화 테이블 생성
CREATE TABLE ROOMUNREG
( RM_CODE VARCHAR2(20)
, RM_DATE DATE          DEFAULT SYSDATE
, SR_CODE VARCHAR2(20)  NOT NULL
, CONSTRAINT ROOMUNREG_PK_RM_CODE PRIMARY KEY(RM_CODE)
, CONSTRAINT ROOMUNREG_FK_SR_CODE FOREIGN KEY(SR_CODE) REFERENCES STUDYROOM(SR_CODE)
);