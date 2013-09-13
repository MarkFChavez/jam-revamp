class MembersController < ApplicationController

  before_filter :authenticate_user!
  respond_to :html, :xml, :json

  def index
    @members = Member.all
    respond_with @members
  end

  def show
    @member = Member.find(params[:id])
    @today = Time.now.strftime("%b %d, %Y")
    respond_with @member
  end

  def new
    @member = Member.new
    respond_with @member
  end

  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path, notice: "Saved new member." }
        format.json { render json: @member, status: :ok}
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @member = Member.find(params[:id])
    respond_with @member
  end

  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to members_path, notice:"Updated #{@member.name}" }
        format.json { render json: @member, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @member, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to members_path, notice:"Removed member"
  end

  def overview
  end
end
