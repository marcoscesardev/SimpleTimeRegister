class SessionsController < Devise::SessionsController
  layout :layout_name

  def layout_name
    return 'application' if action_name.in?(%w[edit update])

    'auth'
  end
end