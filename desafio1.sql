DROP SCHEMA IF EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.subscriptions (
    id INT NOT NULL auto_increment,
    plan VARCHAR(50) NOT NULL,
    value DECIMAL(4,2) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.subscriptions (plan, value)
VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);


CREATE TABLE SpotifyClone.artists (
    id INT NOT NULL AUTO_INCREMENT,
    artist VARCHAR(250) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.artists (artist)
VALUES
    ('Walter Phoenix'),
    ('Freedie Shannon'),
    ('Lance Day'),
    ('Peter Strong'),
    ('Tyler Isle'),
    ('Fog');


CREATE TABLE SpotifyClone.users(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    subs_id INT NOT NULL,
    subs_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (subs_id) REFERENCES SpotifyClone.subscriptions(id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.users (name, age, subs_id, subs_date)
VALUES
    ('Thati', 23, 1, '2019-10-20'),
    ('Cintia', 35, 2, '2017-12-30'),
    ('Bill', 20, 3, '2019-06-05'),
    ('Roger', 45, 4, '2020-05-13'),
    ('Norman', 58, 4, '2017-02-17'),
    ('Patrick', 33, 2, '2017-01-06'),
    ('Vivian', 26, 3, '2018-01-05'),
    ('Carol', 19, 3, '2018-02-14'),
    ('Angelina', 42, 2, '2018-04-29'),
    ('Paul', 46, 2, '2017-01-17');

CREATE TABLE SpotifyClone.albums (
    id INT NOT NULL auto_increment,
    album VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    release_date YEAR NOT NULL,
    PRIMARY KEY (id), 
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.albums (album, artist_id, release_date)
VALUES
    ('Envious', 1, 1990),
    ('Exuberant', 1, 1993),
    ('Hallowed Steam', 4, 1995),
    ('Incandescent', 3, 1998),
    ('Temporary Culture', 2, 2001), 
    ('Library of liberty', 2, 2003),
    ('Chained Down', 5, 2007),
    ('Cabinet of fools', 5, 2012),
    ('No guarantees', 5, 2015),
    ('Apparatus', 6, 2015);

CREATE TABLE SpotifyClone.tracks (
    id INT NOT NULL auto_increment,
    track VARCHAR(70) NOT NULL,
    album_id INT NOT NULL,
    duration INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.tracks (track, album_id, duration, artist_id)
VALUES
    ('Soul for us', 1, 200, 1),
    ('Reflections Of Magic', 1, 163, 1),
    ('Dance With Her Own', 1, 116, 1),
    ('Troubles Of My Inner Fire', 2, 203, 1),
    ('Time Fireworks', 2, 152, 1),
    ('Magic Circus',3, 105, 2),
    ('Honey, So Do I', 3, 207, 2),
    ('Sweetie, Let''s Go Wild', 3, 139, 2),
    ('She Knows', 3, 244, 2),
    ('Fantasy For Me', 4, 100, 3),
    ('Celebration Of More', 4, 146, 3),
    ('Rock His Everything', 4, 223, 3),
    ('Home Forever', 4, 231, 3),
    ('Diamond Power', 4, 241, 3),
    ('Let''s Be Silly', 4, 132, 3),
    ('Thang Of Thunder', 5, 240, 4),
    ('Words Of Her Life', 5, 185, 4),
    ('Without My Streets', 5, 176, 4),
    ('Need Of The Evening', 6, 190, 4),
    ('History Of My Roses', 6, 222, 4), 
    ('Without My Love', 6, 111, 4), 
    ('Walking And Game', 6, 123, 4), 
    ('Young And Father', 6, 197, 4),
    ('Finding My Traditions', 7, 179, 5),
    ('Walking And Man', 7, 229, 5),
    ('Hard And Time', 7, 135, 5),
    ('Honey,I''m A Lone Wolf', 7, 150, 5),
    ('She Thinks I Won''t Stay Tonight', 8, 166, 5),
    ('He Heard You''re Bad For Me', 8, 154, 5), 
    ('He Hopes We Can''t Stay', 8, 210, 5), 
    ('I Know I Know', 8, 177, 5),
    ('He''s Walking Away', 9, 159, 5), 
    ('He''s Trouble', 9, 138, 5), 
    ('I Heard I Want To Bo Alone', 9, 120, 5), 
    ('I Ride Alone', 9, 151, 5),
    ('Honey', 10, 79, 6), 
    ('You Cheated On Me', 10, 95, 6), 
    ('Wouldn''t It Be Nice', 10, 213, 6), 
    ('Baby', 10, 136, 6), 
    ('You Make Me Feel So..', 10, 83, 6);

CREATE TABLE SpotifyClone.playlists (
    track_id INT NOT NULL,
    hist DATETIME NOT NULL,
    user_id INT NOT NULL,
    primary key (hist, user_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (id),
    FOREIGN KEY (track_id) REFERENCES SpotifyClone.tracks (id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.playlists (track_id, hist, user_id)
VALUES
    (36, '2020-02-28 10:45:55', 1),
    (25, '2020-05-02 05:30:35', 1),
    (23, '2020-03-06 11:22:33', 1),
    (14, '2020-08-05 08:05:17', 1),
    (15, '2020-09-14 16:32:22', 1), 
    (34, '2020-01-02 07:40:33', 2),
    (24, '2020-05-16 06:16:22', 2),
    (21, '2020-10-09 12:27:48', 2),
    (39, '2020-09-21 13:14:46', 2),
    (6, '2020-11-13 16:55:13', 3),
    (3, '2020-12-05 18:38:30', 3),
    (26, '2020-07-30 10:00:00', 3),
    (2, '2021-08-15 17:10:10', 4),
    (35, '2021-07-10 15:20:30', 4),
    (27, '2021-01-09 01:44:33', 4),
    (7, '2020-07-03 19:33:28', 5),
    (12, '2017-02-24 21:14:22', 5),
    (14, '2020-08-06 15:23:43', 5),
    (1, '2020-11-10 13:52:27', 5),
    (38, '2019-02-07 20:33:48', 6),
    (29, '2017-01-24 00:31:17', 6),
    (30, '2017-10-12 12:35:20', 6),
    (22, '2018-05-29 14:56:41', 6),
    (5, '2019-02-07 20:33:48', 7),
    (4, '2020-07-27 12:52:58', 7),
    (11, '2018-01-16 18:40:43', 7),
    (39, '2018-03-21 16:56:40', 8),
    (40, '2020-10-18 13:38:05', 8),
    (32, '2019-05-25 08:14:03', 8),
    (33, '2021-08-15 21:37:09', 8),
    (16, '2021-05-24 17:23:45', 9),
    (17, '2018-12-07 22:48:52', 9),
    (8, '2021-03-14 06:14:26', 9),
    (9, '2020-04-01 03:36:00', 9),
    (20, '2017-02-06 08:21:34', 10),
    (21, '2017-12-04 05:33:43', 10),
    (12, '2017-07-27 05:24:49', 10),
    (13, '2017-12-25 01:03:57', 10);

CREATE TABLE SpotifyClone.follow(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.follow (user_id, artist_id)
VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1), 
    (2, 3), 
    (3, 2), 
    (3, 1),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);
