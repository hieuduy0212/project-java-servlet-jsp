create database qlbh;
use qlbh;
-- tao table Category va khóa chính
create table Category(
	cid int not null,
    cname varchar(50),
    primary key(cid)
);
-- thêm 4 category
insert into Category values(1, 'Giày ADIDAS');
insert into Category values(2, 'Giày NIKE');
insert into Category values(3, 'Giày BITI\'S');
insert into Category values(4, 'Giày CONVERSE');

-- tạo table product
create table Product(
	id int not null,
    name varchar(100), 
    image varchar(1000),
    price double,
    title varchar(1000),
    description mediumtext,
    cateID int,
    primary key(id),
    foreign key(cateID) references Category(cid)
);
-- thêm sản phẩm
insert into Product values(1, 'Giày thể thao',
 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/giay-the-thao-nam-adidas-runfalcon-f36201-mau-xanh-dam-620a2b2e91474-14022022171302.jpg',
100.00, 'Giày thể thao nam Adidas Enerergy Falcon EE9844', 'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau'
,1 );

insert into Product values(2, 'Giày chạy bộ',
 'https://assets.adidas.com/images/w_600,f_auto,q_auto/c7d1c610decf4284b729aa610137d84a_9366/Giay_chay_bo_Nova_Run_DJen_EE9267.jpg',
120.00, 'Giày Adidas Nova Run EE9266'
,'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau'
, 2);

insert into Product values(3, 'Giày du lịch',
 'https://assets.adidas.com/images/w_600,f_auto,q_auto/533c4c4021724d9aa94bacaa0115f590_9366/Giay_Du_Lich_Terrex_Voyager_21_DJen_FZ2225_06_standard.jpg',130.00
, 'GIÀY DU LỊCH TERREX VOYAGER 21','ĐÔI GIÀY DU LỊCH ĐA NĂNG CHO CẢM GIÁC THOẢI MÁI KHI TRỜI NÓNG.'
, 1);

insert into Product values(4, 'Giày adidas 2A',
 'https://image.yes24.vn/Upload/ProductImage/thethaochinhang/2063162_L.jpg?width=550&height=550',140.00
, 'Giày thể thao nam Adidas Enerergy Falcon EE9844', 'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau'
,2 );
insert into Product values(5, 'Giày adidas 2B',
 'https://image.yes24.vn/Upload/ProductImage/thethaochinhang/2063770_L.jpg?width=550&height=550',150.00
, 'Giày đá bóng nam chính hãng Adidas Predator 18.4 FXG DB2007','Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau'
,1 );

insert into Product values(6, 'Giày adidas 2C',
 'https://image.yes24.vn/Upload/ProductImage/GmarketSport/2016304_L.jpg?width=550&height=550',160.00
, 'Giày đá bóng nam chính hãng Adidas Copa Tango 18.3 TF DB2410','Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau'
,2 );

insert into Product values(7, 'Giày adidas 2D',
 'https://image.yes24.vn/Upload/ProductImage/GmarketSport/2058803_L.jpg?width=550&height=550',170.00
, 'Giày đá bóng nam chính hãng Adidas X TANGO 18.4 TF DB2479','Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau'
, 1);

insert into Product values(8, 'New Men''s Running Shoes',
 'https://canary.contestimg.wish.com/api/webimage/5c4a05a08b26e56dcf17a643-normal.jpg?cache_buster=6d01b751858e14e68932bb234cdc44c1',150.00
, 'Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)',
'New Men''s Running Shoes Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)'
,4 );

insert into Product values(9, 'Men Hiking Shoes Waterproof Non',
 'https://canary.contestimg.wish.com/api/webimage/5dc3c309d8b69d0de8949a21-large.jpg?cache_buster=68ad269a9f7b07d0effa9e48c1dc5c0f',180.00
, 'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors',
'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors'
, 3);

insert into Product values(10, 'Winter Men''s Snow Boots Plus Velvet',
 'https://canary.contestimg.wish.com/api/webimage/5da3d0b594a0f07fdec6c5ac-large.jpg?cache_buster=a2471ea62eba44e7c0b0f4d2b4c64681',180.00
, 'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes',
'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes'
, 4);

