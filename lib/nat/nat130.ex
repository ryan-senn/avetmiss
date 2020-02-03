defmodule Avetmiss.Nat.Nat130 do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  use TypedStruct

  typedstruct do
    field :training_organisation_id, String.t(), enforce: true
    field :program_id, String.t(), enforce: true
    field :client_id, String.t(), enforce: true
    field :date_program_completed, Date.t() | NaiveDateTime.t(), enforce: true
    field :issued_flag, boolean() | String.t(), enforce: true
    field :parchment_issue_date, Date.t() | NaiveDateTime.t(), enforce: true
    field :parchment_number, String.t(), enforce: true
  end
end
