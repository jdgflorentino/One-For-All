SELECT
    (
        SELECT
            COUNT(id)
        FROM
            SpotifyClone.tracks
    ) AS cancoes,
    (
        SELECT
            COUNT(id)
        FROM
            SpotifyClone.artists
    ) AS artistas,
    (
        SELECT
            COUNT(id)
        FROM
            SpotifyClone.albums
    ) AS albuns
FROM
    dual

