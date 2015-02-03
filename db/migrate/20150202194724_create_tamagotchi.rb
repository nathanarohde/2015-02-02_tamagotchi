class CreateTamagotchi < ActiveRecord::Migration
  def change
    create_table(:tamagotchis) do |t|
      t.column(:name, :string)
      t.column(:activity_level, :int)
      t.column(:food_level, :int)
      t.column(:sleep_level, :int)
      t.column(:alive, :boolean)

      t.timestamps
    end
  end
end
