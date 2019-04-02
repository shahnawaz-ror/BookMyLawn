class CreateSubdomains < ActiveRecord::Migration[5.2]
  def change
    create_table :subdomains do |t|
      t.string :name
      t.string :subdomain
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
