class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    render('entries/index.html.erb')
  end

  def new
    @entry = Entry.new
    render('entries/new.html.erb')
  end

  def create
    @entries = Entry.all
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect_to("/")
    else
      render('entries/new.html.erb')
    end
  end
end
