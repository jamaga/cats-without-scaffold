class CatsController < ApplicationController
  #before an action is called, assign the @cat variable
  before_filter :assign_cat, only: [:show, :destroy] #only the show action
 #we only need it for the show and destroy actions

  def index
    @cats = Cat.all
  end

  def show
    #@cat variable is already initialized (in private)
  end

  def new
    ## Get a new empty cat
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cats_url
    else
      render :new
    end
  end


  def search
      #@cats = Cat.where(name: search_term) it will look for the specific name, 
      #query the DB to get all the cats that match name
      search_term = params[:name]

      if search_term != ''
      @cats = Cat.where('name LIKE ?', "%#{search_term}%")
      else
      @cats = []
    end
  #or if search_term == '' || search_term.nil?
  #@cats = []
  #else
  #@cats = Cat.where('name LIKE ?', "%#{search_term}%")



  end

  def destroy
    @cat.destroy
    redirect_to cats_url
  end

  private
  #filterinng bad params from a form

  def cat_params
    params.require(:cat).permit(:name, :birth_date)
  end

  def assign_cat
    @cat = Cat.find(params[:id])
  end

  #DELETE/cats/:id
  
end
