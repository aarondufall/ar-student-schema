class MergeNames < ActiveRecord::Migration
  def up
    add_column :students, :name, :string
    Student.all.each do |student|
      student.update_attributes! name: student.first_name + " " + student.last_name
    end
    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :first_name
    add_column :students, :last_name
    Student.all.each do |student|
      names = student.name.split(" ",2)
      student.update_attributes! first_name: names.first, last_name: names.last
    end
    remove_column :students, :name
  end
end
