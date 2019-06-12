require_relative('../db/sql_runner')

class ExerciseClass

  attr_reader(:id)
  attr_accessor(:class_name, :date_class, :time_class)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_name = options['class_name']
    @date_class = options['date_class']
    @time_class = options['time_class']
  end
  # ~Thease methods allow for full C-R-U-D functionailty~

  # ~Instance Methods~

    def save()
      sql = "INSERT INTO exercise_classes
      (
        class_name,
        date_class,
        time_class
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@class_name, @date_class, @time_class]
      results = SqlRunner.run(sql, values)
      @id = results.first['id'].to_i
    end

    def delete
      sql = "DELETE FROM exercise_classes WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def update
      sql = "UPDATE exercise_classes
      SET(
      class_name,
      date_class,
      time_class,
      ) = (
      $1, $2, $3,
      )
      WHERE id = $4"
      values = [@class_name, @date_class, @time_class, @id]
      SqlRunner.run( sql, values)
    end

    # ~ This method calls all the members that a class currently has enrolled ~
      def members
        sql = "SELECT members.* FROM members INNER JOIN booking_infos ON members.id = booking_infos.member_id WHERE exercise_class_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map {|member| Member.new(member)}
      end
   # ~Class Methods~

    def self.all
      sql = "SELECT * FROM exercise_classes"
      results = SqlRunner.run(sql)
      return results.map{ |exercise_class_hash| ExerciseClass.new(exercise_class_hash)}
    end

    def self.find(id)
      sql = "SELECT * FROM exercise_classes WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values)
      return ExerciseClass.new(result.first)
  end

  def self.delete_all
    sql = "DELETE FROM exercise_classes"
    sql = SqlRunner.run(sql)
  end
end
