require 'acts-as-taggable-on'

class Imageurl < ApplicationRecord
  acts_as_taggable
  validates :url, presence: true, null: false,
                  format: { with: %r{\Ahttps?://},
                            message: 'must begin with http:// or https://' }
  validate :tags_are_lowercase_ascii

  private

  def tags_are_lowercase_ascii
    tag_list.each do |t|
      unless /^[a-z]+$/.match? t
        errors.add(:tag_list, 'tags must be lowercase ASCII strings and cannot contain spaces')
      end
    end
  end
end
