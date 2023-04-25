# == Schema Information
#
# Table name: account_rating_details
#
#  id                  :bigint           not null, primary key
#  five_star_count     :integer
#  four_star_count     :integer
#  one_star_count      :integer
#  three_star_count    :integer
#  total_ratings       :integer
#  total_ratings_score :float
#  two_star_count      :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  account_id          :bigint           not null
#
# Indexes
#
#  index_account_rating_details_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "test_helper"

class AccountRatingDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
