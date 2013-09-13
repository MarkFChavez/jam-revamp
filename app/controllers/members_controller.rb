class MembersController < ApplicationController

  before_filter :authenticate_user!
  respond_to :html, :xml, :json

  def index
    @members = Member.all
    respond_with @members
  end

  def show
    @member = Member.find(params[:id])
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
        format.json { render json: @member}
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
  end

  def destroy
  end
end
