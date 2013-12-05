class PledgesController < ApplicationController
  before_filter :load_project

  def show
  	@pledge = Pledge.find(params[:id])
  end

  def create
  	@pledge = @project.pledges.build(pledge_params)
  	@pledge.user_id = current_user.id
  
    respond_to do |format|
  	  if @pledge.save
  	   	format.html { redirect_to project_path(@project.id), notice: 'Pledged!' }
        format.js {}
  	  else
  	   	format.html { render :action => :show }
        format.js {}
  	  end
    end
  end

  private
  def load_project
  	@project = Project.find(params[:project_id])
  end

  def pledge_params
  	params.require(:pledge).permit(:amount, :project_id)
  end
end
