module CreateTableMensagems

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:mensagems) do
    [
      pk()
      column(:nome_usuario, :string, limit = 50)
      column(:mensagem_usuario, :string, limit = 1000)
    ]
  end

  add_index(:mensagems, :nome_usuario)
  add_indices(:mensagems, :mensagem_usuario)
end

function down()
  drop_table(:mensagems)
end

end
