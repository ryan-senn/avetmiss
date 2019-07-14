defmodule Avetmiss.Nat.Nat090 do
  use TypedStruct

  typedstruct do
    field :client_id, String.t(), enforce: true
    field :disability_type_id, String.t(), enforce: true
  end
end
