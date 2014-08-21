class RatingsController < ApplicationController

  def create
    @entry = Entry.find(params[:id])
    @rating = @entry.ratings.new(params[:rating])
    if @rating.save
      flash[:notice] = "Your rating was added!"
      redirect_to("/#{@rating.entry_id}")

    else
      render('entries/show.html.erb')
    end
  end
end
