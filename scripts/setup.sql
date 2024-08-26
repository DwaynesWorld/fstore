-- Large song data
CREATE TABLE songs (
    id String,
    name String,
    album String,
    album_id String,
    artists Array(String),
    artist_ids Array(String),
    track_number Int64,
    disc_number Int64,
    explicit String,
    danceability Float64,
    energy String,
    key Int64,
    loudness Float64,
    mode Int64,
    speechiness Float64,
    acousticness String,
    instrumentalness String,
    liveness Float64,
    valence Float64,
    tempo Float64,
    duration_ms Int64,
    time_signature Float64,
    year Int64,
    release_date String
) 
ENGINE = MergeTree
ORDER BY (name, release_date);

INSERT INTO "default".songs
FROM INFILE '/Users/kt/dev/source/features-store/data/songs.csv' SETTINGS input_format_allow_errors_ratio = 0.2 FORMAT CSV; 
    
-- small dataset tp test ReplacingMergeTree
create table trending (
    rank Int32,
    track String,
    artist String,
    version_time DateTime,
)
ENGINE = ReplacingMergeTree(version_time)
ORDER BY rank;

INSERT INTO trending Values
    (1, 'A Bar Song (Tipsy)', 'Shaboozey', now())
    (2, 'I Had Some Help', 'Post Malone', now())
    (3, 'Not Like Us', 'Kendrick Lamar', now())
    (4, 'Espresso', 'Sabrina Carpenter', now())
    (5, 'Birds Of A Feather', 'Billie Eilish', now())
    (6, 'Million Dollar Baby', 'Tommy Richman', now())
    (7, 'Good Luck, Babe!', 'Chappell Roan', now())
    (8, 'Please Please', 'Sabrina Carpenter', now())
    (9, 'Lose Control', 'Teddy Swims', now())
    (10, 'Too Sweet', 'Hozier', now());