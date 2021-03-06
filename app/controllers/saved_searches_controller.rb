class SavedSearchesController < ApplicationController
  before_action :set_saved_search, only: [:show, :edit, :update, :destroy]

  def index
    @saved_search = SavedSearch.new
    @saved_searches = SavedSearch.paginate(:page => params[:saved_searches_page], :per_page => 5)
    @results = Result.paginate(:page => params[:results_page], :per_page => 5)
  end

  def new
    @saved_search = SavedSearch.new
  end


  def create
    @saved_search = SavedSearch.new(saved_search_params)
    respond_to do |format|
      if @saved_search.save
        format.html { redirect_to action: "index", notice: 'Saved search was successfully created.' }
      else
        @saved_searches = SavedSearch.paginate(:page => params[:saved_searches_page], :per_page => 5)
        @results = Result.paginate(:page => params[:results_page], :per_page => 5)
        flash.now[:error] = 'Failed to add seach'
        render action: 'index'
      end
    end
  end

  def destroy
    @saved_search.destroy
    respond_to do |format|
      format.html { redirect_to saved_searches_url, notice: 'Saved search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_saved_search
      @saved_search = SavedSearch.find(params[:id])
    end

    def saved_search_params
      params.require(:saved_search).permit(:date1, :date2, :start, :end, :flight_type, :flight_class, :price_max, :price_min, :duration, :adult_count, :children_count, :infants_on_seat_count, :infants_in_lap_count)
    end
end
