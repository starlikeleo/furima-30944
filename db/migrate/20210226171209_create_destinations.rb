class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references :buy,                        foreign_key: true
      t.string  :postal_code,     default: "",  null: false
      t.integer :delivery_area_id,              null: false
      t.string  :municipal_name,  default: "",  null: false
      t.string  :house_number,    default: "",  null: false
      t.string  :building_name,   default: ""
      t.string  :tell,            default: "",  null: false
      t.timestamps
    end
  end
end