defmodule Avetmiss.Nat.Nat120 do
  use TypedStruct

  typedstruct do
    field :training_organisation_id, String.t(), enforce: true
    field :training_organisation_delivery_location_id, String.t(), enforce: true
    field :client_id, String.t(), enforce: true
    field :subject_id, String.t(), enforce: true
    field :program_id, String.t(), enforce: true
    field :activity_start_date, Date.t() | NaiveDateTime.t(), enforce: true
    field :activity_end_date, Date.t() | NaiveDateTime.t(), enforce: true
    field :delivery_mode_id, String.t(), enforce: true
    field :outcome_id_national, String.t(), enforce: true
    field :funding_source_national, String.t(), enforce: true
    field :commencing_program_id, String.t(), enforce: true
    field :training_contract_id, String.t(), enforce: true
    field :client_id_apprenticeships, String.t(), enforce: true
    field :study_reason_id, String.t(), enforce: true
    field :vet_in_schools_flag, boolean() | String.t(), enforce: true
    field :specific_funding_id, String.t(), enforce: true
    field :school_type_identifier, String.t(), enforce: true
    field :outcome_id_training_organisation, String.t(), enforce: true
    field :funding_source_state_training_authority, String.t(), enforce: true
    field :client_tuition_fee, String.t(), enforce: true
    field :fee_exemption_concession_type_id, String.t(), enforce: true
    field :purchasing_contract_id, String.t(), enforce: true
    field :purchasing_contract_schedule_id, String.t(), enforce: true
    field :hours_attended, String.t(), enforce: true
    field :associated_course_id, String.t(), enforce: true
    field :scheduled_hours, String.t(), enforce: true
    field :predominant_delivery_mode, String.t(), enforce: true
  end
end
