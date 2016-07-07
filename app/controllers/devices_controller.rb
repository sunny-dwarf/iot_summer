class DevicesController < ApplicationController
  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
    @house = House.find(params[:house_id])


  end

  def create
    @house = House.find(params[:house_id])
    @device = Device.new(user_params)
    @device.house_id = @house.id
    @device.save
    redirect_to house_path(@house.id)
  end

  def show
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(user_params)
      redirect_to house_path
    else
      render 'edit'
    end
  end

  def edit
    @device = House.find(params[:id])
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to house_path
  end

  private
  def user_params
    params.require(:device).permit!
  end
end
