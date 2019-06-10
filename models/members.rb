require_relative('../db/sql_runner')

class Member
  attr_reader(:id)
  attr_accessor(:first_name, :last_name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

# ~Thease methods allow for full C-R-U-D functionailty~

# ~Instance Methods~

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def delete
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE members
    SET(
    first_name,
    last_name
    ) = (
    $1, $2
    )
    WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run( sql, values)
  end

# ~ This method calls all the exercise classes that a member has enrolled in ~
  def exercise_classes
    sql = "SELECT exercise_classes.* FROM exercise_classes INNER JOIN booking_infos ON exercise_classes.id = booking_infos.exercise_class_id WHERE member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|exercise_class| ExerciseClass.new(exercise_class)}
  end


 # ~Class Methods~

  def self.all
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map{ |member_hash| Member.new(member_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Member.new(result.first)
end

def self.delete_all
  sql = "DELETE FROM members"
  sql = SqlRunner.run(sql)
end

end
