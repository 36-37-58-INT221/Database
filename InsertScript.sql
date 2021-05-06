insert into brand values(1,'Apple');
insert into brand values(2,'Bander');
insert into brand values(3,'Candy');
insert into brand values(4,'Dobby');
insert into brand values(5,'Eddy');


insert into color values(1,'#E94F37');
insert into color values(2,'#393E41');
insert into color values(3,'#C70039');
insert into color values(4,'#FFC300');
insert into color values(5,'#FA8072');
insert into color values(6,'#245BD3');

insert into product values(1,'otter','First devices','6000.00','2019-01-11','otterOtter-Plush-Toy-Super-Soft-Stuffed-Animal-Doll.jpg',1);
insert into product values(2,'agumon','Good system','12000.00','2020-06-25','agumonyhst-67464310884796_2676_124738616.jpg',1);
insert into product values(3,'raccoon','Impressed everything','15000.00','2021-04-02','raccoon1f93fd36e903edb83837c3f774de8dc1.jpg',1);

insert into product values(4,'rabbit','New generation','12500.00','2020-09-25','rabbit3d89fdb1078392b2fb8fe9a872f44990.jpg',2);
insert into product values(5,'lizard','Very save battery','21000.00','2021-12-25','lizards-l500.jpg',2);

insert into product values(6,'frog','High speed','11000.00','2020-02-18','frogd3850392a1bac86c08e304d07ab9a6fe_2048x.jpg',3);

insert into product values(7,'cat','Nice system','10000.00','2018-07-23','cat618hZ-zubEL._SL1100_.jpg',4);
insert into product values(8,'catwithdrug','Beautiful devices','16000.00','2019-01-01','catwithdrugb7859c72d88308913d8db7289c70b050.jpg',4);

insert into product values(9,'hedgehog','begin journey','123213.00','2019-12-7','hedgehogs-l500.jpg',5);
insert into product values(10,'mousewithwing','Soso','9999.00','2020-06-10','mousewithwing0dcd832001ab87a45d52895d53f615c6.jpg',5);
insert into product values(11,'pikachufat','Fantastic','14200.00','2021-04-03','pikachufat3dd32701d62c68e3fc9fd762eb2add50.jpg',5);


insert into haveColor values(1,1);
insert into haveColor values(1,2);
insert into haveColor values(1,3);
insert into haveColor values(2,5);
insert into haveColor values(2,6);
insert into haveColor values(3,2);
insert into haveColor values(3,3);
insert into haveColor values(3,4);
insert into haveColor values(3,6);
insert into haveColor values(4,2);
insert into haveColor values(5,1);
insert into haveColor values(5,5);
insert into haveColor values(6,2);
insert into haveColor values(6,3);
insert into haveColor values(7,6);
insert into haveColor values(8,2);
insert into haveColor values(9,1);
insert into haveColor values(9,2);
insert into haveColor values(9,3);
insert into haveColor values(9,4);
insert into haveColor values(10,1);
insert into haveColor values(10,5);
insert into haveColor values(11,4);

ALTER TABLE `color` ALTER `colorId` SET DEFAULT 0 ;
ALTER TABLE `brand` ALTER `brandId` SET DEFAULT 0;
ALTER TABLE `product` ALTER `productId` SET DEFAULT 0;

LOCK TABLES 
	 havecolor write,
     color write;	
ALTER TABLE havecolor
	DROP FOREIGN KEY fk_HaveColor_Color1,
    MODIFY colorId int ;
ALTER TABLE `color` MODIFY COLUMN `colorId` int auto_increment;
ALTER TABLE havecolor
	ADD CONSTRAINT fk_HaveColor_Color1 FOREIGN KEY (colorId) REFERENCES color (colorId);    
UNLOCK TABLES;

LOCK TABLES 
	 havecolor write,
     product write;	
ALTER TABLE havecolor
	DROP FOREIGN KEY fk_HaveColor_Product1,
    MODIFY productId int ;
ALTER TABLE `product` MODIFY COLUMN `productId` int auto_increment;
ALTER TABLE havecolor
	ADD CONSTRAINT fk_HaveColor_Product1 FOREIGN KEY (productId) REFERENCES product (productId);    
UNLOCK TABLES;

LOCK TABLES 
	 brand write,
     product write;	
ALTER TABLE product
	DROP FOREIGN KEY fk_Product_Brand,
    MODIFY brandId int ;
ALTER TABLE `brand` MODIFY COLUMN `brandId` int auto_increment;
ALTER TABLE product
	ADD CONSTRAINT fk_Product_Brand FOREIGN KEY (brandId) REFERENCES brand (brandId);    
UNLOCK TABLES;
