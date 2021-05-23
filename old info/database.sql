/*
  The Morning After Database IDEA
  By: Dean Cochran
*/

-- /* Create the database: pokemon_game (dropping the previous version if necessary) */
DROP DATABASE IF EXISTS morningafter;
CREATE DATABASE morningafter;
USE morningafter;

CREATE TABLE users (
    PRIMARY KEY (user_id),
    user_id             INT AUTO_INCREMENT,
    user_handle         VARCHAR(20),
    UNIQUE (user_handle),
    user_first_name     VARCHAR(20),
    user_last_name      VARCHAR(20),
    user_age            INT DEFAULT 0 CHECK (user_age >= 0)
    --maybe add socials
);

CREATE TABLE blogs (
    PRIMARY KEY (blog_id), 
    blog_id             INT AUTO_INCREMENT,
    user_photos_id      INT,
    blog_contents_id    INT,
    FOREIGN KEY (user_photos_id) REFERENCES user_photos(user_photos_id)
);

CREATE TABLE photos (
    PRIMARY KEY (photo_id), 
    photo_id            INT AUTO_INCREMENT,
    photo_title         VARCHAR(20),
    photo_img           VARBINARY(MAX)
);

CREATE TABLE contents (
    PRIMARY KEY (content_id), 
    content_id            INT AUTO_INCREMENT,
    content_title         VARCHAR(20),
    content_text          VARCHAR(1500)
);

CREATE TABLE user_blogs(
    PRIMARY KEY (user_blogs_id), 
    user_blogs_id               INT AUTO_INCREMENT,
    blog_id                     INT,
    user_id                     INT,
    user_blogs_date             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (blog_id) REFERENCES blogs(blog_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE user_photos(
    PRIMARY KEY (user_photos_id), 
    user_photos_id                  INT AUTO_INCREMENT,
    user_id                         INT,
    FOREIGN KEY (photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE blog_contents(
    PRIMARY KEY (blog_contents_id), 
    blog_contents_id                    INT AUTO_INCREMENT,
    blog_id                             INT,
    content_id                          INT,
    FOREIGN KEY (blog_id) REFERENCES blogs(blog_id),
    FOREIGN KEY (content_id) REFERENCES contents(content_id)
);

-- ------------------- Populate tables with sample data -------------------
-- INSERT INTO users(user_handle, user_first_name, user_last_name, user_age, trainer_region, trainer_level)
-- VALUES  ("Dean","Cochran", 22, "Male", "Hohen", 40),
--         ("Ash","Ketchup", 4, "Male", "Hohen", 64),
--         ("Wynnie","Sun", 4, "Female", "Hohen", 40);
-- CREATE TABLE users (
--     PRIMARY KEY (user_id),
--     user_id             INT AUTO_INCREMENT,
--     user_handle         VARCHAR(20),
--     UNIQUE (user_handle),
--     user_first_name     VARCHAR(20),
--     user_last_name      VARCHAR(20),
--     user_age            INT DEFAULT 0 CHECK (user_age >= 0),
--     user_insta          VARCHAR(20),
--     user_twitter        VARCHAR(20),
--     user_snap           VARCHAR(20),
--     user_linkedIn       VARCHAR(20)
-- );

-- CREATE TABLE blogs (
--     PRIMARY KEY (blog_id), 
--     blog_id             INT AUTO_INCREMENT,
--     user_photos_id      INT,
--     blog_contents_id    INT,
--     FOREIGN KEY (user_photos_id) REFERENCES user_photos(user_photos_id)
-- );

-- CREATE TABLE photos (
--     PRIMARY KEY (photo_id), 
--     photo_id            INT AUTO_INCREMENT,
--     photo_title         VARCHAR(20),
--     photo_img           VARBINARY(MAX)
-- );

-- CREATE TABLE contents (
--     PRIMARY KEY (content_id), 
--     content_id            INT AUTO_INCREMENT,
--     content_title         VARCHAR(20),
--     content_text          VARCHAR(1500)
-- );

-- CREATE TABLE user_blogs(
--     PRIMARY KEY (user_blogs_id), 
--     user_blogs_id               INT AUTO_INCREMENT,
--     blog_id                     INT,
--     user_id                     INT,
--     user_blogs_date             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (blog_id) REFERENCES blogs(blog_id),
--     FOREIGN KEY (user_id) REFERENCES users(user_id)
-- );

-- CREATE TABLE user_photos(
--     PRIMARY KEY (user_photos_id), 
--     user_photos_id                  INT AUTO_INCREMENT,
--     user_id                         INT,
--     FOREIGN KEY (photo_id) REFERENCES photos(photo_id),
--     FOREIGN KEY (user_id) REFERENCES users(user_id)
-- );

-- CREATE TABLE blog_contents(
--     PRIMARY KEY (blog_contents_id), 
--     blog_contents_id                    INT AUTO_INCREMENT,
--     blog_id                             INT,
--     content_id                          INT,
--     FOREIGN KEY (blog_id) REFERENCES blogs(blog_id),
--     FOREIGN KEY (content_id) REFERENCES contents(content_id)
