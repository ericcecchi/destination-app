# frozen_string_literal: true

# Helper methods for users
module UsersHelper
  def gravatar_for(user, size: 200, class_name: '')
    gravatar_id  = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar rounded-full #{class_name}")
  end
end
