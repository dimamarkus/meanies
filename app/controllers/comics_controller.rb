class ComicsController < ApplicationController

  before_filter :signed_in_user, only: [:new, :index, :edit, :update] 

  def index
    @comics = Comic.all
  end

  def archive
    @comics = Comic.all
  end

  def view
    @comic = Comic.find_by_number(params[:number])
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
      redirect_to comics_path, notice: 'Comic was successfully created.' 
    else 
      render 'new'
    end
  end


  def update
    @comic = Comic.find(params[:id])
    if @comic.update_attributes(params[:comic])
      redirect_to @comic , notice: 'Comic was successfully updated.' 
    else
      render 'edit'
    end
  end


  def destroy
    @comic = Comic.find(params[:id])
    @comic.move_to_number(nil)
    @comic.destroy

    redirect_to comics_path
  end

  def feed
	  # this will be the name of the feed displayed on the feed reader
	  @title = "March of the Meanies"
	
	  # the news items
	  @comics = Comic.order("updated_at desc")
	
	  # this will be our Feed's update timestamp
	  @updated = @comics.first.updated_at unless @comics.empty?
	 	  
	  respond_to do |format|
	    format.atom { render :layout => false }
	
	    # we want the RSS feed to redirect permanently to the ATOM feed
	    format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
	  end
  end

  private
 
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end


end
