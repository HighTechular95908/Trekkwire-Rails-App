# == Schema Information
#
# Table name: scheduled_tours
#
#  id              :bigint           not null, primary key
#  location        :string
#  scheduled_date  :date
#  scheduled_time  :time
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_user_id :bigint           not null
#  tour_id         :bigint           not null
#
# Indexes
#
#  index_scheduled_tours_on_account_user_id  (account_user_id)
#  index_scheduled_tours_on_tour_id          (tour_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_user_id => account_users.id)
#  fk_rails_...  (tour_id => tours.id)
#
class ScheduledTour < ApplicationRecord
  belongs_to :tour
  belongs_to :account_user
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :scheduled_tours, partial: "scheduled_tours/index", locals: {scheduled_tour: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :scheduled_tours, target: dom_id(self, :index) }
end