insert into Product values(11, 'New Trend Men Hiking Shoes',
 'https://canary.contestimg.wish.com/api/webimage/5df1f07d1fc34e0c50f78eb7-large.jpg?cache_buster=36188c130400df0faa4256aad8e90109',150.00
, 'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48',
'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48'
, 3);

insert into Product values(12, 'Mens Skid Resistant Hiking Shoes',
 'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6',165.00
, 'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers',
'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers'
, 3);

insert into Product values(13, 'NEW Spring White Shoes Men',
 'https://canary.contestimg.wish.com/api/webimage/5d0235c9ae115f0be32755ef-large.jpg?cache_buster=fd2c105001ca1cbb03795818542906cc',185.00
, 'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear',
'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear'
, 3);


insert into Product values(14, 'Winter Outdoor Waterproof',
 'https://canary.contestimg.wish.com/api/webimage/5d70b17d55d5981ab5789f86-large.jpg?cache_buster=19f34456a6b274b940c839db21c2ab51',200.00
, 'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes', 
'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes'
, 4 );


insert into Product values(15, 'Men''s Fashion Casual Shoes',
 'https://canary.contestimg.wish.com/api/webimage/5c4a06d9e6a1c62df8877125-large.jpg?cache_buster=d17e757a3f8465edc71812b95b4b1a57',100.00
, 'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes',
'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes'
,4 );


insert into Product values(16, 'Mens Skid Resistant Hiking Shoes',
 'https://canary.contestimg.wish.com/api/webimage/5c4a02d1344e882b1a41bca4-large.jpg?cache_buster=bc4ce4d229ed4e42dbba614acb622899',120.00
, 'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors',
'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors'
, 4);


insert into Product values(17, 'Men''s Modern Classic Lace Up Lined',
 'https://canary.contestimg.wish.com/api/webimage/5c9543744578cb33ad0f56cd-large.jpg?cache_buster=ed84658c453c742ad13b9d565566ed06',100.00
, 'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords','Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords'
, 3);

