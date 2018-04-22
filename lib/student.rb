require 'pry'
class Student
attr_accessor :name, :grade
attr_reader :id

def initialize(name, grade, id=nil)
  @id = id
  @name = name
  @grade = grade
end

def self.create_table
  sql =  <<-SQL
    CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade INTEGER
    )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql =  "DROP TABLE students"
    DB[:conn].execute(sql)
  end

  def save
    sql = "INSERT INTO students (name, grade) VALUES (?, ?)"
     #binding.pry
     DB[:conn].execute(sql, self.name, self.grade)
   end


end
