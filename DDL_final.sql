DROP TABLE IF EXISTS Recommendation_Includes_Podcast;
DROP TABLE IF EXISTS Recommendation_Includes_Song;
DROP TABLE IF EXISTS Features_On_Song;
DROP TABLE IF EXISTS Works_On_Podcast;
DROP TABLE IF EXISTS Created_By_Artist;
DROP TABLE IF EXISTS Listens_To_Podcast;
DROP TABLE IF EXISTS Listens_To_Song;
DROP TABLE IF EXISTS Contains_Song;
DROP TABLE IF EXISTS Likes_Song;
DROP TABLE IF EXISTS Follows;
DROP TABLE IF EXISTS Recommendation_List;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Playlist;
DROP TABLE IF EXISTS Subscription;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Episode;
DROP TABLE IF EXISTS Podcast;
DROP TABLE IF EXISTS Artist_Album;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Record_Label;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Artist;

CREATE TABLE Artist (
    Artist_id INT PRIMARY KEY,
    Full_name varchar(255) NOT NULL,
    Social_media_links text
);

CREATE TABLE Record_Label (
    Label_id int PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Artist_id int,  
    FOREIGN KEY (Artist_id) REFERENCES Artist(Artist_id),
    Headquarters varchar(255)
);

CREATE TABLE Album (
    Album_id INT PRIMARY KEY,
    Title varchar(255) NOT NULL,
    Release_date date
);

CREATE TABLE Podcast (
    Podcast_id int PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Release_date DATE
);

CREATE TABLE Episode (
    Episode_id int PRIMARY KEY,
    Podcast_id INT NOT NULL,
    Episode_num int,
    Recording varchar(255),
    Title VARCHAR(255) NOT NULL,
    Release_date date,
    FOREIGN KEY (Podcast_id) REFERENCES Podcast(Podcast_id)
);

CREATE TABLE Users (
    User_id INT PRIMARY KEY,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Device_list text, 
    Password varchar(255) NOT NULL,
    Name varchar(255),
    Date_joined date NOT NULL,
    Date_of_birth DATE
);

CREATE TABLE Payment (
    Payment_id int PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    Payment_date DATE NOT NULL,
    Status varchar(50),
    Payment_method VARCHAR(50)
);

CREATE TABLE Subscription (
    Subscriber_id INT PRIMARY KEY,
    Plan_type varchar(50) NOT NULL,
    Start_date DATE NOT NULL,
    End_date date,
    Auto_renewal_status BOOLEAN NOT NULL,
    User_id int NOT NULL,
    Payment_id INT,
    FOREIGN KEY (User_id) REFERENCES Users(User_id),
    FOREIGN KEY (Payment_id) REFERENCES Payment(Payment_id)
);

CREATE TABLE Playlist (
    Playlist_id int PRIMARY KEY,
    User_id INT NOT NULL,
    Creation_date DATE NOT NULL,
    Name varchar(255) NOT NULL,
    Type varchar(50),
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Song (
    Song_id INT PRIMARY KEY,
    Album_id int,
    Genre varchar(100),
    Duration time,
    Title VARCHAR(255) NOT NULL,
    Recording varchar(255),
    Release_date DATE,
    Num_interested int,
    FOREIGN KEY (Album_id) REFERENCES Album(Album_id)
);

CREATE TABLE Recommendation_List (
    Recommendation_id int PRIMARY KEY,
    Generated_date date NOT NULL,
    User_id INT NOT NULL,
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Follows (
    User_id int NOT NULL,
    Artist_id INT NOT NULL,
    Follow_date DATE NOT NULL,
    PRIMARY KEY (User_id, Artist_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id),
    FOREIGN KEY (Artist_id) REFERENCES Artist(Artist_id)
);

CREATE TABLE Likes_Song (
    User_id INT NOT NULL,
    Song_id int NOT NULL,
    PRIMARY KEY (User_id, Song_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id),
    FOREIGN KEY (Song_id) REFERENCES Song(Song_id)
);

CREATE TABLE Contains_Song (
    Playlist_id INT NOT NULL,
    Song_id INT NOT NULL,
    Added_date date NOT NULL,
    PRIMARY KEY (Playlist_id, Song_id),
    FOREIGN KEY (Playlist_id) REFERENCES Playlist(Playlist_id),
    FOREIGN KEY (Song_id) REFERENCES Song(Song_id)
);

CREATE TABLE Listens_To_Song (
    User_id INT NOT NULL,
    Song_id INT NOT NULL,
    Listen_count int,
    PRIMARY KEY (User_id, Song_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id),
    FOREIGN KEY (Song_id) REFERENCES Song(Song_id)
);

CREATE TABLE Listens_To_Podcast (
    User_id INT NOT NULL,
    Podcast_id int NOT NULL,
    Listen_count INT,
    PRIMARY KEY (User_id, Podcast_id),
    FOREIGN KEY (User_id) REFERENCES Users(User_id),
    FOREIGN KEY (Podcast_id) REFERENCES Podcast(Podcast_id)
);

CREATE TABLE Created_By_Artist (
    Artist_id INT NOT NULL,
    Song_id INT NOT NULL,
    PRIMARY KEY (Artist_id, Song_id),
    FOREIGN KEY (Artist_id) REFERENCES Artist(Artist_id),
    FOREIGN KEY (Song_id) REFERENCES Song(Song_id)
);

CREATE TABLE Works_On_Podcast (
    Artist_id int NOT NULL,
    Podcast_id INT NOT NULL,
    PRIMARY KEY (Artist_id, Podcast_id),
    FOREIGN KEY (Artist_id) REFERENCES Artist(Artist_id),
    FOREIGN KEY (Podcast_id) REFERENCES Podcast(Podcast_id)
);

CREATE TABLE Features_On_Song (
    Artist_id INT NOT NULL,
    Song_id INT NOT NULL,
    PRIMARY KEY (Artist_id, Song_id),
    FOREIGN KEY (Artist_id) REFERENCES Artist(Artist_id),
    FOREIGN KEY (Song_id) REFERENCES Song(Song_id)
);

CREATE TABLE Recommendation_Includes_Song (
    Recommendation_id int NOT NULL,
    Song_id INT NOT NULL,
    PRIMARY KEY (Recommendation_id, Song_id),
    FOREIGN KEY (Recommendation_id) REFERENCES Recommendation_List(Recommendation_id),
    FOREIGN KEY (Song_id) REFERENCES Song(Song_id)
);

CREATE TABLE Recommendation_Includes_Podcast (
    Recommendation_id INT NOT NULL,
    Podcast_id INT NOT NULL,
    PRIMARY KEY (Recommendation_id, Podcast_id),
    FOREIGN KEY (Recommendation_id) REFERENCES Recommendation_List(Recommendation_id),
    FOREIGN KEY (Podcast_id) REFERENCES Podcast(Podcast_id)
);

CREATE TABLE Artist_Album (
    Artist_id INT NOT NULL,
    Album_id INT NOT NULL,
    PRIMARY KEY (Artist_id, Album_id),
    FOREIGN KEY (Artist_id) REFERENCES Artist(Artist_id),
    FOREIGN KEY (Album_id) REFERENCES Album(Album_id)
);



