class RemoveOwnerFromDogs < ActiveRecord::Migration
  def change
    remove_column :dogs, :owner, :string
  end
end
