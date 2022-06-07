SELECT
      artistas.artist as artista,
      albuns.album as album
FROM
      SpotifyClone.albums AS albuns
      JOIN
      SpotifyClone.artists AS artistas ON albuns.artist_id = artistas.id
GROUP BY artista, album
HAVING artista = 'Walter Phoenix';