module AdminsOnly
  extend ActiveSupport::Concern

  included do |base|
    def filter_admins!
      return render 'pages/not_authorized' unless user_signed_in? && current_user.admin?
    end

    base.before_action :filter_admins!
  end
end