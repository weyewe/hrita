puts "#{RAILS_ROOT}"
require "#{RAILS_ROOT}/lib/paperclip_processors/cropper.rb"



class Employee < ActiveRecord::Base
  belongs_to :department
  has_attached_file :photo, :styles => { :small => "100x100#", :large => "500x500>" }, :processors => [:cropper]  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  after_update :reprocess_photo, :if => :cropping? 
  
  
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  
  def cropping?  
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?  
  end  

  def photo_geometry(style = :original)  
    @geometry ||= {}  
    @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))  
  end

private  
  def reprocess_photo
    photo.reprocess!  
  end
  
end
