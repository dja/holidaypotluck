class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

    	t.string :item_type
    	t.string :title
    	t.string :link

      t.timestamps
    end
  end
end
