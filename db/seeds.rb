

DEPARTMENT.each do | key , value |
  Department.create :id => key, :name => value
end

DIVISION.each do | department_id , division_names| 
  for division_name in division_names
    Division.create :name => division_name, :department_id => department_id
  end
end

POSITION.each do | salary_category, positions |
  for position in positions
    Position.create :salary_category => salary_category, :title => position
  end
end

# POSITION.each do | |



# t.integer :department
# # an employee belongs to many departments
# # example: ComDev, Exploration, General Affair
# # question : How can we capture the high level position? 
# # => 1. Site Manager
# # => 2. KTT
# # => 3. Deputy GM
# # => 4. GM  
# # => => Solution: he is his own department?  not the problem for now
# t.integer :category
# # 1 = Crew operator
# # 2 = Foreman / Staff / Kepala Regu
# # 3 = Supervisor / 
# # 4 = SuperIntendent
# # 5 = Deputy GM  / Manager
# # 6 = GM