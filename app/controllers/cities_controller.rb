class CitiesController < ApplicationController
  def index
    state = State.find(params[:state_id])
    county = state.counties.find(params[:county_id])
    cities = county.cities
    render json: cities.select_collection
  end
end