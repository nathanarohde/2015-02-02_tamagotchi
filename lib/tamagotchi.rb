class Tamagotchi < ActiveRecord::Base
  before_create(:set_initial_levels)

  def time_passes
    self.food_level -= 1
    self.sleep_level -= 1
    self.activity_level -=1
    self.save
  end

  def is_alive
    if (activity_level > 0) & (food_level > 0) & (sleep_level > 0)
      self.alive = true
    else
      self.alive = false
    end
    self.save
  end

  def set_food_level (food_level)
    self.food_level = food_level
    self.save
  end

  def set_activity_level (activity_level)
    self.activity_level = activity_level
    self.save
  end

  def set_sleep_level (sleep_level)
    self.sleep_level = sleep_level
    self.save
  end

private

  def set_initial_levels

    self.food_level = 10
    self.sleep_level = 10
    self.activity_level = 10
    self.alive = true

  end
end
