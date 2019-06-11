require_relative('../db/sql_runner')

class BookingInfo

  attr_reader(:id, :exercise_class_id, :member_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @exercise_class_id = options['exercise_class_id'].to_i
    @member_id = options['member_id'].to_i
  end

  # ~Thease methods allow for full C-R-U-D functionailty~

  # ~Instance Methods~

    def save()
      sql = "INSERT INTO booking_infos
      (
        exercise_class_id,
        member_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@exercise_class_id, @member_id]
      results = SqlRunner.run(sql, values)
      @id = results.first['id'].to_i
    end

# This method is redudent? possibily.
    def delete
      sql = "DELETE FROM booking_infos WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def update
      sql = "UPDATE booking_infos
      SET(
      exercise_class_id,
      member_id
      ) = (
      $1, $2
      )
      WHERE id = $3"
      values = [@exercise_class_id, @member_id, @id]
      SqlRunner.run( sql, values)
    end

  def member
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first)
  end

  def gym_class
    sql = "SELECT * FROM exercise_classes WHERE id = $1"
    values = [@exercise_class_id]
    results = SqlRunner.run(sql, values)
    return ExerciseClass.new(results.first)
  end

   # ~Class Methods~

    def self.all
      sql = "SELECT * FROM booking_infos"
      results = SqlRunner.run(sql)
      return results.map{ |booking_info_hash| BookingInfo.new(booking_info_hash)}
    end

    def self.remove(id)
      sql = "DELETE FROM booking_infos WHERE id = $1"
      values = [id]
      SqlRunner.run(sql, values)
    end

    def self.find(id)
      sql = "SELECT * FROM booking_infos WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values)
      return Bookinginfo.new(result.first)
  end

  def self.delete_all
    sql = "DELETE FROM booking_infos"
    sql = SqlRunner.run(sql)
  end
end
