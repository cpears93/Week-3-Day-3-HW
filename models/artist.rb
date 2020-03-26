require_relative( '../db/sql_runner' )

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES
    (
    $1
    )
    RETURNING *"
    values = [@name]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i()
  end

  def albums()
    sql = "SELECT * FROM albums
    WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run( sql, values )
    result = albums.map { |album_hash| Album.new( album_hash ) }
    return result
  end
