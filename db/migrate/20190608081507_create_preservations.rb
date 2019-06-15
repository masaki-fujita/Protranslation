class CreatePreservations < ActiveRecord::Migration[5.2]
  def change
    create_table :preservations do |t|
      t.string :title
      t.string :content_sentence
      t.string :content_signals
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
