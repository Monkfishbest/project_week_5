require_relative('../models/members')
require_relative('../models/exercise_class')

require('pry-byebug')

Member.delete_all
ExerciseClass.delete_all

member1 = Member.new({
  'first_name' => 'Zyzz',
  'last_name' => 'Shavershian'
})

member1.save()

member2 = Member.new({
  'first_name' => 'Arnold',
  'last_name' => 'Schwarzenegger'
})

member2.save()

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


binding.pry
nil
