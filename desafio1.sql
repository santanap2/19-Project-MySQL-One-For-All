DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;
  
CREATE TABLE SpotifyClone.plans(
	`plan_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `price` DECIMAL(4,2) NOT NULL
) engine = InnoDB;
    
CREATE TABLE SpotifyClone.users(
	`user_id` INT PRIMARY KEY AUTO_INCREMENT,
	`username` VARCHAR(25) NOT NULL,
	`age` INT NOT NULL,
	`plan_id` INT NOT NULL,
	`signature_date` DATE NOT NULL,
	FOREIGN KEY (`plan_id`) REFERENCES plans(`plan_id`)
) engine = InnoDB;
   
CREATE TABLE SpotifyClone.artists(
	`artist_id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.albums(
	`album_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `release_year` YEAR NOT NULL,
  `artist_id` INT NOT NULL,
  FOREIGN KEY (`artist_id`) REFERENCES artists(`artist_id`)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.songs(
	`song_id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL,
	`album_id` INT NOT NULL,
	`length` INT NOT NULL,
	FOREIGN KEY (`album_id`) REFERENCES albums(`album_id`)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.history(
	`user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `played_date` DATETIME,
  FOREIGN KEY (user_id) REFERENCES users(`user_id`),
  FOREIGN KEY (song_id) REFERENCES songs(`song_id`),
  CONSTRAINT PRIMARY KEY (`user_id`, `song_id`)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.artists_followed(
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
  CONSTRAINT PRIMARY KEY (user_id, artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans(`name`, `price`) VALUES
  ('gratuito', 00.00),
  ('familiar', 07.99),
  ('universitario', 05.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.users(`username`, `age`, `plan_id`, `signature_date`) VALUES
('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 1, '2017-12-30'),
('Martin Fowler', 46, 1, '2017-01-17'),
('Sandi Metz', 58, 1, '2018-04-29'),
('Paulo Freire', 19, 1, '2018-02-14'),
('Bell Hooks', 26, 1, '2018-01-05'),
('Christopher Alexander', 85, 1, '2019-06-05'),
('Judith Butler', 45, 1, '2020-05-13'),
('Jorge Amado', 58, 1, '2017-02-17');

INSERT INTO SpotifyClone.artists(`name`) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.albums(`name`, `release_year`, `artist_id`) VALUES
('Renaissance', 2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.songs(`name`, `album_id`, `length`) VALUES
  ('BREAK MY SOUL', 1, 279),
  ("VIRGO'S GROOVE", 1, 369),
  ('ALIEN SUPERSTAR', 1, 116),
  ("Don't Stope Me Now", 2, 203),
  ('Under Pressure', 3, 152),
  ('Como Nossos Pais', 4, 105),
  ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
  ('Samba em Paris', 6, 267),
  ("The Bard's Song", 7, 244),
  ('Feeling Good', 8, 100);

  INSERT INTO SpotifyClone.history(`user_id`, `song_id`, `played_date`) VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-06-03 11:22:33'),
  (2, 10, '2020-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');

  INSERT INTO SpotifyClone.artists_followed(`user_id`, `artist_id`) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (9, 2);