class ComicsController < ApplicationController

  def index
    @comics = Comic.all
  end

  def archive
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def new
    @comic = Comic.new
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def create
    new_number = params[:comic].delete(:number)
    @comic = Comic.new(params[:comic])
    @comic.number = Comic.count+1
    if @comic.save
      redirect_to comics_url, notice: 'Comic was successfully created.' 
    else 
      render 'new'
    end
  end


  def update
    new_number = params[:comic].delete(:number)
    @comic = Comic.find(params[:id])
    if @comic.update_attributes(params[:comic])
      @comic.move_to_number(new_number)
      redirect_to @comic, notice: 'Comic was successfully updated.' 
    else
      render 'edit'
    end
  end


  def destroy
    @comic = Comic.find(params[:id])
    @comic.move_to_number(nil)
    @comic.destroy

    redirect_to comics_url
  end
end
