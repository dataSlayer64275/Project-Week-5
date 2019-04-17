require_relative( "../db/sqlrunner.rb" )

class Artist

attr_accessor :id, :name, :year_of_birth, :year_of_death, :biography

  def initialize (details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @year_of_birth = details['year_of_birth']
    @year_of_death = details['year_of_death']
    @biography = details['biography']
  end

  def save
    sql = "INSERT INTO artists
    (
      name,
      year_of_birth,
      year_of_death,
      biography
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @year_of_birth, @year_of_death, @biography]
    results = SqlRunner.run(sql, values)
    @id = results.first['id']
  end

  def self.all
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map {|artist|Artist.new(artist)}
  end

  def self.find( id )
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    artist = SqlRunner.run( sql, values )
    result = Artist.new( artist.first )
    return result
  end

  def delete
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update
  sql = "UPDATE artists
  SET
  (
    name,
    year_of_birth,
    year_of_death,
    biography
  )
  =
  (
    $1, $2, $3, $4
  )
  WHERE id = $5"
  values = [@name, @year_of_birth, @year_of_death, @biography, @id]
  results = SqlRunner.run(sql, values)
end

end
