class AddUserReferenceToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :user
  end
end
