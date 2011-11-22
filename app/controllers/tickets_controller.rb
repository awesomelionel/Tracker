class TicketsController < ApplicationController
  before_filter :find_project
  before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
  end

  private
  def find_project
    @project = Project.find_by_id(params[:project_id])
    if !@project
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to projects_path
    end
  end

  def find_ticket
    @ticket = @project.tickets.find_by_id(params[:id])
    if !@ticket
      flash[:alert] = "The ticket you were looking for could not be found."
      redirect_to project_path(@project)
    end
  end
end
