# music-streaming-database
Relational database design for a music streaming platform with users, content, and subscriptions.

## Overview
The goal of this project is to design a structured and normalized relational database that represents the core functionality of a modern music streaming service. The database supports content creation, user activity tracking, recommendations, and subscription management.

The project focuses on **database design and SQL**, rather than application development.

## Features
- User accounts and subscription management
- Artists, albums, songs, and podcasts
- Playlists and user-generated content
- Listening history and likes
- Artist collaborations and podcast participation
- Recommendation lists and curated content
- Payment and record label information

## Database Design
- Fully relational schema with **primary and foreign keys**
- Normalized tables to reduce redundancy
- Many-to-many relationships implemented via junction tables
- Clear separation between content, users, and interactions

## Repository Structure
├── ddl/
│ └── DDL_final.sql # Database schema (tables, keys, constraints)
├── dml/
│ ├── insert_users.sql
│ ├── insert_artist.sql
│ ├── insert_album.sql
│ ├── insert_song.sql
│ ├── insert_podcast.sql
│ ├── insert_playlist.sql
│ ├── insert_subscription.sql
│ ├── insert_payment.sql
│ ├── insert_record_label.sql
│ └── ... # Relationship and activity inserts
└── README.md


## How to Use
1. Create a new database in your preferred SQL DBMS.
2. Run the DDL script to create tables:
   ```sql
   SOURCE ddl/DDL_final.sql;
3. Populate the database using the DML scripts in order: SOURCE dml/insert_users.sql;
                                                         SOURCE dml/insert_artist.sql;
                                                -- continue with remaining insert files

## Authors
Zhora Mkoyan
Meline Abedjian
**Hayk Shahsuvaryan**
