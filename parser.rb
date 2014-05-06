class Parser

  require 'csv'
  attr_reader :csv

  @@users = [] 
  @@user_shift   = 0
  @@course_shift = 5

  User   = Struct.new(:studentid, :name, :idnumber, :courses)
  Course = Struct.new(:number,    :name, :score)

  #-----------------------------------------------------------------------------------
  def initialize(csv)
    @csv = CSV.open("#{csv}") 
  end

  #-----------------------------------------------------------------------------------
   def users 
     2.times { csv.shift }
     csv.each do |row|
       break if row[0] == nil 
       @@users << User.new(row[1], row[7], row[11], courses)
       @@user_shift.times { csv.shift }
     end
     @@users
   end
  
  #-----------------------------------------------------------------------------------
  def courses 
    courses = Array.new
    @@course_shift.times { csv.shift  }
    csv.each do |row|
      break if row[0] == '汇总'
      courses << Course.new(row[6], row[7], row[13])
    end
    @@user_shift = 5 
    courses
  end
end
