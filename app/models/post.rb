class Post < ApplicationRecord
  belongs_to :user

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "events_medium.jpg"
 validates_attachment_content_type :photo, content_type:  /\Aimage\/.*\z/
end
