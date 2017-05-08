class Post < ApplicationRecord
  belongs_to :user

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "events_medium.jpg"
 validates_attachment_content_type :photo, content_type:  /\Aimage\/.*\z/

 validates :location, inclusion: {in: ["Noho","Soho","Lower East Side", "Upper West  side", "Upper East Side", "West Village", "East Village", "Hell's Kitchen", "Financial District", "Wall St.", "Midtown", "Harlem", "Washington Heights", "Chelsea", "Tribeca", "Chinatown", "Murray Hill"]}
end
