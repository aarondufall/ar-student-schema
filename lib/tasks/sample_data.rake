namespace :db do
  desc "What?? Fill database with sample data"
  task populate: :enviroment do
    10.times do |n|
      name    = Forgery(:Name).full_name
      email   = Forgery(:Internet).email_address
      address = Forgery(:Address).street_address
      phone   = "555-555-555#{n}"
      Teacher.create!(name:    name, 
                     email:   email, 
                     address: address,
                     phone:   phone)
    end
  end
end
