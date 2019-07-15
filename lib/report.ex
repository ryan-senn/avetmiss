defmodule Avetmiss.Report do
  import Avetmiss.Util

  alias Avetmiss.Nat.{
    Nat010,
    Nat020,
    Nat030,
    Nat060,
    Nat080,
    Nat085,
    Nat090,
    Nat100,
    Nat120,
    Nat130
  }

  def nat010_row(%Nat010{} = data) do
    [
      data.training_organisation_id |> length(10),
      data.training_organisation_name |> length(100),
      data.contact_name |> length(60),
      data.telephone_number |> length(20),
      data.facsimile_number |> length(20),
      data.email_address |> length(80)
    ]
    |> Enum.join("")
  end

  def nat020_row(%Nat020{} = data) do
    [
      data.training_organisation_id |> length(10),
      data.training_organisation_delivery_location_id |> length(10),
      data.training_organisation_delivery_location_name |> length(100),
      data.postcode |> length(4),
      data.state_id |> pad_int(2) |> length(2),
      data.address_location_suburb_locality_town |> length(50),
      data.country_id |> length(4)
    ]
    |> Enum.join("")
  end

  def nat030_row(%Nat030{} = data) do
    [
      data.program_id |> length(10),
      data.program_name |> length(100),
      data.nominal_hours |> length(4)
    ]
    |> Enum.join("")
  end

  def nat060_row(%Nat060{} = data) do
    [
      data.unit_display_id |> length(12),
      data.unit_name |> length(100),
      data.module_field_of_education_id |> length(6),
      data.vet_flag |> length(1),
      data.nominal_hours |> length(4)
    ]
    |> Enum.join("")
  end

  def nat080_row(%Nat080{} = data) do
    [
      data.client_id |> length(10),
      data.name_for_encryption |> length(60),
      data.highest_school_level_completed_id |> length(2),
      data.gender |> length(1),
      data.date_of_birth |> length(8),
      data.postcode |> length(4),
      data.indigenous_status_id |> length(1),
      data.language_id |> length(4),
      data.labour_force_status_id |> length(2),
      data.country_id |> length(4),
      data.disability_flag |> length(1),
      data.prior_educational_achievement_flag |> length(1),
      data.at_school_flag |> length(1),
      data.address_location_suburb_locality_or_town |> length(50),
      data.unique_student_id |> length(10),
      data.state_id |> length(2),
      data.address_building_property_name |> length(50),
      data.address_flat_unit_details |> length(30),
      data.address_street_number |> length(15),
      data.address_street_name |> length(70),
      data.survey_contact_status |> length(1),
      data.statistical_area_level_1_id |> length(11),
      data.statistical_area_level_2_id |> length(9)
    ]
    |> Enum.join("")
  end

  def nat085_row(%Nat085{} = data) do
    [
      data.client_id |> length(10),
      data.client_title |> length(4),
      data.client_first_given_name |> length(40),
      data.client_last_name |> length(40),
      data.address_building_property_name |> length(50),
      data.address_flat_unit_details |> length(30),
      data.address_street_number |> length(15),
      data.address_street_name |> length(70),
      data.address_postal_delivery_box |> length(22),
      data.address_postal_suburb_locality_town |> length(50),
      data.postcode |> length(4),
      data.state_id |> length(2),
      data.telephone_number_home |> length(20),
      data.telephone_number_work |> length(20),
      data.telephone_number_mobile |> length(20),
      data.email_address |> length(80),
      data.email_address_alternative |> length(80)
    ]
    |> Enum.join("")
  end

  def nat090_row(%Nat090{} = data) do
    [
      data.client_id |> length(10),
      data.disability_type_id |> length(2)
    ]
    |> Enum.join("")
  end

  def nat100_row(%Nat100{} = data) do
    [
      data.client_id |> length(10),
      data.prior_education_achievement_id |> length(3)
    ]
    |> Enum.join("")
  end

  def nat120_row(%Nat120{} = data) do
    [
      data.training_organisation_id |> length(10),
      data.training_organisation_delivery_location_id |> length(10),
      data.client_id |> length(10),
      data.subject_id |> length(12),
      data.program_id |> length(10),
      data.activity_start_date |> length(8),
      data.activity_end_date |> length(8),
      data.delivery_mode_id |> length(3),
      data.outcome_id_national |> length(2),
      data.funding_source_national |> length(2),
      data.commencing_program_id |> length(1),
      data.training_contract_id |> length(10),
      data.client_id_apprenticeships |> length(10),
      data.study_reason_id |> length(2),
      data.vet_in_schools_flag |> length(1),
      data.specific_funding_id |> length(10),
      data.school_type_identifier |> length(2),
      data.outcome_id_training_organisation |> length(3),
      data.funding_source_state_training_authority |> length(3),
      data.client_tuition_fee |> length(5),
      data.fee_exemption_concession_type_id |> length(2),
      data.purchasing_contract_id |> length(12),
      data.purchasing_contract_schedule_id |> length(3),
      data.hours_attended |> length(4),
      data.associated_course_id |> length(10),
      data.scheduled_hours |> length(4),
      data.predominant_delivery_mode |> length(1)
    ]
    |> Enum.join("")
  end

  def nat130_row(%Nat130{} = data) do
    [
      data.training_organisation_id |> length(10),
      data.program_id |> length(10),
      data.client_id |> length(10),
      data.date_program_completed |> length(8),
      data.issued_flag |> length(1),
      data.parchment_issue_date |> length(8),
      data.parchment_number |> length(25)
    ]
    |> Enum.join("")
  end
end
