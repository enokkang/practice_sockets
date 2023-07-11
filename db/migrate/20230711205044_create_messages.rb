class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :sender
      t.string :receiver
      t.string :body

      t.timestamps
    end
  end
end
