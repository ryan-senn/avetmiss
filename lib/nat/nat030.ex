defmodule Avetmiss.Nat.Nat030 do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  use TypedStruct

  typedstruct do
    field :program_id, String.t(), enforce: true
    field :program_name, String.t(), enforce: true
    field :nominal_hours, String.t(), enforce: true
  end
end
