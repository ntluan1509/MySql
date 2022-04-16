create database PS24336_Lab7_qlbh;
use PS24336_Lab7_qlbh;
/*Bài 1: */

create table KhachHang
(
	maKhachHang varchar(15) primary key,
    hoVaTenLot varchar(30),
    Ten	varchar(10),
    DiaChi varchar(50),
    Email varchar(50),
    DienThoai varchar(15)    
);
create table SanPham
(
	maSanPham varchar(15) primary key,
    moTa varchar(300),
    soLuong int,
    donGia int,
    tenSP varchar(30)
);
create table HoaDon
(
	maHoaDon varchar(15) primary key,
    ngayMuaHang date,
    trangThai varchar(50),
    maKhachHang varchar(15) references KhachHang(maKhachHang)
);
create table HoaDonChiTiet
(
	maHoaDonChiTiet int primary key,
    soLuong int,
    maSanPham varchar(15) references SanPham(maSanPham),
    maHoaDon varchar(15) references hoadon(maHoaDon)
);
    
insert into khachhang values('KH001','Nguyễn Thị','Nga',' 15 Quang Trung TP Đà Nẵng','ngant@gamil.com','0912345670');
insert into khachhang values('KH002','Trần Công','Trần Công','234 Lê Lợi Quảng Nam','thanhtc@gmail.com','16109423443');
insert into khachhang values('KH003','Lê Hoàng','Nam','23 Trần Phú TP Huế','namlt@yahoo.com ','0989354556');
insert into khachhang values('KH004','Vũ Ngọc ','Hiền','37 Nguyễn Thị Thập TP Đà Nẵng','hienvn@gmail.com','0894545435');
insert into khachhang values('KH005','','','','','');

insert into sanpham values(1,'Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp với những người yêu thích một sản phẩm pin tốt thích hệ điều hành mới cùng những tính năng đi kèm độc quyền',800,6600000,'Samsung Galaxy J7 Pro');
insert into sanpham values(2,'iPhone 6 là một trong những smartphone được yêu thích nhất. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot"',500,8990000,'iPhone 6 32GB');
insert into sanpham values(3,'Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)',507,11290000,'Laptop Dell Inspiron 3467');
insert into sanpham values(4,'Pin sạc dự phòng Polymer 5.000 mAh eSaver JP85',600,200000,'Pin sạc dự phòng');
insert into sanpham values(5,'Nokia 3100 phù hợp với SINH VIÊN', 100,700000,'Nokia 3100');	

insert into hoadon values(120954,'2016-03-23','Đã thanh toán','KH001');
insert into hoadon values(120955,'2016-04-02','Đã thanh toán','KH002');
insert into hoadon values(120956,'2016-07-12','chưa thanh toán','KH001');
insert into hoadon values(120957,'2016-12-04','chưa thanh toán','KH004');

insert into hoadonchitiet(maHoaDonChiTiet,soLuong,maSanPham,maHoaDon) values(1,120954,3,40);
insert into hoadonchitiet(maHoaDonChiTiet,soLuong,maSanPham,maHoaDon) values(2,120954,1,20);
insert into hoadonchitiet(maHoaDonChiTiet,soLuong,maSanPham,maHoaDon) values(3,120955,2,100);
insert into hoadonchitiet(maHoaDonChiTiet,soLuong,maSanPham,maHoaDon) values(4,120956,4,6);
insert into hoadonchitiet(maHoaDonChiTiet,soLuong,maSanPham,maHoaDon) values(5,120956,2,60);
insert into hoadonchitiet(maHoaDonChiTiet,soLuong,maSanPham,maHoaDon) values(6,120956,1,10);
insert into hoadonchitiet(maHoaDonChiTiet,soLuong,maSanPham,maHoaDon) values(7,120957,2,50);
 
create table khachhang_dannang
select* from khachhang	where diachi like 'Đà Nẵng%';

/*Bài 2:*/
use PS24336_Lab7_qlbh;
/*a. Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH002’ có giá trị mới
là ‘16267788989’*/
SELECT*from khachhang;
update khachhang
set dienthoai = '16267788989'
where maKhachhang='KH002';
/*b. Tăng số lượng mặt hàng có mã ‘3’ lên thêm ‘200’ đơn vị*/
select*FROM sanpham;
update sanpham
set soLuong = soLuong + 200
where maSanPham = '3';
/*c. Giảm giá cho tất cả sản phẩm giảm 5%*/
select*FROM sanpham;
update sanpham
set donGia = donGia * 0.95;

/*d. Tăng số lượng của mặt hàng bán chạy nhất trong tháng 12/2016 lên 100 đơn vị*/

update sanpham
set soLuong = soLuong + 100
where maSanPham in (select maSanPham, sum(soLuong) 
from hoadon hd
inner join hoadonchitiet hdct 
on hdct.maHoaDon = hd.maHoaDon
where month(ngayMuaHang)=12 and year(ngayMuaHang)=2017
group by maSanpPam
order by sum(soLuong) desc
limit 1);
/*e. Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2016*/

	update sanpham
	set soLuong = soLuong - soLuong *0.1
	where maSanPham in (select maSanPham, sum(soLuong) 
	from hoadon hd
	inner join hoadonchitiet hdct 
	on hdct.maHoaDon = hd.maHoaDon
	where month(ngayMuaHang)=12 and year(ngayMuaHang)=2017
	group by maSanPham
	order by sum(soLuong) asc);
/*f. Cập nhật lại trạng thái “đã thanh toán” cho hoá đơn có mã 120956*/
update hoadon 
set trangThai = 'Đã thanh toán'
where maHoadon  = '120956';

/*g. Xoá mặt hàng có mã sản phẩm là ‘2’ ra khỏi hoá đơn ‘120956’ và trạng thái là
chưa thanh toán.*/
delete from hoadonchitiet 
where maSanPham = '2'
and maHoaDon = '120956'  and trangThai = 'chưa thanh toán';
/*h. Xoá khách hàng chưa từng mua hàng kể từ ngày “1-1-2016”*/
delete from khachhang
where maKhachHang not in
(
	select maKhachHang from hoadon where year (ngayMuaHang) >= 2016
);




