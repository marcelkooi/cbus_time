class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    params[:trip][:start_time] = Time.now
    @trips = Trip.all
    @trip = Trip.create(trip_params)
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trips = Trip.all
    @trip = Trip.find(params[:id])
    params[:trip][:end_time] = Time.now if params[:trip][:end_time].blank?
    @trip.update_attributes(trip_params)
  end

  def delete
    @trip = Trip.find(params[:trip_id])
  end

  def notes
    @trip = Trip.find(params[:trip_id])
  end

  def destroy
    @trips = Trip.all
    @trip = Trip.find(params[:id])
    @trip.destroy
  end

private
  def trip_params
    params.require(:trip).permit(:commute, :start_time, :start_location, :end_time, :end_location, :notes)
  end

end