require_relative '../../db/config'

class Student < ActiveRecord::Base
  belongs_to :teacher
end
# implement your Student model here
