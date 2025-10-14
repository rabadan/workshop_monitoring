class User < ApplicationRecord
  after_create :track_user

  private

  def track_user
    Yabeda.top_shop.users_registered.increment({ kind: })
  end
end
