CREATE TABLE user(
    user_id INT auto_increment,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    passwd VARCHAR(50) NOT NULL,
    register_time date NOT NULL,
    PRIMARY KEY(user_id)
);

INSERT INTO user(user_name,passwd,register_time) VALUES("test","123456",NOW());