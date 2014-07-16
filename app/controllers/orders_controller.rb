class OrdersController < ApplicationController
  before_action :find_member,:only=>[:new,:create]

  def new
    @order=@member.orders.new
  end

  def create
    @order=@member.orders.new
    if @order.save
      redirect_to member_path(@member)
    else
      render :new
    end
  end

  private

  def find_member
    @member=Member.find(params[:member_id])
  end
end
