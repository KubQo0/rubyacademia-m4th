class CreateTranslations < ActiveRecord::Migration[7.2]
  def change
    create_table :translations do |t|
      t.string :key
      t.string :value
      t.integer :locale

      t.references :translatable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
