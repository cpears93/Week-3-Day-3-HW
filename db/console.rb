require_relative( './models/album' )
require_relative( './models/music' )

require( 'pry-byebug' )

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new( { 'name' => 'Daft Punk' } )
artist1.save();
album1 = Album.new( { 'name' => 'Voyager', 'artist_id' => artist1.id, 'genre' => 'Dance' } )
album1.save()
album2 = Album.new( { 'name' => 'Discovery', 'artist_id' => artist1.id, 'genre' => 'Dance' } )
album2.save()


binding.pry
nil
