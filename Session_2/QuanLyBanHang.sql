CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE Customer(
	customes_id INT NOT NULL PRIMARY KEY,
    customes_name VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE Order1(
	order_id INT NOT NULL PRIMARY KEY,
    customes_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    order_totalPrice FLOAT NOT NULL,
    FOREIGN KEY (customes_id) REFERENCES Customer(customes_id)
);

CREATE TABLE Product(
	product_id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE Oderdeltail(
	product_id INT NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY (product_id,order_id),
    FOREIGN KEY (product_id)REFERENCES Product(product_id),
    FOREIGN KEY (order_id) REFERENCES Order1(order_id)
);
-- them cot odQTY vao table Oderdeltail
ALTER TABLE Oderdeltail ADD odQTY INT NOT NULL;

INSERT INTO Customer(customes_id,customes_name,age) VALUE (1,"Minh Quan", 20),
														  (2,"QUang Huy", 25),
														  (3,"Hong Anh", 21);

INSERT INTO Order1 (order_id,customes_id,order_date,order_totalPrice) VALUE (1,1,"2000-1-1",2.5);
INSERT INTO Order1 (order_id,customes_id,order_date,order_totalPrice) VALUE (2,2,"2010-5-1",5.5),
																			(3,3,"2020-5-9",4.5);
                                                                            
INSERT INTO Product (product_id,product_name,price) VALUE (1,"May Tinh",2.5000),	
														  (3,"TiVi",3.5000),
                                                          (2,"May Giac",1.0000);
                                                          
INSERT INTO Oderdeltail (product_id,order_id,odQTY)VALUES (1,1,3),
														(1,3,7),
                                                        (1,2,2);
                                                        
INSERT INTO Oderdeltail (product_id,order_id,odQTY)VALUES(2,1,1),
                                                        (3,1,8),
                                                        (2,3,4),
                                                        (3,3,9);
-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT *FROM   Order1;  

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT C.customes_name AS "Tên KH", P.product_name AS "Tên SP", Ol.odQTY AS "Số lượng"
FROM Customer C
-- sử dụng INNER JION để liên kết các bảng, ON điều kiện để liên kết
INNER JOIN Order1 O ON C.customes_id = O.customes_id
INNER JOIN Oderdeltail Ol ON O.order_id = Ol.order_id
INNER JOIN Product P ON P.product_id = Ol.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT C.customes_name AS "Tên KH"
-- FROM Customer C



                                                    