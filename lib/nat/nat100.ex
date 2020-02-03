defmodule Avetmiss.Nat.Nat100 do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  use TypedStruct

  typedstruct do
    field :client_id, String.t(), enforce: true
    field :prior_education_achievement_id, String.t(), enforce: true
  end
end
