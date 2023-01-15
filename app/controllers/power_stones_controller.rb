class PowerStonesController < ApplicationController
  before_action :set_power_stone, only: %i[ show edit update destroy ]

  # GET /power_stones or /power_stones.json
  def index
    @power_stones = PowerStone.all
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

    respond_to do |format|
      if @power_stone.save
        format.html { redirect_to power_stone_url(@power_stone), notice: "Power stone was successfully created." }
        format.json { render :show, status: :created, location: @power_stone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @power_stone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /power_stones/1 or /power_stones/1.json
  def update
    respond_to do |format|
      if @power_stone.update(power_stone_params)
        format.html { redirect_to power_stone_url(@power_stone), notice: "Power stone was successfully updated." }
        format.json { render :show, status: :ok, location: @power_stone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @power_stone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /power_stones/1 or /power_stones/1.json
  def destroy
    @power_stone.destroy

    respond_to do |format|
      format.html { redirect_to power_stones_url, notice: "Power stone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power_stone
      @power_stone = PowerStone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def power_stone_params
      params.require(:power_stone).permit(:name, :overview, category_ids: [])
    end
end
