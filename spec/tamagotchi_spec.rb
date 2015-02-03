require'spec_helper'

describe Tamagotchi do
  describe '#initialize' do
    it 'tests to see if initialize passes in correct values to begin with' do
      my_pet = Tamagotchi.create({:name =>'lil dragon'})
      expect(my_pet.name()).to(eq('lil dragon'))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe '#time_passes' do
    it 'decreases the amount of food the Tamagotchi has left by 1' do
      my_pet = Tamagotchi.create({:name =>'lil dragon'})
      my_pet.time_passes
      expect(my_pet.food_level).to(eq(9))
      expect(my_pet.sleep_level).to(eq(9))
      expect(my_pet.activity_level).to(eq(9))
    end
  end

  describe '#is_alive' do
    it('is alive if the food level is above 0') do
      my_pet = Tamagotchi.create({:name =>'lil dragon'})
      expect(my_pet.is_alive).to(eq(true))
    end

    it('is dead if the food level is 0') do
      my_pet = Tamagotchi.create(:name =>'lil dragon')
      my_pet.set_food_level(0)
      expect(my_pet.is_alive).to(eq(false))
    end

    it('is dead if the food level is 0') do
      my_pet = Tamagotchi.create(:name =>'lil dragon')
      my_pet.set_activity_level(0)
      expect(my_pet.is_alive).to(eq(false))
    end

    it('is dead if the food level is 0') do
      my_pet = Tamagotchi.create(:name =>'lil dragon')
      my_pet.set_sleep_level(0)
      expect(my_pet.is_alive).to(eq(false))
    end
  end

end
