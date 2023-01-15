class DiagnosesController < ApplicationController
  def index
    power_stones = PowerStone.all
    selected_category_ids = params[:answer]
    @match_category_count = 0
    tmp_match_category_count = 0
    @matched_power_stones = []

    power_stones.each do |power_stone|
      tmp_match_category_count = 0
      power_stone.categories.each do |category|
        if selected_category_ids&.include?(category.id.to_s)
          tmp_match_category_count = tmp_match_category_count + 1 
        end
      end

      if @match_category_count < tmp_match_category_count
         @matched_power_stones = []
         @matched_power_stones << power_stone
         @match_category_count = tmp_match_category_count
      elsif @match_category_count == tmp_match_category_count
        @matched_power_stones << power_stone
      end
    end
  end
end
