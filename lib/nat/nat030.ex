defmodule Avetmiss.Nat.Nat030 do
  use TypedStruct

  typedstruct do
    field :program_id, String.t(), enforce: true
    field :program_name, String.t(), enforce: true
    field :nominal_hours, String.t(), enforce: true
  end
end
