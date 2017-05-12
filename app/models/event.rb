class Event < ApplicationRecord
  belongs_to :user

has_attached_file :image, styles: { medium: "350x350>", thumb: "100x100>"}, default_url: "event_:style.jpg"
 validates_attachment_content_type :image, content_type:  /\Aimage\/.*\z/

 validates_presence_of :name, :description, :startdate, :enddate, :location, :cost, :streetaddress, :city, :state, :zip
 validates :cost, numericality:{greater_than_or_equal_to: 0 }
 validates :location, inclusion: {in: ["Noho","Soho","Lower East Side", "Upper West Side", "Upper East Side", "West Village", "East Village", "Hell's Kitchen", "Financial District", "Midtown", "Harlem", "Washington Heights", "Chelsea", "Tribeca", "Chinatown", "Murray Hill"]}

 def start_time
   self.startdate
 end

  def end_time
    self.enddate
  end

end
