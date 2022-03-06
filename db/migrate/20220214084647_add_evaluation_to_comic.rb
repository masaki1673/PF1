class AddEvaluationToComic < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :evaluation, :float
  end
end
