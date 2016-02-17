class AddOwnerIdToDogs < ActiveRecord::Migration
  def change
    add_reference :dogs, :owner, index: true, foreign_key: true
  end
end
