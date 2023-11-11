class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :name                           , null: false
      t.text       :detail                         , null: false
      t.integer    :category_id                    , null: false
      t.integer    :item_condition_id              , null: false
      t.integer    :delivery_condition_id          , null: false
      t.integer    :prefecture_id                  , null: false
      t.integer    :reach_date_id                  , null: false
      t.integer    :price                          , null: false
      t.timestamps
    end
  end
end