insert into Product values(18, 'Men''s Outdoors Waterproof Boots Sports Shoes',
 'https://canary.contestimg.wish.com/api/webimage/5e0db090b6383fa7bb0416ab-large.jpg?cache_buster=92297459781628185d780669109c00d6',120.00
, 'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)',
'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)'
, 3);
-- sửa lại sản phẩm
UPDATE `qlbh`.`Product` SET `name` = 'GIÀY SUPERSTAR', `image` = 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/31cf91f6e16c4f0aa11caad6009a4590_9366/Giay_Superstar_trang_EG4958_05_standard.jpg', `title` = 'Giày thể thao', `description` = 'Thiết kế ban đầu dành cho sân bóng rổ vào thập niên 70. Được các ngôi sao hip hop tôn sùng vào thập niên 80. Đôi giày adidas Superstar giờ đây đã trở thành biểu tượng của các tín đồ thời trang đường phố. Thiết kế mũi giày vỏ sò nổi tiếng thế giới mang đến phong cách chất lừ và khả năng bảo vệ. Giống như những gì đôi giày này đã thể hiện trên sân bóng rổ trong quá khứ.    Giờ đây, bạn có thể tự tin tham gia lễ hội âm nhạc hay dạo phố mà không sợ bị dẫm lên chân. Chi tiết 3 Sọc viền răng cưa và logo adidas Superstar đóng khung mang đậm phong cách nguyên bản chính hiệu.' WHERE (`id` = '1');
UPDATE `qlbh`.`Product` SET `name` = 'TERREX VOYAGER 21', `image` = 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/757d62aebc704ced8cc2acaa0115efcb_9366/Giay_Du_Lich_Terrex_Voyager_21_DJen_FZ2225_01_standard.jpg', `title` = 'Giày du lịch', `description` = 'Pack đồ nhẹ nhàng và sẵn sàng cho tất cả. Đôi giày du lịch này kết hợp đế ngoài cứng cáp phù hợp mọi địa hình của giày chạy trail cùng thiết kế siêu nhẹ, linh hoạt để tiện pack đồ. Thành quả là đôi giày sneaker đồng hành cùng bạn đi khắp mọi nơi với cảm giác mềm mại, thoáng khí. Bạn có thể đi giày với tất hoặc không tùy ý. Hãy mang giày, kéo chặt dây bungee và bắt đầu khám phá.' WHERE (`id` = '3');
UPDATE `qlbh`.`Product` SET `name` = 'GIÀY SL20.2', `image` = 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/aecf2e5049054807b23eacb8009b43ef_9366/Giay_SL20.2_trang_FY4099_01_standard.jpg', `title` = 'Giày thể thao', `description` = 'Mỗi lần bạn nỗ lực cho chính mình khi ra đường tập luyện, Trái Đất sẽ đồng hành cùng bạn. Đôi giày adidas SL20.2 này làm từ chất liệu tái chế để đền đáp tinh thần ấy. Là người bạn tập lý tưởng, đôi giày này nâng đỡ từng bước chân với thân giày bằng vải lưới linh hoạt và đế ngoài bằng cao su siêu bám. Công nghệ Lightstrike tăng cường sự thoải mái với cảm giác siêu nhẹ, đàn hồi giúp bạn bứt phá đầy tốc độ và tự tin.' WHERE (`id` = '5');
UPDATE `qlbh`.`Product` SET `name` = 'GIÀY ULTRA 4DFWD', `image` = 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/c91c5dd3f18444f1b510ae98017b1970_9366/Giay_Ultra_4DFWD_Be_GY9837_01_standard.jpg', `title` = 'Giày thể thao', `description` = 'Trải nghiệm chạy bộ mượt mà với đôi giày chạy bộ Ultra 4DFWD. Giày kết hợp thân giày Ultraboost iconic với đế giữa adidas 4DFWD in 3D phiên bản cải tiến có khả năng nén về phía trước, giảm lực hãm và chuyển hoá năng lượng tác động thành chuyển động tiến về phía trước. Kết quả là chuyển động mượt mà và trải nghiệm lướt bay độc đáo. Thân giày adidas PRIMEKNIT ôm chân với các vùng nâng đỡ tập trung, cùng đế ngoài Continental™ Rubber cho độ bám vượt trội trong mọi điều kiện thời tiết.' WHERE (`id` = '7');
UPDATE `qlbh`.`Product` SET `name` = 'GIÀY NIKE PRECISION 5', `image` = 'https://myshoes.vn/image/cache/catalog/2022/nike2/23.11/giay-nike-precision-5-nam-den-trang-01-1000x1000.jpg', `title` = 'Giày chạy bộ', `description` = 'Giày Nike Precision 5 một mẫu giày sneaker Nike làm bằng chất liệu cao cấp và công nghệ đỉnh cao sẽ là một lựa chọn tuyệt vời của các tín đồ sneaker.' WHERE (`id` = '2');
UPDATE `qlbh`.`Product` SET `name` = 'GIÀY NIKE QUEST 4', `image` = 'https://myshoes.vn/image/cache/catalog/2022/nike2/18.11/giay-nike-quest-4-nam-xam-cam-01-1000x1000.jpg', `title` = 'Giày thể thao', `description` = 'Giày Giày Nike Quest 4 là mẫu giày được thiết kế cực kỳ đẹp và tinh tế với đặc điểm rất thoáng khí, êm và rất nhẹ. Đây là mẫu giày có thể sử dụng trong mọi hoạt động hàng ngày.' WHERE (`id` = '4');
UPDATE `qlbh`.`Product` SET `name` = 'GIÀY NIKE WINFLO 8', `image` = 'https://myshoes.vn/image/cache/catalog/2022/nike/16.11.2/giay-nike-winflo-8-nam-trang-xam-01-1000x1000.jpg', `title` = 'Giày thể thao', `description` = 'Giày Nike Winflo 8 là mẫu giày thể thao rất tốt của Nike. Winflo 8 hỗ trợ cho các vận động viên tăng tốc khi chạy. Phần upper với công nghệ Flywire mới nhất sẽ giúp ôm sát bàn chân nhưng vẫn cực kỳ thoải mái và thoáng khí.' WHERE (`id` = '6');
UPDATE `qlbh`.`Product` SET `name` = 'Hunter X Dune DSMH10700DEN', `image` = 'https://product.hstatic.net/1000230642/product/dsmh10700den__2__9a2f069a3f4d4ee4a9b83cf244fd1ef1.jpg', `title` = 'Giày Thể Thao Nam', `description` = 'Thiết kế mũ quai: Xu hướng đắp lớp thời thượng kết hợp si Nubuk và da lộn tạo nên phong cách tương lai dẫn đầu.Đế giữa bền bỉ: chất liệu Eva siêu nhẹ' WHERE (`id` = '9');
UPDATE `qlbh`.`Product` SET `name` = 'Hunter X Dune DSWH10701DEN', `image` = 'https://product.hstatic.net/1000230642/product/dsmh10701den__2__4fc82c7fcff046588e3451e6e35897bc.jpg', `title` = 'Giày Thể Thao Nữ', `description` = 'Thiết kế mũ quai: Xu hướng đắp lớp thời thượng kết hợp si Nubuk và da lộn tạo nên phong cách tương lai dẫn đầu' WHERE (`id` = '11');
UPDATE `qlbh`.`Product` SET `name` = 'Hunter Core Refreshing Collection Contras Black', `image` = 'https://product.hstatic.net/1000230642/product/06700den__3__a713faf8f84e49aaa7fbebc33dac6200.jpg', `title` = 'Giày Thể Thao Nam', `description` = ' Sản phẩm có dây buộc.Do màn hình và điều kiện ánh sáng khác nhau, màu sắc thực tế của sản phẩm có thể chênh lệch khoảng 3-5%.' WHERE (`id` = '12');
UPDATE `qlbh`.`Product` SET `name` = 'Hunter Football Gen 2K21 Futsal DSMH07300CAM', `image` = 'https://product.hstatic.net/1000230642/product/dsmh07300cam__3__cf8a73d30e2f4d83ac5d986865a785d5.jpg', `title` = 'Giày Bóng Đá Nam', `description` = 'Lần đầu tiên, giày bóng đá Biti’s Hunter Football dòng đế bằng Futsal được ra mắt, dành riêng cho sân futsal, sân xi măng, sân trong nhà. Đặc biệt, với kiểu dáng trẻ trung, phối màu hiện đại và thời trang, mẫu thiết kế dễ dàng được tận dụng cho cả dịp đi chơi, đi học, đi làm.' WHERE (`id` = '13');
UPDATE `qlbh`.`Product` SET `name` = 'Hunter Street Mid Americano DSMH03600DEN', `image` = 'https://product.hstatic.net/1000230642/product/dsmh03600__4__635fba02a403477fb8f869446669629e.jpg', `title` = 'Giày Thể Thao Nam', `description` = 'Chưa có mô tả cho sản phẩm này' WHERE (`id` = '17');
UPDATE `qlbh`.`Product` SET `name` = 'Hunter X Festive Frosty', `image` = 'https://product.hstatic.net/1000230642/product/dsmh03500trg__7__d2e1b4602c6141a994ff8e628dfddd73.jpg', `title` = 'Giày Thể Thao Nam', `description` = 'Chưa có mô tả cho sản phẩm này' WHERE (`id` = '18');
UPDATE `qlbh`.`Product` SET `name` = 'Converse Chuck 70 Seasonal Color', `image` = 'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/A01448C/A01448C_2-650x650.jpg', `title` = 'Giày thời trang', `description` = 'Converse Chuck 70 Seasonal Color là “đứa con lai” giữa hai dòng giày đình đám Chuck 70S và Seasonal Color của nhà Converse. Đôi giày là sự kết hợp tinh túy giữa vẻ ngoài cổ điển của Chuck 70S cùng phối màu Dark Beetroot/Egret/Black thời thượng của Seasonal Color. Đặc biệt, màu đỏ rượu vang chủ đạo mang đến vẻ đẹp ấm áp, sang trọng và quyến rũ, rất phù hợp cho outfit mùa đông sắp đến.' WHERE (`id` = '8');
UPDATE `qlbh`.`Product` SET `name` = 'Converse Chuck Taylor All Star Dainty', `image` = 'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/564981C/564981C_1-500x500.jpg', `title` = 'Giày thời trang', `description` = 'Phiên bản Converse Dainty vô cùng duyên dáng, nhẹ nhàng giúp các bạn nữ tỏa sáng với phong cách thời trang thanh lịch, trẻ trung. Kiểu dáng thanh mảnh, ôm form cùng chất liệu Canvas cao cấp, miếng đệm giày và lớp lót trong mềm mại giúp bạn có được sự thoải mái, êm nhẹ dù diện giày cả ngày dài.' WHERE (`id` = '10');
UPDATE `qlbh`.`Product` SET `name` = 'Chuck Taylor All Star Shoreline Knit Slip', `image` = 'https://drake.vn/image/cache/catalog/Hinh%20add%20dut%20size/565489C_PL1-500x500.jpg', `title` = 'Giày thời trang', `description` = 'Kiểu dáng nhỏ gọn kết hợp cùng chất vải dệt kim nhẹ thoáng mang đến cảm giác thoải mái cho đôi chân. Phần cổ giày có độ co giãn tốt giúp hạn chế trầy xước khi di chuyển nhiều giờ liền. Bên cạnh đó thiết kế với gam màu đen basic rất dễ mix match với bất kì outfit nào' WHERE (`id` = '14');
UPDATE `qlbh`.`Product` SET `name` = 'Converse Chuck Taylor All Star Seasonal Color', `image` = 'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/1J793C/1J793C_PL1-500x500.jpg', `title` = 'Giày thời trang', `description` = 'Mang đến sự thoải mái cho mọi hoạt động thường ngày, Converse Chuck Seasonal Color là sự lựa chọn hoàn hảo cho bất kỳ trang phục nào. Với gam màu grey thời thượng sẽ tạo thêm phong cách hơn cho tổng thể trang phục. Nhờ kiểu dáng cổ điển và kết cấu nội thất linh hoạt, đôi giày chính là sự kết hợp của thiết kế đơn giản nhưng không kém phần thời trang. Cùng với đó là chất liệu cao cấp, bền bỉ giúp bạn có được nhiều trải nghiệm thú vị nhất.' WHERE (`id` = '15');
UPDATE `qlbh`.`Product` SET `name` = 'Converse Chuck Taylor All Star 1970s', `image` = 'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/A01170C/A01170C_P1-500x500.jpg', `title` = 'Giày thể thao', `description` = 'Chào hè bằng những thiết kế Converse Archive Paint Splatter, thương hiệu bóng rổ đình đám đã có dịp chinh phục các bạn trẻ đang hướng đến sự mới lạ và phong cách cá tính. Ứng dụng xu hướng Paint Splatter với hình ảnh những tia sơn màu được phun một cách không cần trật tự lên bản in cho thiết kế mới. Converse mang đến item đầy sắc màu để bạn “hết mình” với style trẻ trung, năng động nhất.' WHERE (`id` = '16');

