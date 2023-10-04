class CreatePessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :pessoas, id: :uuid do |t|
      t.string :apelido, null: false, index: { unique: true }
      t.string :nome, null: false
      t.date :nascimento, null: false

      t.timestamps
    end
  end
end
