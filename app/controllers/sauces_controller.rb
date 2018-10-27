class SaucesController < ApplicationController
    http_basic_authenticate_with name: 'dhh', password: 'secret', except: %i[index show]

  def index
    @q = Sauce.ransack(params[:q])
    if params[:q]
      @sauces = @q.result
    else
      @sauces = Sauce.all
    end
  end

  def show
    @sauce = Sauce.find(params[:id])
  end

  def new
    @sauce = Sauce.new
  end

  def edit
    @sauce = Sauce.find(params[:id])
  end

  def create
    @sauce = Sauce.new(sauce_params)

    if @sauce.save
      redirect_to @sauce
    else
      render 'new'
    end
  end

  def update
    @sauce = Sauce.find(params[:id])

    if @sauce.update(sauce_params)
      redirect_to @sauce
    else
      render 'edit'
    end
  end

  def destroy
    @sauce = Sauce.find(params[:id])
    @sauce.destroy

    redirect_to sauces_path
  end

  private

  def sauce_params
    params.require(:sauce).permit(:name, :summary, :heat, :flavor, :rating)
  end
end
