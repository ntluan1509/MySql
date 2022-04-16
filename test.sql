alter table lamviec
add constraint fk_lamviec_duan
foreign key (mada) references duan(mada);
/* ràng buộc check*/


create table lamviec(
     mada int,
     manv char(4) not null,
     sogio int check(sogio>0),
     primary key ( mada, manv)
);
create table nhanvien(
      manv int auto_increment,
      hoten varchar(50) not null,
      ngaysinh date not null,
      gioitinh bool not null,
      sodienthoai varchar(2) not null,
	  maphong char(2) not null,
      foreign key (maphong) references  phong(maphong)
);

create table duan(
     mada int auto_increment,
     tenduan varchar(50) not null,
     dongia float(10,2) not null,
     maphong char(2) not null,
     primary key (mada)
);

create table phong (
       maphong char(2) primary key,
       tenphong varchar(50) not null
);
use quanly_duan;
create database quanly_duan;



