CREATE TABLE user(
    user_id INT auto_increment,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    passwd VARCHAR(50) NOT NULL,
    register_time DATETIME DEFAULT NOW(),
    privilege INT DEFAULT 0,
    PRIMARY KEY(user_id)
)default charset=utf8;
INSERT INTO user(user_name,passwd) VALUES("test","123456");
INSERT INTO user(user_name,passwd,privilege) VALUES("admin","admin",10);

CREATE TABLE book(
    book_id INT auto_increment,
    book_name VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    publisher VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    res_url VARCHAR(100) NOT NULL,
    book_status INT DEFAULT 1, -- 1 means available, 0 means not
    PRIMARY KEY(book_id)
)default charset=utf8; 


CREATE TABLE book_order(
    order_id INT auto_increment,
    user_id INT NOT NULL,
    created_time DATETIME DEFAULT NOW(),
    order_status INT DEFAULT 1, -- 1 means ok, 0 means cancelled
    PRIMARY KEY(order_id),
    FOREIGN KEY(user_id) REFERENCES user(user_id)
)default charset=utf8; 

INSERT INTO book_order(user_id) VALUES(1);

CREATE TABLE item(
    item_id INT auto_increment,
    book_id INT NOT NULL,
    order_id INT NOT NULL,
    quentity INT NOT NULL,
    PRIMARY KEY(item_id),
    FOREIGN KEY(book_id) REFERENCES book(book_id),
    FOREIGN KEY(order_id) REFERENCES book_order(order_id)
)default charset=utf8;

INSERT INTO item(book_id,order_id,quentity) VALUES(1,1,2);
