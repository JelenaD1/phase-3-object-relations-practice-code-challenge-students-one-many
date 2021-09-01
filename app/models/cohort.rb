class Cohort < ActiveRecord::Base
    has_many :students

    def add_student(name, age)
        Student.create(name: name, age: age, cohort: self)
    end

    def average_age
        students.average(:age).to_f
    end 

    def total_students
        students.counts 
    end

    def self.biggest
        most_students = all.map{ |cohort| cohort.total_students}.max
        all.find{|cohort| cohort.total_students == most_students}

    end 

    def self.sort_by_mod
        order(:current_mod)
    end 
  
end