create database QuanLyBanHang;
use QuanLyBanHang; 
create table Customer (
cId int primary key auto_increment,
cName varchar(25),
cAge int
);
create table Oder (
oId int primary key auto_increment,
cId int not null,
oDate date,
oTotalPrice int,
foreign key(cId) references Customer(cId)
);
create table Product (
pId int primary key auto_increment,
pName varchar(25) not null,
pPrice int
);
create table OderDetail (
oId int not null,
pId int not null,
odQTY int,
foreign key(oId) references Oder(oId),
foreign key(pId) references Product(pId)
);
insert into Customer (cId, cName, cAge)
values (cId, "Minh Quan", 10),
(cId, "Ngoc Oanh", 20),
(cId, "Hong Ha", 50);

insert into Product (pId, pName, pPrice)
values (pId, "May Giat", 3),
(pId, "Tu Lanh", 5),
(pId, "Dieu Hoa", 7),
(pId, "Quat", 1),
(pId, "Bep Dien", 2);

insert into Oder (oId, cId, oDate)
values (oId, 1, "2006-03-21"),
(oId, 2, "2006-03-23"),
(oId, 1, "2006-03-16");

insert into OderDetail (oId, pId, odQTY)
values (1, 1, 3),
 (1, 3, 7),
 (1, 4, 2),
 (2, 1, 1),
 (3, 1, 8),
 (2, 5, 4),
 (2, 3, 3);
 
#Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oId, cId, oTotalPrice from Oder;
 
#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select Customer.cName, Product.pName 
from ((Oder join customer on Customer.cId = Oder.cId) join OderDetail 
on Oder.oId = OderDetail.oId) join Product on OderDetail.pId = Product.pId;
 
#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer left join oder on Customer.cId = Oder.cId 
where Oder.cId is null;

#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
select Oder.oId, Oder.oDate, sum(odQTY * pPrice) as "Total"
from ((Oder join customer on Customer.cId = Oder.cId) join OderDetail on Oder.oId = OderDetail.oId) join Product on OderDetail.pId = Product.pId
group by Oder.oId;