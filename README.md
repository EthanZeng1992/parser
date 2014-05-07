# parser

**parser** is a class to parse user information from csv file.
It use ruby class **[csv](http://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV.html)**.

This class provides a complete interface to CSV files and data. It offers tools to enable you to read and write to and from Strings or IO objects, as needed.

## Usage

```ruby
require "parser"
csv = Parser.new("path/to/file.csv")

# get user information
user = csv.user

# return structure like :
user: { 
  studentid: '1', name: 'user-1', idnumber: '1',
  organizations: [
    { name: '2012春法学本城中', description: '' } 
    { name: '法学', description: '090901203010100' } 
  ],
  courses: [
    { number: '1', name: 'course-1', score: '90' } 
    { number: '2', name: 'course-2', score: '80' } 
    { number: '3', name: 'course-3', score: '70' } 

    ...
  ]
}


# put user datas to database 
@csv = Parser.new("path/to/file.csv")
@user = @csv.user

begin 
  user = User.create(
    studentid: @user.studentid,
    name:      @user.name,
    idnumber:  @user.idnumber
  )

  @user.organizations.each do |organization|
    Organization.create(
      name:        organization.name,
      description: organization.description,
      user_id:     user.id
    )
  end

  @user.courses.each do |course|
    Course.create(
      number:  course.number,
      name:    course.name,
      score:   course.score,
      user_id: user.id
    )
  end
  @user = @csv.user
end while @user != nil
```

## xls2csv 

Convert excel to csv

```ruby
gem install roo 

change "path_to_xls" and "path_to_save_csv" in xls2csv.sh to your own file path.

chmod +x xls2csv.sh
./xls2csv.sh
```
