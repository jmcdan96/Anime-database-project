-- Query 1: List anime with their characters and voice actors

SELECT
    a.title,
    c.name AS character_name,
    va.name AS voice_actor_name
FROM anime a
JOIN anime_character ac ON a.anime_id = ac.anime_id
JOIN characters c ON ac.character_id = c.character_id
JOIN voice_actors va ON ac.voice_actor_id = va.voice_actor_id;

-- Query 2: Count characters per anime

SELECT
    a.title,
    COUNT(ac.character_id) AS character_count
FROM anime a
JOIN anime_character ac ON a.anime_id = ac.anime_id
GROUP BY a.title;

-- Anime with popularity over a threshold
SELECT
    a.title,
    s.popularity
FROM anime a
JOIN anime_stats s
ON a.anime_id = s.anime_id
WHERE s.popularity > 1000;

-- Studios and the number of anime they produced
SELECT
    st.studio_name,
    COUNT(ap.anime_id) AS anime_count
FROM studios st
JOIN anime_production ap
ON st.studio_id = ap.studio_id
GROUP BY st.studio_name;