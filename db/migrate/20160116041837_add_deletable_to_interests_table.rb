class AddDeletableToInterestsTable < ActiveRecord::Migration
  def change
    add_column :interests, :deletable, :boolean, :default => true, :null => false
  end
end