UPDATE `qlbh`.`product` SET `image` = '1.jpg' WHERE (`id` = '1');
UPDATE `qlbh`.`product` SET `image` = '2.jpg' WHERE (`id` = '2');
UPDATE `qlbh`.`product` SET `image` = '3.jpg' WHERE (`id` = '3');
UPDATE `qlbh`.`product` SET `image` = '4.jpg' WHERE (`id` = '4');
UPDATE `qlbh`.`product` SET `image` = '5.jpg' WHERE (`id` = '5');
UPDATE `qlbh`.`product` SET `image` = '6.jpg' WHERE (`id` = '6');
UPDATE `qlbh`.`product` SET `image` = '7.jpg' WHERE (`id` = '7');
UPDATE `qlbh`.`product` SET `image` = '8.jpg' WHERE (`id` = '8');
UPDATE `qlbh`.`product` SET `image` = '9.jpg' WHERE (`id` = '9');
UPDATE `qlbh`.`product` SET `image` = '10.jpg' WHERE (`id` = '10');
UPDATE `qlbh`.`product` SET `image` = '11.jpg' WHERE (`id` = '11');
UPDATE `qlbh`.`product` SET `image` = '12.jpg' WHERE (`id` = '12');
UPDATE `qlbh`.`product` SET `image` = '13.jpg' WHERE (`id` = '13');
UPDATE `qlbh`.`product` SET `image` = '14.jpg' WHERE (`id` = '14');
UPDATE `qlbh`.`product` SET `image` = '15.jpg' WHERE (`id` = '15');
UPDATE `qlbh`.`product` SET `image` = '16.jpg' WHERE (`id` = '16');
UPDATE `qlbh`.`product` SET `image` = '17.jpg' WHERE (`id` = '17');
UPDATE `qlbh`.`product` SET `image` = '18.jpg' WHERE (`id` = '18');



