use quanly_banhang;
/* BÀI 1*/
/*Tạo chỉ mục cho cột dienthoai của bảng khachhang*/
show index from khachhang;
create unique index idx_sdt on khachhang(dienthoai);
/*Tạo chỉ mục cho cột email của bảng khachhang*/
show index from khachhang;
create unique index idx_email on khachhang(email);

/* BÀI 2*/
/*Tạo User*/
create user PS24346 identified by 'abcd';
grant select on quanly_banhang.* to PS24346;

/* BÀI LÀM THÊM */
/*Tạo user*/
create user 'testU'@'localhost' identified by '1234';

/*kiểm tra user đã tạo*/
use mysql;
show tables;
desc user; 
/*tạo kết nối với mysql */
/*gán quyền select cho các bản quản lý bán hàng*/
grant select on quanly_banhang.* to 'testU'@'localhost';
/*kiểm tra cấp quyền*/
show grants for 'testU'@'localhost';
/*xóa user*/
drop user 'testU'@'localhost';
