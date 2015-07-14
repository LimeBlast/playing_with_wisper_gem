class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title
      t.text :who
      t.text :action
      t.text :baggage
      t.text :important
      t.text :plan

      t.timestamps null: false
    end
  end
end
