class EmployeesController < ApplicationController
  
  def index 
    @employees = Employee.all 
    @new_employee = Employee.new
  end
  
  def new
    @employee = Employee.new 
  end
  
  
  def show
    @employee = Employee.find_by_id( params[:id]  ) 
  end

  def create  
    @employee = Employee.new(params[:employee])  
    if @employee.save  
      puts "Yeah saved!"
      flash[:notice] = "Successfully created user."  
      if params[:employee][:photo].blank?  
        redirect_to @employee  
      else  
        render :action => 'crop'  
      end  
    else  
      puts "Save is failing"
      render :action => 'new'  
    end  
  end
  
  
  def update  
    @employee = Employee.find(params[:id])  
    if @employee.update_attributes(params[:employee])  
      flash[:notice] = "Successfully updated user."  
      if params[:employee][:photo].blank?  
        puts "BOOM BOOM employee photo is blank"
        redirect_to @employee  
      else  
        puts "Gonna render crop"
        render :action => 'crop'  
      end  
    else  
      puts "gonna play with edit"
      render :action => 'edit'  
    end  
  end

  
end
