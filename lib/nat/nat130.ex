defmodule Avetmiss.Nat.Nat130 do
  use TypedStruct

  typedstruct do
    field :training_organisation_id, String.t(), enforce: true
    field :program_id, String.t(), enforce: true
    field :client_id, String.t(), enforce: true
    field :date_program_completed, String.t(), enforce: true
    field :issued_flag, String.t(), enforce: true
    field :parchment_issue_date, String.t(), enforce: true
    field :parchment_number, String.t(), enforce: true
  end
end
