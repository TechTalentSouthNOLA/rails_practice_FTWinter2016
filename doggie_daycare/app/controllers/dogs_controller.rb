class DogsController < ApplicationController

  def show
    @dog = Dog.find(params[:id])
  end

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to dogs_url, notice: "Dog saved!"
    else
      flash.now[:notice] = "Could not save dog. :("
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])

    if @dog.update(dog_params)
      flash[:notice] = "Dog updated!"
      redirect_to dog_url(@dog)
    else
      flash.now[:notice] = "Could not update dog :("
      render :edit
    end
  end

  private

  # White-listing only the parameters we allow people to set
  # Don't trust parameter from the scary internet!
  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end
end
