class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :tags do |t|

      t.string :name

      t.timestamps
    end

    create_table :ratings do |t|

      t.belongs_to :entry
      t.integer :rating

      t.timestamps
    end

    create_join_table :entries, :tags do |t|

      t.timestamps
    end
  end
end
