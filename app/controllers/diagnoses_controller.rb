class DiagnosesController < ApplicationController
before_action :set_power_stone, only: %i[ index ]
before_action :set_checkdata, only: %i[ index ]
  def index
    if @selected_category_ids == nil
      redirect_to diagnoses_new_path, alert: '「 1つ以上チェックが必要です 」'
    else
      @power_stones.each do |power_stone|
        tmp_match_category_count = 0
        power_stone.categories.each do |category|
          if @selected_category_ids&.include?(category.id.to_s)
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

  private
    def set_power_stone
      @power_stones = PowerStone.all
    end

    def set_checkdata
      @selected_category_ids = params[:answer]
      @match_category_count = 0
      @tmp_match_category_count = 0
      @matched_power_stones = []
    end
  
end