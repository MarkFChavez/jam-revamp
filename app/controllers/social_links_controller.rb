class SocialLinksController < ApplicationController

  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  before_filter :get_member, except: :index

  def index
  end

  def show
  end

  def new
    @social_link = SocialLink.new
    respond_with @social_link
  end

  def create
    @social_link = @member.social_links.build(params[:social_link])

    respond_to do |format|
      if @social_link.save
        format.html { redirect_to @member, notice: "Saved new social info for #{@member.name}" }
        format.json { render json: @social_link, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @social_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @social_link = @member.social_links.find(params[:id])
    respond_with @social_link
  end

  def update
    @social_link = @member.social_links.find(params[:id])

    respond_to do |format|
      if @social_link.update_attributes(params[:social_link])
        format.html { redirect_to @member, notice: "Updated social info for #{@member.name}" }
        format.json { render json: @social_link, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @social_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @social_link = @member.social_links.find(params[:id])
    @social_link.destroy

    redirect_to @member, notice: "Removed social link for #{@member.name}"
  end

  private 

  def get_member
    @member = Member.find(params[:member_id])
  end
end
