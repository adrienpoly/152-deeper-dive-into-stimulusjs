class CountiesController < ApplicationController
  def index
    state = State.find(params[:state_id])
    counties = state.counties
    render json: counties.select_collection
  end
end