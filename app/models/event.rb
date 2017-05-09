class Event < ApplicationRecord
  belongs_to :user

has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "events_medium.jpg"
 validates_attachment_content_type :image, content_type:  /\Aimage\/.*\z/

validates_presence_of :name, :description, :startdate, :enddate, :location, :cost
validates :cost, numericality:{greater_than_or_equal_to: 0 }
 validates :location, inclusion: {in: ["Noho","Soho","Lower East Side", "Upper West  side", "Upper East Side", "West Village", "East Village", "Hell's Kitchen", "Financial District", "Wall St.", "Midtown", "Harlem", "Washington Heights", "Chelsea", "Tribeca", "Chinatown", "Murray Hill"]}

 def start_time
        self.startdate
    end

end
