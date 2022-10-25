module Mensagems

import SearchLight: AbstractModel, DbId
import Base: @kwdef

export Mensagem

@kwdef mutable struct Mensagem <: AbstractModel
  id::DbId = DbId()
end

end
