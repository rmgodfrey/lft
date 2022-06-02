class AddTimezoneToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :timezone, :string
  end
end
