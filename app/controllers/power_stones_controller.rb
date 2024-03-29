class PowerStonesController < ApplicationController
  before_action :set_power_stone, only: %i[ edit update destroy show have_stones want_stones]
  before_action :move_to_root, only: %i[ new update destroy edit] 
  before_action :authenticate_admin!, only: %i[ new update destroy edit ] 
  # GET /power_stones or /power_stones.json
  def index
    #@power_stones = PowerStone.all
    @power_stones = PowerStone.all.includes([:have_stones])
  end

  # GET /power_stones/1 or /power_stones/1.json
  def show
  end

  # GET /power_stones/new
  def new
    @power_stone = PowerStone.new
  end

  # GET /power_stones/1/edit
  def edit
  end

  # POST /power_stones or /power_stones.json
  def create
    @power_stone = PowerStone.new(power_stone_params)
    if @power_stone.save
      redirect_to power_stone_url(@power_stone), notice: "Power stone was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /power_stones/1 or /power_stones/1.json
  def update
    if @power_stone.update(power_stone_params)
      redirect_to power_stone_url(@power_stone), notice: "Power stone was successfully updated." 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /power_stones/1 or /power_stones/1.json
  def destroy
    @power_stone.destroy
    redirect_to power_stones_url, notice: "Power stone was successfully destroyed." 
  end

  def have_stones
    @have_stone_power_stones = current_user.have_stone_power_stones.includes(:user).order(created_at: :desc)
  end

  def want_stones
    @want_stone_power_stones = current_user.want_stone_power_stones.includes(:user).order(created_at: :desc)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power_stone
      @power_stone = PowerStone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def power_stone_params
      params.require(:power_stone).permit(:name, :overview, :power_stone_image,  :power_stone_image_cache, category_ids: [])
    end

    def move_to_root
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
