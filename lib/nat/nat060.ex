defmodule Avetmiss.Nat.Nat060 do
  use TypedStruct

  typedstruct do
    field :unit_display_id, String.t(), enforce: true
    field :unit_name, String.t(), enforce: true
    field :module_field_of_education_id, String.t(), enforce: true
    field :vet_flag, boolean() | String.t(), enforce: true
    field :nominal_hours, String.t(), enforce: true
  end
end
