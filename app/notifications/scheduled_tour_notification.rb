# To deliver this notification:
#
# ScheduledTourNotification.with(post: @post).deliver_later(current_user)
# ScheduledTourNotification.with(post: @post).deliver(current_user)

class ScheduledTourNotification < ApplicationNotification
  # Database delivery is already added in ApplicationNotification
  deliver_by :action_cable, format: :to_websocket, channel: "NotificationChannel"

  # Add your delivery methods
  #
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :user
  param :scheduled_tour

  # Define helper methods to make rendering easier.
  #
  # `message` and `url` are used for rendering in the navbar

  def message
    t "notifications.scheduled_tour_notification", user: user.name, scheduled_tour: scheduled_tour.tour.title
  end

  def url
    # You can use any URL helpers here such as:
    # post_path(params[:post])
    scheduled_tour_path(scheduled_tour)
  end

  # Include account_id to make sure notification only triggers if user is signed in to that account
  def to_websocket
    {
      account_id: record.account_id,
      html: ApplicationController.render(partial: "notifications/notification", locals: {notification: record})
    }
  end

  def user
    params[:user]
  end

  def scheduled_tour
    params[:scheduled_tour]
  end
end
