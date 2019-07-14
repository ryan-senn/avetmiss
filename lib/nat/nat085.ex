defmodule Avetmiss.Nat.Nat085 do
  use TypedStruct

  typedstruct do
    field :client_id, String.t(), enforce: true
    field :client_title, String.t(), enforce: true
    field :client_first_given_name, String.t(), enforce: true
    field :client_last_name, String.t(), enforce: true
    field :address_building_property_name, String.t(), enforce: true
    field :address_flat_unit_details, String.t(), enforce: true
    field :address_street_number, String.t(), enforce: true
    field :address_street_name, String.t(), enforce: true
    field :address_postal_delivery_box, String.t(), enforce: true
    field :address_postal_suburb_locality_town, String.t(), enforce: true
    field :postcode, String.t(), enforce: true
    field :state_id, String.t(), enforce: true
    field :telephone_number_home, String.t(), enforce: true
    field :telephone_number_work, String.t(), enforce: true
    field :telephone_number_mobile, String.t(), enforce: true
    field :email_address, String.t(), enforce: true
    field :email_address_alternative, String.t(), enforce: true
  end
end
