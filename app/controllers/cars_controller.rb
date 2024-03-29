class CarsController < ApplicationController
  def index
    @cars = Car.limit(100)
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car, notice: "Car was successfully created."
    else
      render :new, notice: "Your car could not be saved."
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer_id, :color, :year, :mileage)
  end

end
