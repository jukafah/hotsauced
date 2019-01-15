# frozen_string_literal: true

module SaucesHelper
  def default_image?(sauce)
    return 'https://storage.googleapis.com/hotsauced-pics/placeholder_bottle.svg' if !sauce.image.attached? else sauce.image
  end
end
