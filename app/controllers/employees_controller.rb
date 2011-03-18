class EmployeesController < ApplicationController
  
  def index 
    
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
      flash[:notice] = "Successfully created user."  
      if params[:employee][:photo].blank?  
        redirect_to @employee  
      else  
        render :action => 'crop'  
      end  
    else  
      render :action => 'new'  
    end  
  end
  
  
  def update  
    @employee = Employee.find(params[:id])  
    if @employee.update_attributes(params[:user])  
      flash[:notice] = "Successfully updated user."  
      if params[:employee][:photo].blank?  
        redirect_to @employee  
      else  
        render :action => 'crop'  
      end  
    else  
      render :action => 'edit'  
    end  
  end

  
end
