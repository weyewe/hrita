# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Hrita::Application.initialize!


DEPARTMENT  = {
  1 => "Shipping",
  2 => "Admin",
  3 => "Production", 
  4 => "Exploration",
  5 => "HSE"
}

DIVISION = {
  1 => ["Loading", "Port Captain"],
  2 => ["HRD", "General Affairs", "Comdev", "Logistik", "Finance", 
        "Building Maintenance", "Purchasing", "Elektrik", "Security"],
  3 => ["Quality Control", "Produksi", "Workshop Maintenance" ],
  4 => ["Grade Control", "Preparasi"],
  5 => ["HSE"]
}

# There is one extra layer => Produksi division has 2 sections => MPE and Grade Control. Model this?

POSITION = {
  1 => ["Crew Operator" ],
  2 => ["Foreman", "Staff", "Kepala Regu", "Administrasi"],
  3 => ["Supervisor"],
  4 => ["Superintendent"] ,
  5 => ["Deputy GM", "Manager"],
  6 => ["GM"]
}