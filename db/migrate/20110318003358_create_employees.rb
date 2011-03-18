class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.integer :department_id  
      # an employee belongs to many departments
      # example: ComDev, Exploration, General Affair
      # question : How can we capture the high level position? 
      # => 1. Site Manager
      # => 2. KTT
      # => 3. Deputy GM
      # => 4. GM  
      # => => Solution: he is his own department?  not the problem for now
      t.integer :category
      # 1 = Crew operator
      # 2 = Foreman / Staff / Kepala Regu
      # 3 = Supervisor / 
      # 4 = SuperIntendent
      # 5 = Deputy GM  / Manager
      # 6 = GM
      
      
      t.integer :nik
      t.string :name
      t.string :sex
      t.string :status
      
      
      t.date :starting_date
      
      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
