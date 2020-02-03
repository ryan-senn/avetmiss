defmodule Avetmiss.Nat.Nat020 do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  use TypedStruct

  typedstruct do
    field :training_organisation_id, String.t(), enforce: true
    field :training_organisation_delivery_location_id, String.t(), enforce: true
    field :training_organisation_delivery_location_name, String.t(), enforce: true
    field :postcode, String.t(), enforce: true
    field :state_id, String.t(), enforce: true
    field :address_location_suburb_locality_town, String.t(), enforce: true
    field :country_id, String.t(), enforce: true
  end
end
