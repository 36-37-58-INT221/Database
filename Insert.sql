insert into Brand values(1,'Apple');
insert into Brand values(2,'Bander');
insert into Brand values(3,'Candy');
insert into Brand values(4,'Dobby');
insert into Brand values(5,'Eddy');


insert into Color values(1,'#E94F37');
insert into Color values(2,'#393E41');
insert into Color values(3,'#C70039');
insert into Color values(4,'#FFC300');
insert into Color values(5,'#FA8072');
insert into Color values(6,'#245BD3');

insert into Product values(1,'otter','First devices','6000.00','2019-01-11','otter.jpg',1);
insert into Product values(2,'agumon','Good system','12000.00','2020-06-25','agumon.jpg',1);
insert into Product values(3,'raccoon','Impressed everything','15000.00','2021-04-02','raccoon.jpg',1);
insert into Product values(4,'rabbit','New generation','12500.00','2020-09-25','rabbit.jpg',2); 
insert into Product values(5,'lizard','Very save battery','21000.00','2021-12-25','lizard.jpg',2);
insert into Product values(6,'frog','High speed','11000.00','2020-02-18','frog.jpg',3); 
insert into Product values(7,'cat','Nice system','10000.00','2018-07-23','cat.jpg',4); 
insert into Product values(8,'catwithdrug','Beautiful devices','16000.00','2019-01-01','catwithdrug.jpg',4);
insert into Product values(9,'hedgehog','begin journey','123213.00','2019-12-7','hedgehog.jpg',5);
insert into Product values(10,'mousewithwing','Soso','9999.00','2020-06-10','mousewithwing.jpg',5); 
insert into Product values(11,'pikachufat','Fantastic','14200.00','2021-04-03','pikachufat.jpg',5);


insert into HaveColor values(1,1);
insert into HaveColor values(1,2);
insert into HaveColor values(1,3);
insert into HaveColor values(2,5);
insert into HaveColor values(2,6);
insert into HaveColor values(3,2);
insert into HaveColor values(3,3);
insert into HaveColor values(3,4);
insert into HaveColor values(3,6);
insert into HaveColor values(4,2);
insert into HaveColor values(5,1);
insert into HaveColor values(5,5);
insert into HaveColor values(6,2);
insert into HaveColor values(6,3);
insert into HaveColor values(7,6);
insert into HaveColor values(8,2);
insert into HaveColor values(9,1);
insert into HaveColor values(9,2);
insert into HaveColor values(9,3);
insert into HaveColor values(9,4);
insert into HaveColor values(10,1);
insert into HaveColor values(10,5);
insert into HaveColor values(11,4);

ALTER TABLE `Color` ALTER `colorId` SET DEFAULT 0 ;
ALTER TABLE `Brand` ALTER `brandId` SET DEFAULT 0;
ALTER TABLE `Product` ALTER `productId` SET DEFAULT 0;

LOCK TABLES 
	 HaveColor write,
     Color write;	
ALTER TABLE HaveColor
	DROP FOREIGN KEY fk_HaveColor_Color1,
    MODIFY colorId int ;
ALTER TABLE `Color` MODIFY COLUMN `colorId` int auto_increment;
ALTER TABLE HaveColor
	ADD CONSTRAINT fk_HaveColor_Color1 FOREIGN KEY (colorId) REFERENCES Color (colorId);    
UNLOCK TABLES;

LOCK TABLES 
	 Havecolor write,
     Product write;	
ALTER TABLE HaveColor
	DROP FOREIGN KEY fk_HaveColor_Product1,
    MODIFY productId int ;
ALTER TABLE `Product` MODIFY COLUMN `productId` int auto_increment;
ALTER TABLE HaveColor
	ADD CONSTRAINT fk_HaveColor_Product1 FOREIGN KEY (productId) REFERENCES Product (productId);    
UNLOCK TABLES;

LOCK TABLES 
	 Brand write,
     Product write;	
ALTER TABLE Product
	DROP FOREIGN KEY fk_Product_Brand,
    MODIFY brandId int ;
ALTER TABLE `Brand` MODIFY COLUMN `brandId` int auto_increment;
ALTER TABLE Product
	ADD CONSTRAINT fk_Product_Brand FOREIGN KEY (brandId) REFERENCES Brand (brandId);    
UNLOCK TABLES;
