class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    render('entries/index.html.erb')
  end

  def search
    @entries = Entry.all
    render('entries/searched.html.erb')
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

  def edit
    @entry = Entry.find(params[:id])
    @tags = Tag.all
    @checked = Tag.all.map do |tag|
      if tag.entries.include?(@entry)
        "checked"
      else
        ""
      end
    end
    render('entries/edit.html.erb')
  end

  def update
    @entry =Entry.find(params[:id])
    if @entry.update(params[:entry])
      @entry.add_tag(params)
      flash[:notice] = "Your recipe was updated!"
      redirect_to("/#{@entry.id}")
    else
      render('entries/edit.html.erb')
    end
  end

  def sort
    @smart_sort = Entry.smart_sort
    render('entries/sort.html.erb')
  end


end
