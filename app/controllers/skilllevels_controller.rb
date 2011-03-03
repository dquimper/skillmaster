class SkilllevelsController < ApplicationController
  # GET /skilllevels
  # GET /skilllevels.xml

  def index
    @employee = Employee.find(:first)
    redirect_to skilllevel_path(@employee)
  end

  def show
    @employees = Employee.find(:all)
    @employee = Employee.find(params[:id])
    @technos = Technology.find(:all)
    @skills = @employee.skilllevels

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  def update
    @employee = Employee.find(params[:employee_id])
    logger.debug @employee.inspect
    respond_to do |format|
      if @employee
        @employee.skilllevels.destroy_all
        logger.debug params[:skilllevels]
        params[:skilllevels].each do |id, skills|
          logger.debug id
          logger.debug skills
          if not skills[:title].blank? and not skills[:years_exp].blank?
            Skilllevel.create(:employee_id => @employee.id, :technology_id => id, :title => skills[:title], :years_exp => skills[:years_exp])
          end
        end
        format.html { redirect_to(skilllevel_path(@employee), :notice => 'Employee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end
end
