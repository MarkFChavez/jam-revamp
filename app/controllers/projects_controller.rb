class ProjectsController < ApplicationController

  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  before_filter :get_member, except: :index
  
  def index
  end

  def show
  end

  def new
    @project = Project.new
    @members = Member.all

    respond_with @project
  end

  def create
    @project = @member.projects.build(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @member, notice: "Saved new project for #{@member.name}" }
        format.json { render json: @project, status: :ok }
      else
        format.html { @members = Member.all; render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @project = @member.projects.find(params[:id])
    respond_with @project
  end

  def update
    @project = @member.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @member, notice: "Updated project #{@project.name}" }
        format.json { render json: @project, status: :ok }
      else  
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = @member.projects.find(params[:id])
    @project.destroy

    redirect_to @member, notice: "Removed project"
  end

  private

  def get_member
    @member = Member.find(params[:member_id])
  end

end
