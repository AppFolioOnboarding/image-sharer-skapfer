class Imageurl < ApplicationRecord
  validates :url, presence: true, null: false,
                  format: { with: %r{\Ahttps?://},
                            message: 'must begin with http:// or https://' }
end
