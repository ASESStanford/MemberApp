class SeedAppForm < ActiveRecord::Migration
  def change
  	ApplicationForm.create(title: "Intern Application")
  end
end
