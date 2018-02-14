class CreateCompanyPositions < ActiveRecord::Migration[5.1]
  def change
    create_table :company_positions do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :role, default: 0
    end
  end
end
