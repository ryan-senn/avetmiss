defmodule Avetmiss.Nat.Nat090 do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  use TypedStruct

  typedstruct do
    field :client_id, String.t(), enforce: true
    field :disability_type_id, String.t(), enforce: true
  end
end
