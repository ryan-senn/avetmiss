defmodule Avetmiss.Nat.Nat010 do
  use TypedStruct

  typedstruct do
    field :training_organisation_id, String.t(), enforce: true
    field :training_organisation_name, String.t(), enforce: true
    field :contact_name, String.t(), enforce: true
    field :telephone_number, String.t(), enforce: true
    field :facsimile_number, String.t(), enforce: true
    field :email_address, String.t(), enforce: true
  end
end
