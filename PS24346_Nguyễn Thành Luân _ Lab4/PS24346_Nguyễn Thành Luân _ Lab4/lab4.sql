create database BĐS;
use BĐS;
/* Tạo bảng VANPHONG*/
create table VANPHONG(
	mavp int primary key,
    tenvp varchar(50) not null,
    Diachi varchar(50) not null
);
/*Tạo bảng CHUSOHUU*/
create table CHUSOHUU(
   maCSH int primary key,
   tenCSH varchar(50) not null,
   soDT varchar(15) not null
);
/*Tạo bảng BĐS*/
   create table BĐS (
   maBĐS int primary key,
   diachi varchar(50) not null,
   maCSH int references CHUSOHUU(maCSH),
   mavp int references VANPHONG(mavp)
);
/*Tạo bảng NHANVIEN*/
	create table NHANVIEN (
    maNV int  primary key,
    tenNV varchar(50) not null,
    diachi varchar(50) not null,
    SĐT varchar(15) ,
    mavp int references VANPHONG(mavp)
);
/*Tạo bảng THANNHAN*/
create table THANHAN (
	maTN int primary key,
    tenTN varchar(50) not null,
    ngaySinh date not null,
    MoiQH varchar(50),
    maNV int references NHANVIEN( maNV)
);

alter table CHUSOHUU
add mavp int;
/*Ràng buộc khóa chính khóa ngoại*/
alter table VANPHONG add constraint FK_VANPHONG_vanphong
      foreign key (mavp) references CHUSOHUU(mavp);
alter table VANPHONG add constraint FK_BĐS_vanphong1
      foreign key(mavp1) references BĐS(mavp);
alter table VANPHONG add constraint FK_BĐS_vanphong2
      foreign key(mavp2) references NHANVIEN(mavp);
alter table CHUSOHUU add constraint FK_CHUSOHUU_csh
	  foreign key(maCSH) references BĐS(maCSH);
alter table NHANVIEN add constraint FK_NHANVIEN_nv
	  foreign key(maNV) references THANNHAN(maNNV);
/*Ràng buộc check*/
alter table VANPHONG add constraint vanphong
	  check ( Diachi =" Ho chi minh");
alter table CHUSOHUU add constraint chusohuu
      check ( soDT between 0 and 9);
alter table NHANVIEN add constraint nhanvien
      check ( SĐT between 0 and 9);
alter table THANNHAN add constraint thannhan
      check ( ngaysinh < 2022-03-27);

 

