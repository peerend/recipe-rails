class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    render('entries/index.html.erb')
  end

  def new
    @entry = Entry.new
    @tags = Tag.all
    render('entries/new.html.erb')
  end

  def create
    @entries = Entry.all
    @entry = Entry.new(params[:entry])
    if @entry.save
      @entry.add_tag(params)
      flash[:notice] = "Your recipe was added!"
      redirect_to("/")
    else
      render('entries/new.html.erb')
    end
  end

  def show
    @rating = Rating.new
    @entry = Entry.find(params[:id])
    render('entries/show.html.erb')
  end
end
