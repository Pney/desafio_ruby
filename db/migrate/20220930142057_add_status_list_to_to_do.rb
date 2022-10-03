class AddStatusListToToDo < ActiveRecord::Migration[5.2]
  def change
    add_reference :to_dos, :status_list, foreign_key: true, optional: false
  end
end
