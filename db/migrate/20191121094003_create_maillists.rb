class CreateMaillists < ActiveRecord::Migration[6.0]
  def change
    create_table :maillists do |t|
      t.string :email

      t.timestamps
    end
  end
end
