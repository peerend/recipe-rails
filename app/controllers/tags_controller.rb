class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @tag = Tag.new
    render('tags/new.html.erb')
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "Your tag was added!"
      redirect_to("/")
    else
      render('tags/new.html.erb')
    end
  end

  def show
    @tag = Tag.find(params[:id])
    render('tags/show.html.erb')
  end
end
