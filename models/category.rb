require_relative( "../db/sqlrunner.rb" )

class Category

attr_reader :id, :type

  def initialize(details)
    @id = details['id'].to_i
    @type = details['type']
  end

  def save
    sql = "INSERT INTO categories
    (
      type
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results.first['id']
  end

  def self.find( id )
    sql = "SELECT * FROM categories
    WHERE id = $1"
    values = [id]
    category = SqlRunner.run( sql, values )
    result = Category.new( category.first )
    return result
  end

  def self.all
    sql = "SELECT * FROM categories"
    results = SqlRunner.run(sql)
    return results.map {|category|Category.new(category)}
  end

end
