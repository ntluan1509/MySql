use quanly_cuahang;
/*1*/
select * from MatHang
order by donGia ;

/*2*/
select * from MatHang
where maLoai like 'TT%';

/*3*/
select maLoai ,tenLoai, count(maMH) as 'TongMatHang'
from LoaiHang, MatHang
where LoaiHang.maLoai = MatHang.maLoai
group by maLoai,tenLoai 
order by count(maMH) desc;

/*4*/
select phieuxuat.soPhieu, phieuxuat.ngayxh, cuahang.tenCH, mathang.maMH, mathang.tenMH, loaihang.tenLoai, ctphieuxuat.soLuong
from ctphieuxuat, mathang, phieuxuat, cuahang, loaihang
where ctphieuxuat.maMH = mathang.maMH and
	phieuxuat.maCH = cuahang.maCH and
	phieuxuat.soPhieu = ctphieuxuat.soPhieu and
    loaihang.maloai = mathang.maLoai;

/*5*/
select phieuxuat.ngayxh as 'Ngay xuat', cuahang.tenCH as 'Ten cua hang', sum(ctphieuxuat.soLuong * mathang.donGia) as 'Tong thanh tien'
from ctphieuxuat, mathang, phieuxuat, cuahang
where phieuxuat.ngayxh between '2020-12-31' and '2022-01-01'
and ctphieuxuat.maMH = mathang.maMH and
	phieuxuat.maCH = cuahang.maCH and
	phieuxuat.soPhieu = ctphieuxuat.soPhieu;
    
/*6*/
select C.maMH, tenMH, sum(B.soluong) as'so luong xuat'
from phieuxuat A,ctphieuxuat B, mathang C
where C.maMH = B.maMH and A.soPhieu = B.soLuong and ngayxh like'2021-10%'
group by C.maMH
order by sum(B.soLuong) desc
limit 5;

/*7*/
select tenCH , count(ngaylp) as'so ngay nhap hang', (ctphieuxuat.soLuong * mathang.donGia) as 'so tien thanh toan'
from cuahang, mathang, phieuxuat, ctphieuxuat
where ctphieuxuat.maMH = mathang.maMH and
	  phieuxuat.maCH = cuahang.maCH and
	  phieuxuat.soPhieu = ctphieuxuat.soPhieu and
      tenCH =  "Văn Thanh Fashion- Chi nhánh quận 3";

/*8*/
      
/*9*/
set SQL_SAFE_UPDATES = 0;
update phieuxuat set phieuxuat.ngayxh = '2022-04-10'
where phieuxuat.ngayxh is null;

/*10*/
set SQL_SAFE_UPDATES = 0;
update mathang set mathang.donGia = mathang.dongia*0.9
where mathang.maLoai = 'DPHS';

/*11*/
delete from phieuxuat
where ngayxh is null;

/*12*/
select MH.maMH, MH.tenMH, CTPX.soLuong
from mathang MH, ctphieuxuat CTPX
where MH.maMH = CTPX.maMH
order by soLuong limit 5;

/*13*/
select mathang.maMH, mathang.tenMH, loaihang.tenLoai
from mathang, loaihang
where loaihang.maLoai = mathang.maLoai
and mathang.maMH not in (select maMH from ctphieuxuat);

