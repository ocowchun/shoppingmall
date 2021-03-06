class MembersController < ApplicationController

  def index
    @members=Member.all
  end

  def show
    find_member
    @orders=@member.orders
  end

  def new
    @member=Member.new
  end

  def create
    @member=Member.new(member_params)

    if @member.save
      redirect_to members_path
    else
      render :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name,:last_name)
  end

  def find_member
    @member=Member.find(params[:id])
  end
end
