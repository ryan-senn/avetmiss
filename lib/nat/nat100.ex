defmodule Avetmiss.Nat.Nat100 do
  use TypedStruct

  typedstruct do
    field :client_id, String.t(), enforce: true
    field :prior_education_achievement_id, String.t(), enforce: true
  end
end
