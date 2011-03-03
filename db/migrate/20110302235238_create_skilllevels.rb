class CreateSkilllevels < ActiveRecord::Migration
  def self.up
    create_table :skilllevels do |t|
      t.string :title
      t.integer :years_exp
      t.integer :technology_id
      t.integer :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :skilllevels
  end
end
