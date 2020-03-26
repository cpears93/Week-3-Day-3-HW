require_relative('../db/sql_runner')

class Album

  attr_accessor :name, :artist_id, :genre
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @artist_id = options['artist_id']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO albums
    (
    name,
    artist_id,
    genre
    ) VALUES
    (
    $1, $2, $3
    )
    RETURNING id"
    values = [@name, @artist_id, @genre]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i()
  end

  def artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run( sql,values )
    result = Artist.new( artist.first )
    return result
  end
