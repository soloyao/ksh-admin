prompt
prompt Creating table T_BJLC_DDR
prompt =========================
prompt
create table KSH.T_BJLC_DDR
(
  tid      VARCHAR2(32) default sys_guid(),
  sfzhm    VARCHAR2(32),
  userid   VARCHAR2(32),
  username VARCHAR2(32),
  ip       VARCHAR2(32),
  times    DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_BJLC_DDR
  is '����������ñ�';

prompt
prompt Creating table T_CITY_CENTER
prompt ============================
prompt
create table KSH.T_CITY_CENTER
(
  id    VARCHAR2(32) default sys_guid(),
  point VARCHAR2(120),
  sheng VARCHAR2(30),
  city  VARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_HDAB_CUSTOMDATA
prompt ================================
prompt
create table KSH.T_HDAB_CUSTOMDATA
(
  tid    VARCHAR2(32),
  sid    VARCHAR2(32),
  userid VARCHAR2(32),
  name   VARCHAR2(512),
  isdel  CHAR(1) default 0,
  times  DATE default sysdate,
  qydm   CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_HDAB_CUSTOMDATA
  is '�Զ�������';

prompt
prompt Creating table T_HDAB_CUSTOMDATA_INFO
prompt =====================================
prompt
create table KSH.T_HDAB_CUSTOMDATA_INFO
(
  tid  VARCHAR2(32) default sys_guid(),
  sid  VARCHAR2(32),
  x    VARCHAR2(32),
  y    VARCHAR2(32),
  name VARCHAR2(512)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_HDAB_CUSTOMDATA_INFO
  is '�Զ��������ӱ�';

prompt
prompt Creating table T_HDAB_INFO
prompt ==========================
prompt
create table KSH.T_HDAB_INFO
(
  tid        VARCHAR2(32) default sys_guid(),
  bh         VARCHAR2(23),
  mc         VARCHAR2(256),
  dz         VARCHAR2(256),
  sj         VARCHAR2(10),
  jlr        VARCHAR2(256),
  zzh        VARCHAR2(256),
  fzzh       VARCHAR2(256),
  cydw       VARCHAR2(4000),
  ppjl       VARCHAR2(4000),
  zyzb       VARCHAR2(4000),
  jtap       VARCHAR2(4000),
  createtime DATE default sysdate,
  createuser VARCHAR2(256) default 'admin',
  isdel      CHAR(1) default 0,
  qydm       CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_HDAB_INFO
  is '�����';

prompt
prompt Creating table T_HDAB_LOGS
prompt ==========================
prompt
create table KSH.T_HDAB_LOGS
(
  tid        VARCHAR2(32) default sys_guid(),
  pid        VARCHAR2(32),
  tilename   VARCHAR2(256) default '['||to_char(sysdate,'hh24:mi:ss')||']',
  times      DATE default sysdate,
  context    VARCHAR2(2000),
  type       VARCHAR2(256),
  createuser VARCHAR2(256),
  days       VARCHAR2(10) default to_char(sysdate,'yyyy-MM-dd')
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_HDAB_LOGS
  is '�������־��¼';

prompt
prompt Creating table T_KHS_FILES
prompt ==========================
prompt
create table KSH.T_KHS_FILES
(
  tid    VARCHAR2(32) default sys_guid(),
  userid VARCHAR2(32),
  data   VARCHAR2(2000),
  times  DATE default sysdate,
  isdel  CHAR(1) default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_KHS_FILES
  is '�����ϴ������ýӿڣ����淵��ֵ';
comment on column KSH.T_KHS_FILES.isdel
  is 'ɾ������ 1����ʾɾ��';

prompt
prompt Creating table T_KSH_CJCNO
prompt ==========================
prompt
create table KSH.T_KSH_CJCNO
(
  tid      VARCHAR2(32) default sys_guid(),
  jqno     VARCHAR2(32),
  cjdno    VARCHAR2(32),
  userid   VARCHAR2(32),
  username VARCHAR2(32),
  userdept VARCHAR2(32),
  ip       VARCHAR2(32),
  times    DATE default sysdate,
  sys      VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_KSH_CJCNO
  is '���������';
comment on column KSH.T_KSH_CJCNO.sys
  is 'ϵͳ����';

prompt
prompt Creating table T_KSH_DTZH
prompt =========================
prompt
create table KSH.T_KSH_DTZH
(
  tid  VARCHAR2(32) default sys_guid(),
  name VARCHAR2(50),
  code VARCHAR2(32),
  qydm CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_KSH_GZTPZXX
prompt ============================
prompt
create table KSH.T_KSH_GZTPZXX
(
  jqip      VARCHAR2(23) not null,
  gztzmc    VARCHAR2(16),
  ssdwdm    VARCHAR2(12) not null,
  ssdwmc    VARCHAR2(128),
  jjdh      VARCHAR2(15),
  gztgzsxms VARCHAR2(64),
  ctisxms   VARCHAR2(64),
  qydm      VARCHAR2(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_KSH_JQRL
prompt =========================
prompt
create table KSH.T_KSH_JQRL
(
  tid     VARCHAR2(32) default sys_guid(),
  sid     VARCHAR2(32),
  jqxz    VARCHAR2(200),
  jqlevel VARCHAR2(200),
  clzt    VARCHAR2(200),
  jqly    VARCHAR2(200),
  cxsj    VARCHAR2(2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_KSH_JQRL.tid
  is '����';
comment on column KSH.T_KSH_JQRL.sid
  is '�û�����';
comment on column KSH.T_KSH_JQRL.jqxz
  is '�������ʣ���,�Ÿ�����';
comment on column KSH.T_KSH_JQRL.jqlevel
  is '���鼶����,�Ÿ�����';
comment on column KSH.T_KSH_JQRL.clzt
  is '����״̬����,�Ÿ�����';
comment on column KSH.T_KSH_JQRL.jqly
  is '������Դ����,�Ÿ�����';
comment on column KSH.T_KSH_JQRL.cxsj
  is '��ѯʱ�䣬30,7,1';

prompt
prompt Creating table T_KSH_JWTINFO
prompt ============================
prompt
create table KSH.T_KSH_JWTINFO
(
  tid      VARCHAR2(32) default sys_guid() not null,
  jqno     VARCHAR2(32),
  userid   VARCHAR2(32),
  ip       VARCHAR2(19),
  type     VARCHAR2(12),
  fx       CHAR(1),
  msg      VARCHAR2(4000),
  times    DATE,
  username VARCHAR2(100),
  ext      VARCHAR2(32),
  filename VARCHAR2(200),
  filetype VARCHAR2(32),
  zzjgdm   VARCHAR2(32),
  zzjgmc   VARCHAR2(32),
  qydm     CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_KSH_JWTINFO.tid
  is '��ΨһID';
comment on column KSH.T_KSH_JWTINFO.jqno
  is '����ID';
comment on column KSH.T_KSH_JWTINFO.userid
  is '�û�ID';
comment on column KSH.T_KSH_JWTINFO.ip
  is 'IP��ַ';
comment on column KSH.T_KSH_JWTINFO.type
  is '���ͣ����֡���ͼ����ý�塢�������飩';
comment on column KSH.T_KSH_JWTINFO.fx
  is '0��ʾǰ̨��������������ͨ��1��ʾ����ͨ�ϴ�����';
comment on column KSH.T_KSH_JWTINFO.msg
  is '��������';
comment on column KSH.T_KSH_JWTINFO.times
  is '����ʱ��';
comment on column KSH.T_KSH_JWTINFO.username
  is '����������';
comment on column KSH.T_KSH_JWTINFO.ext
  is '�ļ����͵ĺ�׺��';
comment on column KSH.T_KSH_JWTINFO.filename
  is '�ļ���';
comment on column KSH.T_KSH_JWTINFO.filetype
  is '�ļ�����';
comment on column KSH.T_KSH_JWTINFO.zzjgdm
  is '��֯�ṹ����';
comment on column KSH.T_KSH_JWTINFO.zzjgmc
  is '��֯�ṹ����';
alter table KSH.T_KSH_JWTINFO
  add constraint PRIMARY_KEY_JWTINFO primary key (TID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_KSH_SSYJ
prompt =========================
prompt
create table KSH.T_KSH_SSYJ
(
  tid          VARCHAR2(32) default sys_guid(),
  sid          VARCHAR2(32),
  jqxz         VARCHAR2(200),
  jqlevel      VARCHAR2(200),
  clzt         VARCHAR2(200),
  jqly         VARCHAR2(200),
  dwjb         VARCHAR2(2),
  redyj        VARCHAR2(5),
  orangedownyj VARCHAR2(5),
  orangeupyj   VARCHAR2(5),
  yellowdownyj VARCHAR2(5),
  yellowupyj   VARCHAR2(5),
  greenyj      VARCHAR2(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_KSH_SSYJ.tid
  is '����';
comment on column KSH.T_KSH_SSYJ.sid
  is '�û�����';
comment on column KSH.T_KSH_SSYJ.jqxz
  is '�������ʣ���,�Ÿ�����';
comment on column KSH.T_KSH_SSYJ.jqlevel
  is '���鼶����,�Ÿ�����';
comment on column KSH.T_KSH_SSYJ.clzt
  is '����״̬����,�Ÿ�����';
comment on column KSH.T_KSH_SSYJ.jqly
  is '������Դ����,�Ÿ�����';
comment on column KSH.T_KSH_SSYJ.dwjb
  is '��λ����1 �־� 0 �ɳ�����';
comment on column KSH.T_KSH_SSYJ.redyj
  is '��ɫԤ����ֵ';
comment on column KSH.T_KSH_SSYJ.orangedownyj
  is '��ɫԤ����ֵ����';
comment on column KSH.T_KSH_SSYJ.orangeupyj
  is '��ɫԤ����ֵ����';
comment on column KSH.T_KSH_SSYJ.yellowdownyj
  is '��ɫԤ����ֵ����';
comment on column KSH.T_KSH_SSYJ.yellowupyj
  is '��ɫԤ����ֵ����';
comment on column KSH.T_KSH_SSYJ.greenyj
  is '��ɫԤ����ֵ';

prompt
prompt Creating table T_LAYER_JYZ
prompt ==========================
prompt
create table KSH.T_LAYER_JYZ
(
  tid        VARCHAR2(32) default sys_guid() not null,
  mc         VARCHAR2(128),
  dz         VARCHAR2(128),
  x          VARCHAR2(128),
  y          VARCHAR2(128),
  lx         VARCHAR2(20),
  lxdh       VARCHAR2(80),
  fzr        VARCHAR2(20),
  shape      VARCHAR2(40),
  createtime DATE default sysdate,
  isdel      CHAR(2) default 0,
  zzjgdm     VARCHAR2(32),
  zzjgmc     VARCHAR2(100),
  qydm       CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_LAYER_JYZ
  is 'POI����վ';
comment on column KSH.T_LAYER_JYZ.tid
  is '��ΨһID';
comment on column KSH.T_LAYER_JYZ.mc
  is '����վ����';
comment on column KSH.T_LAYER_JYZ.dz
  is '����վ��ַ';
comment on column KSH.T_LAYER_JYZ.x
  is '����';
comment on column KSH.T_LAYER_JYZ.y
  is 'γ��';
comment on column KSH.T_LAYER_JYZ.lx
  is '����';
comment on column KSH.T_LAYER_JYZ.lxdh
  is '��ϵ�绰';
comment on column KSH.T_LAYER_JYZ.fzr
  is '������';
comment on column KSH.T_LAYER_JYZ.shape
  is '���ȣ�γ��';
comment on column KSH.T_LAYER_JYZ.createtime
  is '����ʱ��';
comment on column KSH.T_LAYER_JYZ.isdel
  is 'ɾ����ʶ';
comment on column KSH.T_LAYER_JYZ.zzjgdm
  is '��֯�ṹ����';
comment on column KSH.T_LAYER_JYZ.zzjgmc
  is '��֯��������';
alter table KSH.T_LAYER_JYZ
  add constraint PRIMARY_KEY_JYZ primary key (TID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_LAYER_KK
prompt =========================
prompt
create table KSH.T_LAYER_KK
(
  tid        VARCHAR2(32) default sys_guid(),
  mc         VARCHAR2(128),
  dz         VARCHAR2(128),
  bh         VARCHAR2(128),
  x          VARCHAR2(128),
  y          VARCHAR2(128),
  lx         VARCHAR2(20),
  shape      VARCHAR2(40),
  createtime DATE default sysdate,
  isdel      CHAR(2) default 0,
  xl         VARCHAR2(20),
  zzjgdm     VARCHAR2(32),
  zzjgmc     VARCHAR2(100),
  qydm       CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_LAYER_KK
  is '����';

prompt
prompt Creating table T_LAYER_LD
prompt =========================
prompt
create table KSH.T_LAYER_LD
(
  tid        VARCHAR2(32) default sys_guid() not null,
  mc         VARCHAR2(128),
  dz         VARCHAR2(128),
  x          VARCHAR2(128),
  y          VARCHAR2(128),
  lxdh       VARCHAR2(80),
  fzr        VARCHAR2(20),
  shape      VARCHAR2(40),
  createtime DATE default sysdate,
  isdel      CHAR(2) default 0,
  zzjgdm     VARCHAR2(32),
  zzjgmc     VARCHAR2(100),
  qydm       CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 8M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_LAYER_LD.tid
  is 'id';
comment on column KSH.T_LAYER_LD.mc
  is '�õ�����';
comment on column KSH.T_LAYER_LD.dz
  is '�õ��ַ';
comment on column KSH.T_LAYER_LD.x
  is '����';
comment on column KSH.T_LAYER_LD.y
  is 'γ��';
comment on column KSH.T_LAYER_LD.lxdh
  is '��ϵ�绰';
comment on column KSH.T_LAYER_LD.fzr
  is '������';
comment on column KSH.T_LAYER_LD.shape
  is '����';
comment on column KSH.T_LAYER_LD.createtime
  is '����ʱ��';
comment on column KSH.T_LAYER_LD.isdel
  is 'ɾ����ʶ';
comment on column KSH.T_LAYER_LD.zzjgdm
  is '��֯��������';
comment on column KSH.T_LAYER_LD.zzjgmc
  is '��֯��������';

prompt
prompt Creating table T_LAYER_LDG
prompt ==========================
prompt
create table KSH.T_LAYER_LDG
(
  tid        VARCHAR2(32) default sys_guid() not null,
  mc         VARCHAR2(128),
  dz         VARCHAR2(128),
  x          VARCHAR2(128),
  y          VARCHAR2(128),
  lx         VARCHAR2(20),
  lxdh       VARCHAR2(80),
  fzr        VARCHAR2(80),
  zzjgdm     VARCHAR2(32),
  zzjgmc     VARCHAR2(100),
  shape      VARCHAR2(40),
  createtime DATE default sysdate,
  isdel      CHAR(2) default 0,
  qydm       CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_LAYER_LDG.tid
  is 'ID';
comment on column KSH.T_LAYER_LDG.mc
  is '·�Ƹ�����';
comment on column KSH.T_LAYER_LDG.dz
  is '·�Ƹ˵�ַ';
comment on column KSH.T_LAYER_LDG.x
  is '����';
comment on column KSH.T_LAYER_LDG.y
  is 'γ��';
comment on column KSH.T_LAYER_LDG.lx
  is '����';
comment on column KSH.T_LAYER_LDG.lxdh
  is '��ϵ�绰';
comment on column KSH.T_LAYER_LDG.fzr
  is '������';
comment on column KSH.T_LAYER_LDG.zzjgdm
  is '��֯��������';
comment on column KSH.T_LAYER_LDG.zzjgmc
  is '��֯��������';
comment on column KSH.T_LAYER_LDG.shape
  is '���ȣ�γ��';
comment on column KSH.T_LAYER_LDG.createtime
  is '����ʱ��';
comment on column KSH.T_LAYER_LDG.isdel
  is 'ɾ����ʶ';

prompt
prompt Creating table T_LAYER_POI
prompt ==========================
prompt
create table KSH.T_LAYER_POI
(
  tid        VARCHAR2(32) default sys_guid() not null,
  mc         VARCHAR2(128),
  dz         VARCHAR2(128),
  x          VARCHAR2(128),
  y          VARCHAR2(128),
  lxdh       VARCHAR2(120),
  sheng      VARCHAR2(20),
  shi        VARCHAR2(20),
  xian       VARCHAR2(20),
  type       VARCHAR2(20),
  type1      VARCHAR2(20),
  type2      VARCHAR2(300),
  shape      VARCHAR2(40),
  createtime DATE default sysdate,
  isdel      CHAR(2) default 0,
  zzjgdm     VARCHAR2(32),
  zzjgmc     VARCHAR2(100),
  qydm       CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 304M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_LAYER_POI.tid
  is 'id';
comment on column KSH.T_LAYER_POI.mc
  is '����';
comment on column KSH.T_LAYER_POI.dz
  is '��ַ';
comment on column KSH.T_LAYER_POI.x
  is '����';
comment on column KSH.T_LAYER_POI.y
  is 'γ��';
comment on column KSH.T_LAYER_POI.lxdh
  is '��ϵ�绰';
comment on column KSH.T_LAYER_POI.sheng
  is 'ʡ������';
comment on column KSH.T_LAYER_POI.shi
  is '�м�����';
comment on column KSH.T_LAYER_POI.xian
  is '��������';
comment on column KSH.T_LAYER_POI.type
  is 'һ������';
comment on column KSH.T_LAYER_POI.type1
  is '��������';
comment on column KSH.T_LAYER_POI.type2
  is '��������';
comment on column KSH.T_LAYER_POI.shape
  is '����';
comment on column KSH.T_LAYER_POI.createtime
  is '����ʱ��';
comment on column KSH.T_LAYER_POI.isdel
  is 'ɾ����ʶ';
comment on column KSH.T_LAYER_POI.zzjgdm
  is '��֯��������';
comment on column KSH.T_LAYER_POI.zzjgmc
  is '��֯��������';
create index KSH.INDX_T_LAYER_POI_MC on KSH.T_LAYER_POI (MC)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 44M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.INDX_T_LAYER_POI_X on KSH.T_LAYER_POI (X)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 38M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.INDX_T_LAYER_POI_Y on KSH.T_LAYER_POI (Y)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 36M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_LAYER_SP
prompt =========================
prompt
create table KSH.T_LAYER_SP
(
  tid        VARCHAR2(32) default sys_guid() not null,
  mc         VARCHAR2(128),
  dz         VARCHAR2(128),
  bh         VARCHAR2(128),
  x          VARCHAR2(128),
  y          VARCHAR2(128),
  lx         VARCHAR2(20),
  shape      VARCHAR2(40),
  createtime DATE default sysdate,
  isdel      CHAR(2) default 0,
  zzjgdm     VARCHAR2(32),
  zzjgmc     VARCHAR2(100),
  qydm       CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_LAYER_SP
  is 'POI��Ƶ';
comment on column KSH.T_LAYER_SP.tid
  is '��Ψһid';
comment on column KSH.T_LAYER_SP.mc
  is '��Ƶ����';
comment on column KSH.T_LAYER_SP.dz
  is '��Ƶ��ַ';
comment on column KSH.T_LAYER_SP.bh
  is '��Ƶ���';
comment on column KSH.T_LAYER_SP.x
  is '����';
comment on column KSH.T_LAYER_SP.y
  is 'γ��';
comment on column KSH.T_LAYER_SP.lx
  is '����';
comment on column KSH.T_LAYER_SP.shape
  is '���ȣ�γ��';
comment on column KSH.T_LAYER_SP.createtime
  is '����ʱ��';
comment on column KSH.T_LAYER_SP.isdel
  is 'ɾ����ʶ';
comment on column KSH.T_LAYER_SP.zzjgdm
  is '��֯��������';
comment on column KSH.T_LAYER_SP.zzjgmc
  is '��֯��������';
alter table KSH.T_LAYER_SP
  add constraint PRIMARY_KEY_SP primary key (TID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_LAYER_TEST
prompt ===========================
prompt
create table KSH.T_LAYER_TEST
(
  shape   VARCHAR2(100),
  name    VARCHAR2(100),
  address VARCHAR2(100),
  tips    VARCHAR2(100),
  xy      VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 832K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_LAYER_WB
prompt =========================
prompt
create table KSH.T_LAYER_WB
(
  tid        VARCHAR2(32) default sys_guid() not null,
  mc         VARCHAR2(128),
  dz         VARCHAR2(128),
  x          VARCHAR2(128),
  y          VARCHAR2(128),
  lx         VARCHAR2(20),
  lxdh       VARCHAR2(80),
  fzr        VARCHAR2(20),
  zzjgdm     VARCHAR2(32),
  zzjgmc     VARCHAR2(100),
  shape      VARCHAR2(40),
  createtime DATE default sysdate,
  isdel      CHAR(2) default 0,
  qydm       CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 640K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_LAYER_WB.tid
  is 'ID';
comment on column KSH.T_LAYER_WB.mc
  is '��������';
comment on column KSH.T_LAYER_WB.dz
  is '���ɵ�ַ';
comment on column KSH.T_LAYER_WB.x
  is '����';
comment on column KSH.T_LAYER_WB.y
  is 'γ��';
comment on column KSH.T_LAYER_WB.lx
  is '����';
comment on column KSH.T_LAYER_WB.lxdh
  is '��ϵ�绰';
comment on column KSH.T_LAYER_WB.fzr
  is '������';
comment on column KSH.T_LAYER_WB.zzjgdm
  is '��֯��������';
comment on column KSH.T_LAYER_WB.zzjgmc
  is '��֯��������';
comment on column KSH.T_LAYER_WB.shape
  is '���ȣ�γ��';
comment on column KSH.T_LAYER_WB.createtime
  is '����ʱ��';
comment on column KSH.T_LAYER_WB.isdel
  is 'ɾ����ʶ';

prompt
prompt Creating table T_LAYER_YY
prompt =========================
prompt
create table KSH.T_LAYER_YY
(
  tid        VARCHAR2(32) default sys_guid() not null,
  mc         VARCHAR2(128),
  dz         VARCHAR2(128),
  x          VARCHAR2(128),
  y          VARCHAR2(128),
  lx         VARCHAR2(20),
  lxdh       VARCHAR2(80),
  fzr        VARCHAR2(40),
  shape      VARCHAR2(40),
  createtime DATE default sysdate,
  isdel      CHAR(2) default 0,
  zzjgdm     VARCHAR2(32),
  zzjgmc     VARCHAR2(100),
  qydm       CHAR(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 6M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_LAYER_YY
  is 'POIҽԺ';
comment on column KSH.T_LAYER_YY.tid
  is '��Ψһid';
comment on column KSH.T_LAYER_YY.mc
  is 'ҽԺ����';
comment on column KSH.T_LAYER_YY.dz
  is 'ҽԺ��ַ';
comment on column KSH.T_LAYER_YY.x
  is '����';
comment on column KSH.T_LAYER_YY.y
  is 'γ��';
comment on column KSH.T_LAYER_YY.lx
  is '����';
comment on column KSH.T_LAYER_YY.lxdh
  is '��ϵ�绰';
comment on column KSH.T_LAYER_YY.fzr
  is '������';
comment on column KSH.T_LAYER_YY.shape
  is '���ȣ�γ��';
comment on column KSH.T_LAYER_YY.createtime
  is '����ʱ��';
comment on column KSH.T_LAYER_YY.isdel
  is 'ɾ����ʶ';
comment on column KSH.T_LAYER_YY.zzjgdm
  is '��֯��������';
comment on column KSH.T_LAYER_YY.zzjgmc
  is '��֯��������';
alter table KSH.T_LAYER_YY
  add constraint PRIMARY_KEY_YY primary key (TID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_QWGL_PBFA
prompt ==========================
prompt
create table KSH.T_QWGL_PBFA
(
  fabh      VARCHAR2(32) default sys_guid(),
  bcsl      VARCHAR2(32),
  bz        VARCHAR2(200),
  id        VARCHAR2(32) default sys_guid(),
  starttime VARCHAR2(32),
  endtime   VARCHAR2(32),
  bcmc      VARCHAR2(200),
  bcsx      VARCHAR2(32),
  famc      VARCHAR2(200),
  zzjgdm    VARCHAR2(32),
  isdel     NUMBER default 0,
  cjsj      DATE default sysdate,
  qydm      VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_QWGL_PBFA.fabh
  is '�������';
comment on column KSH.T_QWGL_PBFA.bcsl
  is '�������';
comment on column KSH.T_QWGL_PBFA.bz
  is '��ע';
comment on column KSH.T_QWGL_PBFA.id
  is '����';
comment on column KSH.T_QWGL_PBFA.starttime
  is '��ο�ʼʱ��';
comment on column KSH.T_QWGL_PBFA.endtime
  is '��ν���ʱ��';
comment on column KSH.T_QWGL_PBFA.bcmc
  is '�������';
comment on column KSH.T_QWGL_PBFA.bcsx
  is '���˳��';
comment on column KSH.T_QWGL_PBFA.famc
  is '��������';
comment on column KSH.T_QWGL_PBFA.zzjgdm
  is '��֯��������';
comment on column KSH.T_QWGL_PBFA.isdel
  is '�Ƿ�ɾ��  0Ϊ��ɾ��   1Ϊɾ��';

prompt
prompt Creating table T_QWGL_PBFAJGBD
prompt ==============================
prompt
create table KSH.T_QWGL_PBFAJGBD
(
  id     VARCHAR2(32) default sys_guid(),
  fabh   VARCHAR2(32),
  zzjgdm VARCHAR2(50),
  qydm   VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_QWGL_PBFAJGBD.id
  is 'id';
comment on column KSH.T_QWGL_PBFAJGBD.fabh
  is '�������';
comment on column KSH.T_QWGL_PBFAJGBD.zzjgdm
  is '��֯��������';

prompt
prompt Creating table T_QWGL_PBRYXX
prompt ============================
prompt
create table KSH.T_QWGL_PBRYXX
(
  id    VARCHAR2(50) default sys_guid(),
  pbid  VARCHAR2(50),
  jymc  VARCHAR2(50),
  jybh  VARCHAR2(50),
  sjhm  VARCHAR2(50),
  cjsj  DATE default sysdate,
  fzr   VARCHAR2(10),
  dxjs  VARCHAR2(10),
  zw    VARCHAR2(10),
  isdel VARCHAR2(1) default 0,
  qydm  VARCHAR2(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_QWGL_PBRYXX.id
  is '���';
comment on column KSH.T_QWGL_PBRYXX.pbid
  is '�Ű�ID';
comment on column KSH.T_QWGL_PBRYXX.jymc
  is '��Ա����';
comment on column KSH.T_QWGL_PBRYXX.jybh
  is '��Ա���';
comment on column KSH.T_QWGL_PBRYXX.sjhm
  is '�ֻ�����';
comment on column KSH.T_QWGL_PBRYXX.cjsj
  is '����ʱ��';
comment on column KSH.T_QWGL_PBRYXX.fzr
  is '������(0��,1��)';
comment on column KSH.T_QWGL_PBRYXX.dxjs
  is '�Ƿ���Ž���(0��,1��)';
comment on column KSH.T_QWGL_PBRYXX.zw
  is 'ְ��';
comment on column KSH.T_QWGL_PBRYXX.isdel
  is '�߼�ɾ����ʶ';
create index KSH.INDX_T_QWGL_PBRYXX_PBID on KSH.T_QWGL_PBRYXX (PBID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_QWGL_PBSBXX
prompt ============================
prompt
create table KSH.T_QWGL_PBSBXX
(
  id     VARCHAR2(50) default sys_guid(),
  pbbh   VARCHAR2(50),
  rwkssj DATE,
  rwjssj DATE,
  xlfs   VARCHAR2(10),
  xljb   VARCHAR2(10),
  yhxm   VARCHAR2(50),
  jybh   VARCHAR2(50),
  sjhm   VARCHAR2(50),
  sbbh   VARCHAR2(50),
  sblx   VARCHAR2(10),
  cjsj   DATE default sysdate,
  cjyh   VARCHAR2(50),
  cjyhzj VARCHAR2(50),
  ssdwdm VARCHAR2(50),
  pbdwdm VARCHAR2(50),
  pbid   VARCHAR2(50),
  sbid   VARCHAR2(50),
  said   VARCHAR2(20),
  isdel  VARCHAR2(1) default 0,
  qydm   VARCHAR2(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 61M
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_QWGL_PBSBXX.id
  is '����ID';
comment on column KSH.T_QWGL_PBSBXX.pbbh
  is '�Ű���';
comment on column KSH.T_QWGL_PBSBXX.rwkssj
  is '����ʼʱ��';
comment on column KSH.T_QWGL_PBSBXX.rwjssj
  is '�������ʱ��';
comment on column KSH.T_QWGL_PBSBXX.xlfs
  is 'Ѳ�߷�ʽ(0ͽ��1Ħ��2����)';
comment on column KSH.T_QWGL_PBSBXX.xljb
  is 'Ѳ�߼���(1һ��2����3����)';
comment on column KSH.T_QWGL_PBSBXX.yhxm
  is '�û�����';
comment on column KSH.T_QWGL_PBSBXX.jybh
  is '��Ա���';
comment on column KSH.T_QWGL_PBSBXX.sjhm
  is '�ֻ�����';
comment on column KSH.T_QWGL_PBSBXX.sbbh
  is '�豸���';
comment on column KSH.T_QWGL_PBSBXX.sblx
  is '�豸����(0����ͨ. �Խ���)';
comment on column KSH.T_QWGL_PBSBXX.cjsj
  is '����ʱ��';
comment on column KSH.T_QWGL_PBSBXX.cjyh
  is '�����û�';
comment on column KSH.T_QWGL_PBSBXX.cjyhzj
  is '�����û�����';
comment on column KSH.T_QWGL_PBSBXX.ssdwdm
  is '������λ����';
comment on column KSH.T_QWGL_PBSBXX.pbdwdm
  is '�Ű൥λ����';
comment on column KSH.T_QWGL_PBSBXX.pbid
  is '�Ű�id';
comment on column KSH.T_QWGL_PBSBXX.sbid
  is '�豸id';
comment on column KSH.T_QWGL_PBSBXX.said
  is 'ϵͳ��������';
comment on column KSH.T_QWGL_PBSBXX.isdel
  is '�߼�ɾ����ʶ';
create index KSH.IDX_T_QWGL_PBSBXX_PBID on KSH.T_QWGL_PBSBXX (PBID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.IDX_T_QWGL_PBSBXX_RWJSSJ on KSH.T_QWGL_PBSBXX (RWJSSJ)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.IDX_T_QWGL_PBSBXX_RWKSSJ on KSH.T_QWGL_PBSBXX (RWKSSJ)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_QWGL_PBXX
prompt ==========================
prompt
create table KSH.T_QWGL_PBXX
(
  pbbh   VARCHAR2(50),
  bz     VARCHAR2(500),
  rwkssj DATE,
  rwjssj DATE,
  rwrq   DATE,
  xlfs   VARCHAR2(10),
  xljb   VARCHAR2(10),
  shzt   VARCHAR2(10),
  cjsj   DATE default sysdate,
  cjyh   VARCHAR2(50),
  cjyhzj VARCHAR2(50),
  rwid   VARCHAR2(50),
  ssdwdm VARCHAR2(50),
  pbdwdm VARCHAR2(50),
  said   VARCHAR2(20),
  isdel  VARCHAR2(1) default 0,
  jybh   VARCHAR2(32),
  jymc   VARCHAR2(32),
  fzr    VARCHAR2(10),
  dxjs   VARCHAR2(10),
  zw     VARCHAR2(50),
  xlsj   VARCHAR2(50),
  sjhm   VARCHAR2(32),
  shsm   VARCHAR2(500),
  xgsj   DATE default sysdate,
  shsj   DATE,
  shyh   VARCHAR2(50),
  shyhzj VARCHAR2(50),
  id     VARCHAR2(50) default sys_guid() not null,
  ssdwmc VARCHAR2(200),
  fabh   VARCHAR2(32),
  qydm   VARCHAR2(10),
  pbtype CHAR(1) default 0
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 320M
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_QWGL_PBXX.pbbh
  is '�Ű���';
comment on column KSH.T_QWGL_PBXX.bz
  is '��ע';
comment on column KSH.T_QWGL_PBXX.rwkssj
  is '����ʼʱ��';
comment on column KSH.T_QWGL_PBXX.rwjssj
  is '�������ʱ��';
comment on column KSH.T_QWGL_PBXX.rwrq
  is '��������';
comment on column KSH.T_QWGL_PBXX.xlfs
  is 'Ѳ�߷�ʽ(0ͽ��1Ħ��2����)';
comment on column KSH.T_QWGL_PBXX.xljb
  is 'Ѳ�߼���(1һ��2����3����)';
comment on column KSH.T_QWGL_PBXX.shzt
  is '���״̬';
comment on column KSH.T_QWGL_PBXX.cjsj
  is '����ʱ��';
comment on column KSH.T_QWGL_PBXX.cjyh
  is '�����û�';
comment on column KSH.T_QWGL_PBXX.cjyhzj
  is '�����û�����';
comment on column KSH.T_QWGL_PBXX.rwid
  is '����id';
comment on column KSH.T_QWGL_PBXX.ssdwdm
  is '������λ����';
comment on column KSH.T_QWGL_PBXX.pbdwdm
  is '�Ű൥λ����';
comment on column KSH.T_QWGL_PBXX.said
  is 'ϵͳ��������';
comment on column KSH.T_QWGL_PBXX.isdel
  is '�߼�ɾ����ʶ';
comment on column KSH.T_QWGL_PBXX.jybh
  is '��Ա���';
comment on column KSH.T_QWGL_PBXX.jymc
  is '��Ա����';
comment on column KSH.T_QWGL_PBXX.fzr
  is '������(0��,1��)';
comment on column KSH.T_QWGL_PBXX.dxjs
  is '�Ƿ���Ž���(0��,1��)';
comment on column KSH.T_QWGL_PBXX.zw
  is 'ְ��';
comment on column KSH.T_QWGL_PBXX.xlsj
  is 'Ѳ��ʱ��';
comment on column KSH.T_QWGL_PBXX.sjhm
  is '�ֻ�����';
comment on column KSH.T_QWGL_PBXX.shsm
  is '���˵��';
comment on column KSH.T_QWGL_PBXX.xgsj
  is '�޸�ʱ��';
comment on column KSH.T_QWGL_PBXX.shsj
  is '���ʱ��';
comment on column KSH.T_QWGL_PBXX.shyh
  is '����û�';
comment on column KSH.T_QWGL_PBXX.shyhzj
  is '����û�����';
comment on column KSH.T_QWGL_PBXX.ssdwmc
  is '������λ����';
comment on column KSH.T_QWGL_PBXX.fabh
  is '�������';
comment on column KSH.T_QWGL_PBXX.pbtype
  is 'ֵ�����ͣ�0Ѳ���Ű�,1�쵼�Űࣩ';

prompt
prompt Creating table T_QWGL_PBXZXX
prompt ============================
prompt
create table KSH.T_QWGL_PBXZXX
(
  id     VARCHAR2(50) default sys_guid() not null,
  xzmc   VARCHAR2(100),
  cjsj   DATE,
  cjyhzj VARCHAR2(50),
  said   VARCHAR2(20),
  isdel  VARCHAR2(20),
  ssjgdm VARCHAR2(100),
  ssjgmc VARCHAR2(200),
  cjyh   VARCHAR2(50),
  qydm   VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 6M
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_QWGL_PBXZXX.id
  is '����ID';
comment on column KSH.T_QWGL_PBXZXX.xzmc
  is 'С������';
comment on column KSH.T_QWGL_PBXZXX.cjsj
  is '����ʱ��';
comment on column KSH.T_QWGL_PBXZXX.cjyhzj
  is '�����û�����';
comment on column KSH.T_QWGL_PBXZXX.said
  is 'ϵͳ��������';
comment on column KSH.T_QWGL_PBXZXX.isdel
  is '�߼�ɾ����ʶ';
comment on column KSH.T_QWGL_PBXZXX.ssjgdm
  is '������������';
comment on column KSH.T_QWGL_PBXZXX.ssjgmc
  is '������������';
comment on column KSH.T_QWGL_PBXZXX.cjyh
  is '�����û�';

prompt
prompt Creating table T_SYS_CD
prompt =======================
prompt
create table KSH.T_SYS_CD
(
  id    VARCHAR2(50) default sys_guid() not null,
  flzj  VARCHAR2(50),
  cdmc  VARCHAR2(50),
  cdms  VARCHAR2(255),
  cdlx  VARCHAR2(10),
  cjsj  DATE default sysdate,
  isdel VARCHAR2(20) default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_SYS_CD.id
  is '����ID';
comment on column KSH.T_SYS_CD.flzj
  is '��������';
comment on column KSH.T_SYS_CD.cdmc
  is '�˵�����';
comment on column KSH.T_SYS_CD.cdms
  is '�˵�����';
comment on column KSH.T_SYS_CD.cdlx
  is '�˵�����(0���˵�1�Ӳ˵�2��ݲ˵�)';
comment on column KSH.T_SYS_CD.cjsj
  is '����ʱ��';
comment on column KSH.T_SYS_CD.isdel
  is '�߼�ɾ����ʶ';

prompt
prompt Creating table T_SYS_CITYNAME
prompt =============================
prompt
create table KSH.T_SYS_CITYNAME
(
  key              VARCHAR2(8),
  value            VARCHAR2(202),
  serviceip        VARCHAR2(500),
  shape            VARCHAR2(50),
  proxoolname      VARCHAR2(50),
  jqservice        VARCHAR2(500),
  jq_authkey       VARCHAR2(50),
  jq_files         VARCHAR2(50),
  sms_service      VARCHAR2(150),
  pdt_sms_service  VARCHAR2(150),
  gps_proxoolname  VARCHAR2(50),
  schedule_service VARCHAR2(50),
  polygonlayername VARCHAR2(250),
  callphoneip      VARCHAR2(50),
  callphoneport    VARCHAR2(5),
  pdt_webservices  VARCHAR2(250)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_SYS_CITYNAME.key
  is '����';
comment on column KSH.T_SYS_CITYNAME.value
  is '����';
comment on column KSH.T_SYS_CITYNAME.serviceip
  is '�������ip';
comment on column KSH.T_SYS_CITYNAME.shape
  is '�������ĵ�';
comment on column KSH.T_SYS_CITYNAME.proxoolname
  is '���ݿ�����';
comment on column KSH.T_SYS_CITYNAME.jqservice
  is '110����ӿ�';
comment on column KSH.T_SYS_CITYNAME.jq_authkey
  is '��Ȩ��';
comment on column KSH.T_SYS_CITYNAME.jq_files
  is '�ļ�·��';
comment on column KSH.T_SYS_CITYNAME.sms_service
  is '���Žӿ�';
comment on column KSH.T_SYS_CITYNAME.pdt_sms_service
  is 'pdt���Žӿ�';
comment on column KSH.T_SYS_CITYNAME.gps_proxoolname
  is 'gps���ݿ�����';
comment on column KSH.T_SYS_CITYNAME.schedule_service
  is '��������ȡ�Ű���Ϣ�ӿ�';
comment on column KSH.T_SYS_CITYNAME.polygonlayername
  is 'Ͻ��ͼ����������';
comment on column KSH.T_SYS_CITYNAME.callphoneip
  is '����IP';
comment on column KSH.T_SYS_CITYNAME.callphoneport
  is '���ж˿�';
comment on column KSH.T_SYS_CITYNAME.pdt_webservices
  is 'PDTWebServices';

prompt
prompt Creating table T_SYS_JS
prompt =======================
prompt
create table KSH.T_SYS_JS
(
  id    VARCHAR2(50) not null,
  jsmc  VARCHAR2(50),
  jsms  VARCHAR2(500),
  cjsj  DATE default sysdate,
  isdel VARCHAR2(20) default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_SYS_JS.id
  is '����ID';
comment on column KSH.T_SYS_JS.jsmc
  is '��ɫ����';
comment on column KSH.T_SYS_JS.jsms
  is '��ɫ����';
comment on column KSH.T_SYS_JS.cjsj
  is '����ʱ��';
comment on column KSH.T_SYS_JS.isdel
  is '�߼�ɾ����ʶ';

prompt
prompt Creating table T_SYS_JSCDGX
prompt ===========================
prompt
create table KSH.T_SYS_JSCDGX
(
  id    VARCHAR2(50) default sys_guid() not null,
  jszj  VARCHAR2(50),
  cdzj  VARCHAR2(50),
  cjsj  DATE default sysdate,
  isdel VARCHAR2(20) default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 576K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_SYS_JSCDGX.id
  is '����ID';
comment on column KSH.T_SYS_JSCDGX.jszj
  is '��ɫ����';
comment on column KSH.T_SYS_JSCDGX.cdzj
  is '�˵�����';
comment on column KSH.T_SYS_JSCDGX.cjsj
  is '����ʱ��';
comment on column KSH.T_SYS_JSCDGX.isdel
  is '�߼�ɾ����ʶ';

prompt
prompt Creating table T_SYS_LOGS
prompt =========================
prompt
create table KSH.T_SYS_LOGS
(
  tid         VARCHAR2(32) default sys_guid() not null,
  appname     VARCHAR2(40),
  funs        VARCHAR2(32),
  name        VARCHAR2(258),
  msg         CLOB,
  userid      VARCHAR2(32),
  useraccount VARCHAR2(32),
  username    VARCHAR2(64),
  ip          VARCHAR2(32),
  type        VARCHAR2(32),
  createtime  DATE,
  zzjgdm      VARCHAR2(32),
  zzjgmc      VARCHAR2(100),
  sid         VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_POI
prompt ========================
prompt
create table KSH.T_SYS_POI
(
  poiid         VARCHAR2(20),
  city_name     VARCHAR2(128),
  code          VARCHAR2(128),
  telephone     VARCHAR2(128),
  title         VARCHAR2(128),
  classify      VARCHAR2(128),
  new_keytype   VARCHAR2(512),
  x             VARCHAR2(128),
  y             VARCHAR2(128),
  address       VARCHAR2(2000),
  navi_geometry VARCHAR2(128),
  name          VARCHAR2(2000),
  shape         VARCHAR2(2000),
  createtime    DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 560M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_SYS_POI
  is '��ʼ��POI����';
create index KSH.INDEX_S_SYS_POI_NAME on KSH.T_SYS_POI (NAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 80M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.INDX_S_SYS_POI_POIID on KSH.T_SYS_POI (POIID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 168M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_SESSIONKEY
prompt ===============================
prompt
create table KSH.T_SYS_SESSIONKEY
(
  tid       VARCHAR2(32) default sys_guid(),
  sessionid VARCHAR2(50),
  times     DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_SJZD
prompt =========================
prompt
create table KSH.T_SYS_SJZD
(
  tid   VARCHAR2(50) default sys_guid() not null,
  fid   VARCHAR2(50),
  mc    VARCHAR2(50),
  dyz   VARCHAR2(50),
  cjsj  DATE default sysdate,
  pz    VARCHAR2(500),
  isdel CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_SYS_SJZD.tid
  is '����ID';
comment on column KSH.T_SYS_SJZD.fid
  is '��������';
comment on column KSH.T_SYS_SJZD.mc
  is '����';
comment on column KSH.T_SYS_SJZD.dyz
  is '��Ӧֵ';
comment on column KSH.T_SYS_SJZD.cjsj
  is '����ʱ��';
comment on column KSH.T_SYS_SJZD.pz
  is '����';
comment on column KSH.T_SYS_SJZD.isdel
  is 'ɾ����ʶ';

prompt
prompt Creating table T_SYS_YH
prompt =======================
prompt
create table KSH.T_SYS_YH
(
  id     VARCHAR2(50) default sys_guid() not null,
  yhzh   VARCHAR2(50),
  yhmm   VARCHAR2(50),
  yhxm   VARCHAR2(50),
  jybh   VARCHAR2(50),
  jylx   VARCHAR2(10),
  zw     VARCHAR2(10),
  yhxb   VARCHAR2(10),
  sjhm   VARCHAR2(50),
  cjsj   DATE default sysdate,
  isdel  VARCHAR2(20) default 0,
  zzjgdm VARCHAR2(50),
  zzjgmc VARCHAR2(100),
  qydm   CHAR(4),
  ywid   VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 4M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_SYS_YH.id
  is '��id';
comment on column KSH.T_SYS_YH.yhzh
  is '�û��˻�';
comment on column KSH.T_SYS_YH.yhmm
  is '�û�����';
comment on column KSH.T_SYS_YH.yhxm
  is '�û�����';
comment on column KSH.T_SYS_YH.jybh
  is '��Ա���';
comment on column KSH.T_SYS_YH.jylx
  is '��Ա����';
comment on column KSH.T_SYS_YH.zw
  is 'ְ��';
comment on column KSH.T_SYS_YH.yhxb
  is '�û��Ա�';
comment on column KSH.T_SYS_YH.sjhm
  is '�ֻ�����';
comment on column KSH.T_SYS_YH.cjsj
  is '����ʱ��';
comment on column KSH.T_SYS_YH.isdel
  is '�߼�ɾ����ʶ';
comment on column KSH.T_SYS_YH.zzjgdm
  is '��֯��������';
comment on column KSH.T_SYS_YH.zzjgmc
  is '��֯��������';
comment on column KSH.T_SYS_YH.ywid
  is '����ҵ��id';

prompt
prompt Creating table T_SYS_YHDLJGGX
prompt =============================
prompt
create table KSH.T_SYS_YHDLJGGX
(
  id       VARCHAR2(32) default sys_guid(),
  yhzj     VARCHAR2(32),
  dljgzj   VARCHAR2(32),
  dljgname VARCHAR2(100),
  cjsj     DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_SYS_YHJSGX
prompt ===========================
prompt
create table KSH.T_SYS_YHJSGX
(
  id    VARCHAR2(50) default sys_guid(),
  yhzj  VARCHAR2(50),
  jszj  VARCHAR2(50),
  cjsj  DATE default sysdate,
  isdel VARCHAR2(20) default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_SYS_YHJSGX.id
  is '����ID';
comment on column KSH.T_SYS_YHJSGX.yhzj
  is '�û�����';
comment on column KSH.T_SYS_YHJSGX.jszj
  is '��ɫ����';
comment on column KSH.T_SYS_YHJSGX.cjsj
  is '����ʱ��';
comment on column KSH.T_SYS_YHJSGX.isdel
  is '�߼�ɾ����ʶ';

prompt
prompt Creating table T_USER_DISPATCH
prompt ==============================
prompt
create table KSH.T_USER_DISPATCH
(
  tid    VARCHAR2(32),
  userid VARCHAR2(32),
  jqno   VARCHAR2(32),
  ip     VARCHAR2(32),
  times  DATE,
  qydm   VARCHAR2(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_USER_DISPATCH
  is '���ȹ��ľ���';
create index KSH.INDX_T_USER_DISPATCH on KSH.T_USER_DISPATCH (JQNO)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  )
  compress;
create index KSH.INDX_T_USER_IP on KSH.T_USER_DISPATCH (IP)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_USER_JQCASE
prompt ============================
prompt
create table KSH.T_USER_JQCASE
(
  tid        VARCHAR2(32) default sys_guid(),
  loginid    VARCHAR2(32),
  jqno       VARCHAR2(32),
  createtime DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.INDX_T_USER_JQCASE_JQNO on KSH.T_USER_JQCASE (JQNO)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_USER_ZDY
prompt =========================
prompt
create table KSH.T_USER_ZDY
(
  id     VARCHAR2(32) default sys_guid(),
  userid VARCHAR2(32),
  key    VARCHAR2(68),
  value  VARCHAR2(256),
  times  DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_USER_ZDY
  is '�û��Զ�������';

prompt
prompt Creating table T_VIDEO_XML
prompt ==========================
prompt
create table KSH.T_VIDEO_XML
(
  manufacturertype VARCHAR2(256),
  devicetypecode   VARCHAR2(256),
  cameraname       VARCHAR2(256),
  cascade          VARCHAR2(256),
  cameraid         VARCHAR2(256),
  cameraindexcode  VARCHAR2(256),
  deviceid         VARCHAR2(256),
  unitid           VARCHAR2(256),
  regionid         VARCHAR2(256),
  xml              VARCHAR2(4000),
  qydm             VARCHAR2(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_VIDEO_XML.qydm
  is '�������';

prompt
prompt Creating table T_XCKC_MAIN
prompt ==========================
prompt
create table KSH.T_XCKC_MAIN
(
  id         VARCHAR2(32) default sys_guid(),
  dz         VARCHAR2(128),
  bh         VARCHAR2(50),
  lrr        VARCHAR2(32),
  ms         VARCHAR2(4000),
  createtime DATE default sysdate,
  jqno       VARCHAR2(32),
  type       VARCHAR2(32),
  typeid     VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_XCKC_MAIN.id
  is 'ID';
comment on column KSH.T_XCKC_MAIN.dz
  is '��ַ';
comment on column KSH.T_XCKC_MAIN.bh
  is '���';
comment on column KSH.T_XCKC_MAIN.lrr
  is '¼����';
comment on column KSH.T_XCKC_MAIN.ms
  is '����';
comment on column KSH.T_XCKC_MAIN.createtime
  is '����ʱ��';
comment on column KSH.T_XCKC_MAIN.jqno
  is '������';
comment on column KSH.T_XCKC_MAIN.type
  is '���ͣ����ҵ��ԡ��뻧���Եȣ�';
comment on column KSH.T_XCKC_MAIN.typeid
  is '����ID';

prompt
prompt Creating table T_XCKC_PERMISSION
prompt ================================
prompt
create table KSH.T_XCKC_PERMISSION
(
  id         VARCHAR2(50) default sys_guid() not null,
  name       VARCHAR2(50),
  desc_      VARCHAR2(50),
  url        VARCHAR2(255),
  pid        VARCHAR2(50),
  createtime DATE default sysdate,
  isdel      VARCHAR2(20) default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_XCKC_PROPERTY
prompt ==============================
prompt
create table KSH.T_XCKC_PROPERTY
(
  id         VARCHAR2(32) default sys_guid(),
  name       VARCHAR2(100),
  pid        VARCHAR2(32),
  point      VARCHAR2(10),
  type       VARCHAR2(10) default '0',
  dwdm       VARCHAR2(50),
  createtime DATE default sysdate,
  updatetime DATE default sysdate,
  isdel      CHAR(2) default 0,
  sort       VARCHAR2(10),
  propertyid VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_XCKC_PROPERTY.id
  is '����ID';
comment on column KSH.T_XCKC_PROPERTY.name
  is '����';
comment on column KSH.T_XCKC_PROPERTY.pid
  is '��������ID';
comment on column KSH.T_XCKC_PROPERTY.point
  is '�ڵ����ͣ�0�������磬1���ƣ�ʱ��Σ�2��ǩ�����ң�';
comment on column KSH.T_XCKC_PROPERTY.type
  is '��ѡ�����ͣ�0Ĭ�϶�ѡ��1��ѡ��';
comment on column KSH.T_XCKC_PROPERTY.dwdm
  is '��λ����';
comment on column KSH.T_XCKC_PROPERTY.createtime
  is '����ʱ��';
comment on column KSH.T_XCKC_PROPERTY.updatetime
  is '����ʱ��';
comment on column KSH.T_XCKC_PROPERTY.isdel
  is 'ɾ����־��0δɾ����1��ɾ����';
comment on column KSH.T_XCKC_PROPERTY.sort
  is '������';
comment on column KSH.T_XCKC_PROPERTY.propertyid
  is '����ID';

prompt
prompt Creating table T_XCKC_ROLE
prompt ==========================
prompt
create table KSH.T_XCKC_ROLE
(
  id         VARCHAR2(50) not null,
  name       VARCHAR2(50),
  desc_      VARCHAR2(500),
  createtime DATE default sysdate,
  isdel      VARCHAR2(20) default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_XCKC_ROLE_PERMISSION
prompt =====================================
prompt
create table KSH.T_XCKC_ROLE_PERMISSION
(
  id           VARCHAR2(50) default sys_guid() not null,
  roleid       VARCHAR2(50),
  permissionid VARCHAR2(50),
  createtime   DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_XCKC_USER
prompt ==========================
prompt
create table KSH.T_XCKC_USER
(
  id         VARCHAR2(50) default sys_guid() not null,
  name       VARCHAR2(50),
  password   VARCHAR2(50),
  realname   VARCHAR2(50),
  policenum  VARCHAR2(50),
  policetype VARCHAR2(10),
  sex        VARCHAR2(10),
  phone      VARCHAR2(50),
  createtime DATE default sysdate,
  isdel      VARCHAR2(20) default 0,
  zzjgdm     VARCHAR2(50),
  zzjgmc     VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_XCKC_USER_ROLE
prompt ===============================
prompt
create table KSH.T_XCKC_USER_ROLE
(
  id         VARCHAR2(50) default sys_guid(),
  userid     VARCHAR2(50),
  roleid     VARCHAR2(50),
  createtime DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_XCKC_VICE
prompt ==========================
prompt
create table KSH.T_XCKC_VICE
(
  id      VARCHAR2(32) default sys_guid(),
  pid     VARCHAR2(32),
  key     VARCHAR2(50),
  value   VARCHAR2(50),
  keyid   VARCHAR2(50),
  valueid VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_XCKC_VICE.id
  is 'ID';
comment on column KSH.T_XCKC_VICE.pid
  is '��ID';
comment on column KSH.T_XCKC_VICE.key
  is '��';
comment on column KSH.T_XCKC_VICE.value
  is 'ֵ';
comment on column KSH.T_XCKC_VICE.keyid
  is '��ID';
comment on column KSH.T_XCKC_VICE.valueid
  is 'ֵID';

prompt
prompt Creating table T_YA_CASEPLAN_INFO
prompt =================================
prompt
create table KSH.T_YA_CASEPLAN_INFO
(
  sid        VARCHAR2(32) default sys_guid(),
  tid        VARCHAR2(32),
  jqno       VARCHAR2(32),
  createuser VARCHAR2(32),
  createtime DATE default sysdate,
  qydm       VARCHAR2(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KSH.T_YA_CASEPLAN_INFO
  is '��������';
comment on column KSH.T_YA_CASEPLAN_INFO.sid
  is '����';
comment on column KSH.T_YA_CASEPLAN_INFO.tid
  is '����Ԥ��id';
comment on column KSH.T_YA_CASEPLAN_INFO.jqno
  is '������';
comment on column KSH.T_YA_CASEPLAN_INFO.createuser
  is '�����û�';
comment on column KSH.T_YA_CASEPLAN_INFO.createtime
  is '����ʱ��';
comment on column KSH.T_YA_CASEPLAN_INFO.qydm
  is '�������';

prompt
prompt Creating table T_YA_INFO
prompt ========================
prompt
create table KSH.T_YA_INFO
(
  tid   VARCHAR2(32) default sys_guid(),
  yamc  VARCHAR2(100),
  yajb  VARCHAR2(6),
  cjr   VARCHAR2(20),
  cjsj  DATE default sysdate,
  jqyd  VARCHAR2(4000),
  jqcl  VARCHAR2(4000),
  jqbz  VARCHAR2(4000),
  clyd  VARCHAR2(4000),
  isdel CHAR(1) default 0,
  qydm  VARCHAR2(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column KSH.T_YA_INFO.qydm
  is '�������';

prompt
prompt Creating table T_ZZJG_GD
prompt ========================
prompt
create table KSH.T_ZZJG_GD
(
  id            VARCHAR2(64) not null,
  name          VARCHAR2(200),
  fullname      VARCHAR2(200),
  shortname     VARCHAR2(200),
  parentid      VARCHAR2(64),
  type          VARCHAR2(5),
  treelevel     VARCHAR2(5),
  treelevel1    VARCHAR2(64),
  treelevel2    VARCHAR2(64),
  treelevel3    VARCHAR2(64),
  treelevel4    VARCHAR2(64),
  treelevel5    VARCHAR2(64),
  address       VARCHAR2(200),
  location      VARCHAR2(64),
  createtime    DATE,
  updatetime    DATE,
  ifuse         CHAR(1),
  phone         VARCHAR2(64),
  contacts      VARCHAR2(20),
  contactsid    VARCHAR2(64),
  contactsjob   VARCHAR2(64),
  contactsphone VARCHAR2(64),
  callname      VARCHAR2(100),
  officecall    VARCHAR2(100),
  calltype      VARCHAR2(100),
  totalpolice   VARCHAR2(20),
  mjcount       VARCHAR2(20),
  wjcount       VARCHAR2(20),
  fjcount       VARCHAR2(20),
  postcode      VARCHAR2(20),
  officegroup   VARCHAR2(100),
  code          VARCHAR2(50),
  description   VARCHAR2(50),
  dtcode        VARCHAR2(50),
  phone3        VARCHAR2(64),
  phone2        VARCHAR2(64)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 4M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_ZZJG_SIMPLE_GD
prompt ===============================
prompt
create table KSH.T_ZZJG_SIMPLE_GD
(
  fullname  VARCHAR2(200),
  stationid VARCHAR2(64) not null,
  type      VARCHAR2(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table V_GZTPZXX
prompt ========================
prompt
create table KSH.V_GZTPZXX
(
  jqip      VARCHAR2(23) not null,
  xzqh      VARCHAR2(8),
  jqmc      VARCHAR2(32) not null,
  gzth      NUMBER(3) not null,
  zhzxbh    VARCHAR2(6) not null,
  dlzhzxbh  VARCHAR2(6) not null,
  gztmc     VARCHAR2(16),
  gztzbh    VARCHAR2(12) not null,
  gztzmc    VARCHAR2(16),
  gztgzsxdm VARCHAR2(2),
  gztgzsxms VARCHAR2(64),
  gztsslb   VARCHAR2(2),
  gztsslbms VARCHAR2(64),
  ssdwdm    VARCHAR2(12) not null,
  ssdwmc    VARCHAR2(128),
  dldwdm    VARCHAR2(512) not null,
  dldwmc    VARCHAR2(512),
  jjdh      VARCHAR2(15),
  cjdh      VARCHAR2(15),
  fydh      VARCHAR2(15),
  xndh      VARCHAR2(15),
  ctisxdm   VARCHAR2(2),
  ctisxms   VARCHAR2(64),
  jcjbbh    VARCHAR2(64),
  zcm       VARCHAR2(2048),
  pxdm      NUMBER(10),
  sjbb      NUMBER(10),
  sybz      CHAR(1),
  cjr       VARCHAR2(50),
  cjsj      DATE not null,
  gxr       VARCHAR2(50),
  gxsj      DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table V_JQXZ
prompt =====================
prompt
create table KSH.V_JQXZ
(
  jqxzbh    VARCHAR2(12) not null,
  jqxzjc    VARCHAR2(128),
  jqxzjcpym VARCHAR2(128),
  jqxzqc    VARCHAR2(128),
  bzjqxzfbh VARCHAR2(12),
  bzjqxzbh  VARCHAR2(12),
  bzjqxzmc  VARCHAR2(128),
  yhsybz110 CHAR(1),
  yhsybz122 CHAR(1),
  yhsybz120 CHAR(1),
  yhsybz119 CHAR(1),
  qtyhsybz  CHAR(1),
  jqxzyaurl VARCHAR2(256),
  jjqxzdm   VARCHAR2(12),
  jjqxzmc   VARCHAR2(128),
  sjlydm    VARCHAR2(2),
  sjlyms    VARCHAR2(64),
  pxdm      NUMBER(8),
  sjbb      NUMBER(8),
  sybz      CHAR(1),
  cjr       VARCHAR2(50),
  cjsj      DATE not null,
  gxr       VARCHAR2(50),
  gxsj      DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table V_KSH_JQCASE
prompt ===========================
prompt
create table KSH.V_KSH_JQCASE
(
  jqno       CHAR(25) not null,
  bzjqno     CHAR(25) not null,
  jqtime     DATE not null,
  bzdwcode   VARCHAR2(12),
  bzdwname   VARCHAR2(128),
  bzjqxzdm   VARCHAR2(12),
  bzjqxzname VARCHAR2(128),
  bjtype     VARCHAR2(64),
  jqlevel    VARCHAR2(64),
  jqperiod   VARCHAR2(64),
  bjtel      VARCHAR2(15),
  bjteluser  VARCHAR2(100),
  dutyman    VARCHAR2(50),
  jjygh      VARCHAR2(20),
  afaddr     VARCHAR2(200),
  jqnr       VARCHAR2(4000),
  jqnr1      VARCHAR2(4000),
  cjqk       VARCHAR2(4000),
  cjqk1      VARCHAR2(4000),
  jjlyh      VARCHAR2(32),
  czjg       CHAR(10),
  x          VARCHAR2(25),
  y          VARCHAR2(25),
  sjgxsj     DATE not null,
  nbgxdwmc   VARCHAR2(128),
  days       VARCHAR2(10) default to_char(sysdate,'yyyy-MM-dd'),
  qydm       VARCHAR2(4),
  rksj       DATE default sysdate,
  jjtip      VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 144M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.IDX_V_KSH_JQCASE_BZJQXZDM on KSH.V_KSH_JQCASE (BZJQXZDM)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 10M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.IDX_V_KSH_JQCASE_JQNO on KSH.V_KSH_JQCASE (JQNO)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 22M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.IDX_V_KSH_JQCASE_JQTIME on KSH.V_KSH_JQCASE (JQTIME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 11M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.IDX_V_KSH_JQCASE_QYDM on KSH.V_KSH_JQCASE (QYDM)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 7M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KSH.IDX_V_KSH_JQCASE__BZDWCODE on KSH.V_KSH_JQCASE (BZDWCODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 12M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table V_RYXX
prompt =====================
prompt
create table KSH.V_RYXX
(
  rybh   VARCHAR2(32) not null,
  ryxm   VARCHAR2(50),
  ryjh   VARCHAR2(12),
  sfzbh  VARCHAR2(18),
  ryxb   VARCHAR2(2),
  xbms   VARCHAR2(64),
  csny   DATE,
  ryzt   VARCHAR2(2),
  ryztms VARCHAR2(64),
  ryzw   VARCHAR2(2),
  zwms   VARCHAR2(64),
  xzqh   VARCHAR2(6),
  zhzxbh VARCHAR2(32),
  ssdwdm VARCHAR2(12),
  ssdwmc VARCHAR2(128),
  jwthm  VARCHAR2(11),
  dhhm   VARCHAR2(256),
  dthm   VARCHAR2(256),
  yjdz   VARCHAR2(256),
  ryzz   VARCHAR2(256),
  pxdm   NUMBER(8),
  sjbb   NUMBER(8),
  sybz   CHAR(1),
  cjr    VARCHAR2(50),
  cjsj   DATE not null,
  gxr    VARCHAR2(50),
  gxsj   DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 832K
    next 1M
    minextents 1
    maxextents unlimited
  );

