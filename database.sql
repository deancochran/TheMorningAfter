/*
  The Morning After Database
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
INSERT INTO users(user_handle, user_first_name, user_last_name, user_age, trainer_region, trainer_level)
VALUES  ("Dean","Cochran", 22, "Male", "Hohen", 40),
        ("Ash","Ketchup", 4, "Male", "Hohen", 64),
        ("Wynnie","Sun", 4, "Female", "Hohen", 40);
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

-- INSERT INTO regions(trainer_region)
-- VALUES  ("Hohen");



-- INSERT INTO awards (award_name, award_tier, award_target, award_bonus)
-- VALUES  ('Big Award',"Gold","Trainer",500),
--         ('Small Award',"Bronze","Pokemon",100);

-- INSERT INTO moves_types(move_type)
-- VALUES  ("lighting"),
--         ("fighting"),
--         ("fire"),
--         ("rock"),
--         ("grass"),
--         ("poison"),
--         ("normal");

-- INSERT INTO moves(move_name, move_type, move_power)
-- VALUES  ('shock','lighting',100),
--         ('nibble','fighting',5),
--         ('acid','poison',40),
--         ('absorb','grass',20),
--         ('attack','normal',100);

-- INSERT INTO pokemon_species (pokemon_species_name)
-- VALUES  ('Pikachu'),
--         ('Bulbasaur'),
--         ('Charmander'),
--         ('Squirtle'),
--         ('Clefairy'),
--         ('Vulpix'),
--         ('Bellsprout');

-- INSERT INTO captured_pokemon(pokemon_species_id, trainer_id, pokemon_nickname, pokemon_level)
-- VALUES (1, 1,'dreamon-teamon',4),
--        (2, 1, null, 1),
--        (3, 1, null, 3),
--        (4, 1, null, 11),
--        (5, 1, null, 1),
--        (6, 1, null, 1);

-- INSERT INTO pokemon_moves(captured_pokemon_id, move_id)
-- VALUES (1, 1),
--        (1, 2),
--        (1, 3),
--        (1, 4);

-- INSERT INTO trainers_awards(trainer_id, award_id)
-- VALUES (1, 1);

-- INSERT INTO pokemon_awards(captured_pokemon_id, award_id)
-- VALUES (1, 2);

-- INSERT INTO battles(away_contestant, home_contestant, battle_home_result)
-- VALUES (2,1,1),
--        (1,2,1),
--        (2,3,-1),
--        (1,2,0),
--        (1,2,1),
--        (3,1,0),
--        (2,1,1),
--        (3,1,-1),
--        (2,1,-1),
--        (1,3,0);



-- -- home wins

-- CREATE VIEW trainer_home_wins AS
-- Select trainer_id, COUNT(battle_home_result) AS home_wins_num from battles 
-- Inner join trainers on trainer_id = home_contestant
-- WHERE  battle_home_result = 1
-- GROUP BY trainer_id;


-- -- home losses
-- CREATE VIEW trainer_home_losses AS
-- Select trainer_id, COUNT(battle_home_result) AS home_losses_num from battles 
-- Inner join trainers on trainer_id = home_contestant
-- WHERE  battle_home_result = -1
-- GROUP BY trainer_id;

-- -- away win
-- CREATE VIEW trainer_away_wins AS
-- Select trainer_id, COUNT(battle_home_result) AS away_wins_num from battles 
-- Inner join trainers on trainer_id = away_contestant
-- WHERE  battle_home_result = -1
-- GROUP BY trainer_id;

-- -- away losses
-- CREATE VIEW trainer_away_losses AS
-- Select trainer_id, COUNT(battle_home_result) AS away_losses_num from battles 
-- Inner join trainers on trainer_id = away_contestant
-- WHERE  battle_home_result = 1
-- GROUP BY trainer_id;

-- -- home ties
-- CREATE VIEW trainer_home_ties AS
-- Select trainer_id, COUNT(battle_home_result) AS home_ties_num from battles 
-- Inner join trainers on trainer_id = home_contestant
-- WHERE  battle_home_result = 0
-- GROUP BY trainer_id;

-- -- away ties
-- CREATE VIEW trainer_away_ties AS
-- Select trainer_id, COUNT(battle_home_result) AS away_ties_num from battles 
-- Inner join trainers on trainer_id = away_contestant
-- WHERE  battle_home_result = 0
-- GROUP BY trainer_id;

-- -------------------- Selection statements, display all tables and views --------------------

-- SELECT * FROM regions;

-- SELECT * FROM trainers;
-- SELECT * FROM trainers_view;

-- SELECT * FROM awards;
-- SELECT * FROM awards_view;

-- SELECT * FROM moves_types;

-- SELECT * FROM moves;
-- SELECT * FROM moves_view;

-- SELECT * FROM pokemon_species;
-- SELECT * FROM pokemon_species_view;

-- SELECT * FROM captured_pokemon;

-- SELECT * FROM pokemon_moves;

-- SELECT * FROM trainers_awards;

-- SELECT * FROM pokemon_awards;

-- SELECT * FROM battles;
-- SELECT * FROM battles_view;


-- SELECT * FROM trainer_home_wins;
-- SELECT * FROM trainer_away_wins;


-- SELECT * FROM trainer_home_losses;
-- SELECT * FROM trainer_away_losses;


-- SELECT * FROM trainer_home_ties;
-- SELECT * FROM trainer_away_ties;
