class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    # It should be noted Rails figures out the boolean nature of the admin attribute
    # and automatically adds the question-mark method admin?
    # toggle!(:admin) method can be used to flip to admin attribute from false to true
  end
end
