class AddOtherInterestToCustomersTable < ActiveRecord::Migration
  def change
    add_column :customers, :other_interest, :string
  end
end
