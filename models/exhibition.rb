require_relative( "../db/sqlrunner.rb" )
require_relative("../models/category.rb")
require_relative('../models/artist.rb')

class Exhibition

  attr_accessor :id, :title, :artist_id, :category_id, :time_of_exhibition, :date_of_exhibition, :description

  def initialize (details)
    @id = details['id'].to_i
    @title = details['title']
    @artist_id = details['artist_id'].to_i
    @category_id = details['category_id'].to_i
    @date_of_exhibition = details['date_of_exhibition']
    @time_of_exhibition = details['time_of_exhibition']
    @description = details['description']
  end

  def save
    sql = "INSERT INTO exhibitions
    (
      title,
      artist_id,
      category_id,
      date_of_exhibition,
      time_of_exhibition,
      description
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@title, @artist_id, @category_id, @date_of_exhibition, @time_of_exhibition, @description]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id']
  end

  def self.all
    sql = "SELECT * FROM exhibitions"
    results = SqlRunner.run(sql)
    return results.map {|exhibition|Exhibition.new(exhibition)}
  end

  def self.find( id )
    sql = "SELECT * FROM exhibitions
    WHERE id = $1"
    values = [id]
    exhibition = SqlRunner.run( sql, values )
    result = Exhibition.new( exhibition.first )
    return result
  end

  def delete
    sql = "DELETE FROM exhibitions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update
  sql = "UPDATE exhibitions
  SET
  (
    title,
    artist_id,
    category_id,
    date_of_exhibition,
    time_of_exhibition,
    description
  )
  =
  (
    $1, $2, $3, $4, $5, $6
  )
  WHERE id = $7"
  values = [@title, @artist_id, @category_id, @date_of_exhibition, @time_of_exhibition, @description, @id]
  results = SqlRunner.run(sql, values)
end

def artist
  artist = Artist.find(@artist_id)
  return artist
end

def category
  category = Category.find(@category_id)
  return category
end

def self.find_by_artist_id (id)
  sql = "SELECT * FROM exhibitions WHERE artist_id = $1"
  values = [id]
  exhibitions = SqlRunner.run(sql, values)
  return exhibitions.map {|exhibition|Exhibition.new (exhibition)}
end

end
