# parser

**parser** is a class to parse user information from csv file.
It use ruby class **[csv](http://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV.html)**.

This class provides a complete interface to CSV files and data. It offers tools to enable you to read and write to and from Strings or IO objects, as needed.

## Usage:

```ruby
require "parser"
csv = Parser.new("path/to/file.csv")

# get users information
users = csv.users

# return structure like :
{
  users: [

    { studentid: '1', name: 'user-1', idnumber: '1',
      courses: [
        { number: '1', name: 'course-1', score: '90' } 
        { number: '2', name: 'course-2', score: '80' } 
        { number: '3', name: 'course-3', score: '70' } 

        ...
      ]
    }

    { studentid: '2', name: 'user-2', idnumber: '2',
      courses: [
        { number: '1', name: 'course-1', score: '90' } 
        { number: '2', name: 'course-2', score: '80' } 
        { number: '3', name: 'course-3', score: '70' } 

        ...
      ]
    }

    ...
  ]
}

# put user datas to database 
csv = Parser.new("path/to/file.csv")
users = csv.users

users.each do |user|
  @user = User.create(
    studentid: user.studentid,
    name:      user.name,
    idnumber:  user.idnumber
  )
  
  user.courses.each do |course|
    Course.create(
      number:  course.number,
      name:    course.name,
      score:   course.score,
      user_id: @user.id
    )
  end
end
```