-- thêm cột image vào category
ALTER TABLE `qlbh`.`category` 
ADD COLUMN `cimage` VARCHAR(1000) NULL AFTER `cname`;

UPDATE `qlbh`.`category` SET `cimage` = 'https://gigamall.com.vn/data/2019/09/05/14465361_LOGO-ADIDAS-500x500.jpg' WHERE (`cid` = '1');
UPDATE `qlbh`.`category` SET `cimage` = 'https://bizweb.dktcdn.net/100/225/165/products/39282950-10156752742429114-562732366083129344-n.jpg?v=1617268073993' WHERE (`cid` = '2');
UPDATE `qlbh`.`category` SET `cimage` = 'https://pbs.twimg.com/profile_images/562838937119383552/oAopzgWG_400x400.png' WHERE (`cid` = '3');
UPDATE `qlbh`.`category` SET `cimage` = 'https://drake.vn/image/catalog/H%C3%ACnh%20content/converse-chuck-taylor-all-star-logo-play/Converse-chuck-taylor-all-star-logo-play-7.jpg' WHERE (`cid` = '4');

create table Account(
	id int not null,
    name varchar(50),
    email varchar(100) unique,
    password varchar(100),
    image varchar(500),
    isAdmin int,
    primary key(id)
);

insert into Account values (1, 'Nguyễn Duy Hiếu', 'admin@gmail.com', '123123', 'adminAvatar.jpg' ,1);

create table Transaction (
	id int not null,
    user_id int not null,
    name varchar(50),
    email varchar(50),
    phone_number varchar(50),
    address1 varchar(1000),
    country varchar(50),
    city varchar(50),
    zipcode varchar(50),
    payment varchar(20),
    total double,
    primary key(id)
);
create table ordered(
	id int auto_increment,
    product_id int,
    qty int,
    transaction_id int,
    primary key(id)
);

UPDATE `qlbh`.`category` SET `cimage` = '1.jpg' WHERE (`cid` = '1');
UPDATE `qlbh`.`category` SET `cimage` = '2.jpg' WHERE (`cid` = '2');
UPDATE `qlbh`.`category` SET `cimage` = '3.jpg' WHERE (`cid` = '3');
UPDATE `qlbh`.`category` SET `cimage` = '4.jpg' WHERE (`cid` = '4');

create table favorite(
	user_id int,
    product_id int,
    primary key(user_id, product_id)
);


create table contact(
	id int auto_increment not null,
    name varchar(50) not null,
    email varchar(50) not null,
    subject varchar(1000) not null,
    message mediumtext,
    primary key (id)
);