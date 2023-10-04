class AddStaskToPessoa < ActiveRecord::Migration[7.0]
  def change
    add_column :pessoas, :stack, :string, array: true, default: []
  end
end
