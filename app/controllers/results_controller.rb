class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_result
      @result = Result.find(params[:id])
    end

    def result_params
        params.require(:saved_search).permit(:flight_date_time, :saved_search_id, :flight_cost)
    end
end
