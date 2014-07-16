
class Ranking

  RANKING_UPDATE_LOCK = 'ranking_update_lock'
  RANKING_KEY = 'ranking_hash'
  SCORES = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]

  def self.update_with_ranking(ranking)
    $redis.lock_for_update(RANKING_UPDATE_LOCK) do
      current = $redis.hmget RANKING_KEY, *(1..ranking.count).to_a
      new_values = {}
      ranking.each_with_index do |car, i|
        new_values[car] = current[car-1].to_i + SCORES[i]
      end
      $redis.hmset RANKING_KEY, *new_values.map { |k, v| [k, v] }.to_a
    end
  end

  def self.get_ranking
    $redis.hgetall RANKING_KEY
  end

end