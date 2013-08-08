module PicksHelper

  def picked_result?(picks, match_id, result)
    picks.select do |pick|
      pick.match_id == match_id && pick.selected_result == result
    end.any?
  end
end
