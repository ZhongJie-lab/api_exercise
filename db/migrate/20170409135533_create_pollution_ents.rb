class CreatePollutionEnts < ActiveRecord::Migration[5.0]
  def change
    create_table :pollution_ents do |t|
      t.string :ent_code
      t.string :ent_name
      t.string :lon
      t.string :lat
      t.string :gas_st_nums
      t.string :water_st_nums
      t.timestamps
    end
  end
end
