class SkillsController < ApplicationController

  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  before_filter :get_member, except: :index

  def index
  end

  def show
  end

  def new
    @skill = Skill.new
    respond_with @skill
  end

  def create
    @skill = @member.skills.build(params[:skill])

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @member, notice: "Saved new skill for #{@member.name}" }
        format.json { render json: @skill, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @skill = @member.skills.find(params[:id])
    respond_with @skill
  end

  def update
    @skill = @member.skills.find(params[:id])

    respond_to do |format|
      if @skill.update_attributes(params[:skill])
        format.html { redirect_to @member, notice: "Updated new skill for #{@member.name}" }
        format.json { render json: @skill, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill = @member.skills.find(params[:id])
    @skill.destroy

    redirect_to @member, notice: "Removed skill for #{@member.name}"
  end

  private

  def get_member
    @member = Member.find(params[:member_id])
  end
end
