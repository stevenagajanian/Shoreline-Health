class AddValidatorIdToImmunization < ActiveRecord::Migration
  def change
    add_column :immunizations, :validator_id, :integer
    add_column :immunizations, :validation_url, :string
  end
end
