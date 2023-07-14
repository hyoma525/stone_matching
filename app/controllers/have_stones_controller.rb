class HaveStonesController < ApplicationController
  def create
    power_stone = PowerStone.find(params[:power_stone_id])
    current_user.have_stone(power_stone)
    redirect_back fallback_location: root_path, notice: '所持リストに追加しました'
  end

  def destroy
    power_stone = current_user.have_stones.find(params[:id]).power_stone
    current_user.unhave_stone(power_stone)
    redirect_back fallback_location: root_path, alert: '所持リストから削除しました'
  end
end
