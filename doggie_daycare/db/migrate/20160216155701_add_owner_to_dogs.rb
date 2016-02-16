class AddOwnerToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :owner, :string
  end
end
