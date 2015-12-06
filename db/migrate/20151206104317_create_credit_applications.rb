class CreateCreditApplications < ActiveRecord::Migration
  def change
    create_table :credit_applications do |t|
      t.string :param_names
      t.string :param_values
      t.string :application_id

      t.timestamps null: false
    end
  end
end
