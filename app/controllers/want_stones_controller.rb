class WantStonesController < ApplicationController
  
  def create
    power_stone = PowerStone.find(params[:power_stone_id])
    current_user.want_stone(power_stone)
    redirect_back fallback_location: root_path, success: '欲しい石リストに追加しました'
  end

  def destroy
    power_stone = current_user.want_stones.find_by(params[:id]).power_stone
    current_user.unwant_stone(power_stone)
    redirect_back fallback_location: root_path, success: '欲しい石リストから削除しました'
  end
end
