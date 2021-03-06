require "#{Rails.root.to_s}/lib/paperclip_processors/cropper.rb"
include Paperclip

class Employee < ActiveRecord::Base
  
  
  
  CATEGORIES = {
    1 => ["Crew Operator", ],
    2 => ["Foreman", "Staff", "Kepala Regu", "Administrasi"],
    3 => ["Supervisor"],
    4 => ["Superintendent"],
    5 => ["Deputy GM", "Manager"],
    6 => ["GM"]
  }
  
  DEPARTMENTS = {
    1 => "Explorasi",
    2 => "Finance",
    3 => "General Affair",
    4 => "HRD",
    5 => "Survey Tambang",
    6 => "Produksi",
    7 => "Comdev",
    8 => "Preparasi",
    9 => "Quality Control",
    10 => "Shipping",
    11 => "HSE",
    12 => "Logistik", 
    13 => "Maintenance",
    14 => "Konstruksi",
    15 => "Grade Control",
    16 => "Purchasing", 
    17 => "Elektrik",
    18 => "Security" 
  }
  
  
  
  
  # belongs_to :department
  
    # the greater sign (>) instructs the scaling to preserve width:length ratio 
    # so that there will be no distortion
  has_attached_file :photo, 
    :styles => { :small => "100x100>", :profile => "200x200>" , :large => "300x300>" },
    :processors => [:cropper]  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h  
  after_update :reprocess_photo, :if => :cropping? 
  
  
  
  # validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  # model relation
  belongs_to :division
  belongs_to :position
  def cropping?  
    puts "We are in the cropping?\n"*5
    iscrop = !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?  
    puts "The value of cropping? is #{iscrop}"
    iscrop
  end  

  def photo_geometry(style = :original)  
    @geometry ||= {}  
    @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))  
  end

  # def category_selections
  #     category_selections_result = {}
  #     
  #     CATEGORIES.each do | key , values | 
  #       for value in values 
  #         category_selections_result[value] = key
  #       end
  #     end
  #     
  #     category_selections_result
  #   end
  

  def self.position_selections
    position_selections_result = {}
    
    Position.all.each do | position | 
        position_selections_result[position.title] = position.id
    end
    
    position_selections_result
  end
  
  def self.grouped_selection_for_divisions
    grouped_selections = {}
    
    Department.all.each do | department |
      division_selections = []
      department.divisions.each do | division |
        division_selections << [ division.name, division.id ]
      end
      grouped_selections[department.name] = division_selections
    end
    
    grouped_selections 
  end

  private  
  def reprocess_photo
    puts "We are gonna reprocess the photo\n"*10
    photo.reprocess!  
  end
  
end
