module CreateTableMessages

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:messages) do
    [
      pk()
      column(:userName, :string)
      column(:accountNumber, :int)
      column(:textMessage, :string)
    ]
  end

  add_index(:messages, :userName)
  add_index(:messages, :accountNumber)
  add_index(:messages, :textMessage)
end

function down()
  drop_table(:messages)
end

end
