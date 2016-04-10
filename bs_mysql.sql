/* 建表 */
CREATE TABLE IF NOT EXISTS bs_user(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(120) NOT NULL UNIQUE,
	PASSWORD VARCHAR(120) ,
	email VARCHAR(120)
);

create table IF NOT EXISTS bs_book(
	id int(11) primary key auto_increment,
	title varchar(120),
	author varchar(120),
	price double(11,2),
	sales int(11),
	stock int(11),
	img_path varchar(200),
	is_del TINYINT
);

CREATE TABLE IF NOT EXISTS bs_order(
	id VARCHAR(100) PRIMARY KEY ,
	order_time DATETIME ,
	total_count INT(11),
	total_amount DOUBLE(11,2),
	state INT(2),
	user_id INT(11),
	FOREIGN KEY (user_id) REFERENCES bs_user(id)
);

CREATE TABLE IF NOT EXISTS bs_order_item(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	COUNT INT(11) ,
	amount DOUBLE(11,2),
	title VARCHAR(100),
	author VARCHAR(100),
	price DOUBLE(11,2),
	img_path VARCHAR(200),
	order_id VARCHAR(100),
	FOREIGN KEY (order_id) REFERENCES bs_order(id)
);

CREATE TABLE IF NOT EXISTS bs_role(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	r_name VARCHAR(120) NOT NULL UNIQUE,
	descirption VARCHAR(120),
	enabled TINYINT
);

insert into bs_role(r_name) value("普通用户");
insert into bs_role(r_name) value("会员用户");
insert into bs_role(r_name) value("管理员");