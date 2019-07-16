defmodule Avetmiss.Nat.Nat080 do
  use TypedStruct

  typedstruct do
    field :client_id, String.t(), enforce: true
    field :name_for_encryption, {String.t(), String.t()}, enforce: true
    field :highest_school_level_completed_id, String.t(), enforce: true
    field :gender, String.t(), enforce: true
    field :date_of_birth, String.t(), enforce: true
    field :postcode, String.t(), enforce: true
    field :indigenous_status_id, String.t(), enforce: true
    field :language_id, String.t(), enforce: true
    field :labour_force_status_id, String.t(), enforce: true
    field :country_id, String.t(), enforce: true
    field :disability_flag, boolean() | String.t(), enforce: true
    field :prior_educational_achievement_flag, String.t(), enforce: true
    field :at_school_flag, boolean() | String.t(), enforce: true
    field :address_location_suburb_locality_or_town, String.t(), enforce: true
    field :unique_student_id, String.t(), enforce: true
    field :state_id, String.t(), enforce: true
    field :address_building_property_name, String.t(), enforce: true
    field :address_flat_unit_details, String.t(), enforce: true
    field :address_street_number, String.t(), enforce: true
    field :address_street_name, String.t(), enforce: true
    field :survey_contact_status, String.t(), enforce: true
    field :statistical_area_level_1_id, String.t(), enforce: true
    field :statistical_area_level_2_id, String.t(), enforce: true
  end
end
