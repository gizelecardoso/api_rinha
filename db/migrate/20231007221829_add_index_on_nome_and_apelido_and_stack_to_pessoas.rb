class AddIndexOnNomeAndApelidoAndStackToPessoas < ActiveRecord::Migration[7.0]
  def change
    add_index :pessoas, [:apelido, :nome, :stack]
  end
end
