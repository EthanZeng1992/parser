class Parser

  require 'csv'
  attr_reader :csv

  @@user_shift   = 0
  @@course_shift = 5

  User   = Struct.new(:studentid, :name, :idnumber, :courses)
  Course = Struct.new(:number,    :name, :score)

  #-----------------------------------------------------------------------------------
  def initialize(csv)
    @csv = CSV.open("#{csv}") 
    2.times { @csv.shift }
  end

  #-----------------------------------------------------------------------------------
  def user 
    user = nil
    csv.each do |row|
      break if row[0] == nil 
      user = User.new(row[1], row[7], row[11], courses)
      @@user_shift.times { csv.shift }
      break
    end
    user
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
