class Parser

  require 'csv'
  attr_reader :csv

  @@user_shift   = 0
  @@course_shift = 4

  User   = Struct.new(:studentid, :name, :idnumber, :organizations, :courses)
  Course = Struct.new(:number,    :name, :score)
  Organization = Struct.new(:name, :description) 

  def initialize(csv)
    @csv = CSV.open("#{csv}") 
    2.times { @csv.shift }
  end

  def user 
    account_user = nil
    csv.each do |row|
      break if row[0] == nil 
      account_user = User.new(row[1], row[7], row[11], organizations, courses)
      @@user_shift.times { csv.shift }
      break
    end
    account_user 
  end
  
  def courses 
    account_courses = Array.new
    @@course_shift.times { csv.shift  }
    csv.each do |row|
      break if row[0] == '汇总'
      account_courses << Course.new(row[6], row[7], row[13])
    end
    @@user_shift = 5 
    account_courses
  end

  def organizations 
    account_organizations = Array.new 
    csv.each do |row|
      account_organizations << Organization.new(row[1])
      account_organizations << Organization.new(row[7], row[11])
      break
    end
    account_organizations
  end
end
