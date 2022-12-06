module CreateTableMessages

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:messages) do
    [
      pk()
      column(:nome, :string)
      column(:mensagem, :string, limit = 1_000)
    ]
  end

  add_index(:messages, :nome)
  add_index(:messages, :mensagem)
end

function down()
  drop_table(:messages)
end

end
