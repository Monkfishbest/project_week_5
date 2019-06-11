require_relative('../models/members')
require_relative('../models/exercise_class')
require_relative('../models/booking_info')

require('pry-byebug'
)
ExerciseClass.delete_all
Member.delete_all


member1 = Member.new({
  'first_name' => 'Zyzz',
  'last_name' => 'Shavershian'
})

member1.save

member2 = Member.new({
  'first_name' => 'Arnold',
  'last_name' => 'Schwarzenegger'
})

member2.save

exercise_class1 = ExerciseClass.new({
  'class_name' => 'Heavy lifting for single mothers',
  'when_class' => '10/06/2019 at 10:00'
})

exercise_class1.save

exercise_class2 = ExerciseClass.new({
  'class_name' => 'Barbell training for toddlers',
  'when_class' => '11/06/2019 at 11:00'
})

exercise_class2.save

booking_info1 = BookingInfo.new({
  'exercise_class_id' => exercise_class1.id,
  'member_id' => member1.id
})

booking_info1.save

booking_info2 = BookingInfo.new({
  'exercise_class_id' => exercise_class2.id,
  'member_id' => member1.id
})

booking_info2.save

binding.pry
nil
