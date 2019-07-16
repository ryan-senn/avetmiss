defmodule Avetmiss.ReportTest do
  use ExUnit.Case

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

  test "nat010 - test fields" do
    assert Avetmiss.Report.nat010_row(%Nat010{
             training_organisation_id: "foo",
             training_organisation_name: "bar",
             contact_name: "baz",
             telephone_number: "qux",
             facsimile_number: "quux",
             email_address: "quuz"
           }) ==
             [
               "foo       ",
               "bar                                                                                                 ",
               "baz                                                         ",
               "qux                 ",
               "quux                ",
               "quuz                                                                            "
             ]
             |> Enum.join("")
  end

  test "nat020 - test fields" do
    assert Avetmiss.Report.nat020_row(%Nat020{
             training_organisation_id: "foo",
             training_organisation_delivery_location_id: "bar",
             training_organisation_delivery_location_name: "baz",
             postcode: 4006,
             state_id: 2,
             address_location_suburb_locality_town: "quuz",
             country_id: 101
           }) ==
             [
               "foo       ",
               "bar       ",
               "baz                                                                                                 ",
               "4006",
               "02",
               "quuz                                              ",
               "101 "
             ]
             |> Enum.join("")
  end

  test "nat030 - test fields" do
    assert Avetmiss.Report.nat030_row(%Nat030{
             program_id: "foo",
             program_name: "bar",
             nominal_hours: 23
           }) ==
             [
               "foo       ",
               "bar                                                                                                 ",
               "23  "
             ]
             |> Enum.join("")
  end

  test "nat060 - test fields" do
    assert Avetmiss.Report.nat060_row(%Nat060{
             unit_display_id: "foo",
             unit_name: "bar",
             module_field_of_education_id: 324,
             vet_flag: "Y",
             nominal_hours: 115
           }) ==
             [
               "foo         ",
               "bar                                                                                                 ",
               "324   ",
               "Y",
               "115 "
             ]
             |> Enum.join("")
  end

  test "nat080 - test fields" do
    assert Avetmiss.Report.nat080_row(%Nat080{
             client_id: "foo",
             name_for_encryption: {"Foo", "Bar"},
             highest_school_level_completed_id: 9,
             gender: 1,
             date_of_birth: ~D[1995-06-26],
             postcode: "4061",
             indigenous_status_id: 3,
             language_id: 1101,
             labour_force_status_id: 7,
             country_id: 11,
             disability_flag: [],
             prior_educational_achievement_flag: 1..3,
             at_school_flag: false,
             address_location_suburb_locality_or_town: "woolloongabba",
             unique_student_id: "DSFHRU738F",
             state_id: 3,
             address_building_property_name: "foobar",
             address_flat_unit_details: "level 19",
             address_street_number: "20",
             address_street_name: "waterfront st",
             survey_contact_status: "2",
             statistical_area_level_1_id: "3",
             statistical_area_level_2_id: "4"
           }) ==
             [
               "foo       ",
               "Bar, Foo                                                    ",
               "9 ",
               "1",
               "26061995",
               "4061",
               "3",
               "1101",
               "7 ",
               "11  ",
               "N",
               "Y",
               "N",
               "woolloongabba                                     ",
               "DSFHRU738F",
               "03",
               "foobar                                            ",
               "level 19                      ",
               "20             ",
               "waterfront st                                                         ",
               "2",
               "3          ",
               "4        "
             ]
             |> Enum.join("")
  end

  test "nat085 - test fields" do
    assert Avetmiss.Report.nat085_row(%Nat085{
             client_id: "foo",
             client_title: "Mrs",
             client_first_given_name: "foo",
             client_last_name: "bar",
             address_building_property_name: "foobar",
             address_flat_unit_details: "level 19",
             address_street_number: "20",
             address_street_name: "waterfront st",
             address_postal_delivery_box: "PO 9",
             address_postal_suburb_locality_town: "woolloongabba",
             postcode: 4050,
             state_id: 6,
             telephone_number_home: "0400000000",
             telephone_number_work: "0400200034",
             telephone_number_mobile: "0403300034",
             email_address: "foobar@bar.baz",
             email_address_alternative: "foobar@bar.baz"
           }) ==
             [
               "foo       ",
               "Mrs ",
               "foo                                     ",
               "bar                                     ",
               "foobar                                            ",
               "level 19                      ",
               "20             ",
               "waterfront st                                                         ",
               "PO 9                  ",
               "woolloongabba                                     ",
               "4050",
               "06",
               "0400000000          ",
               "0400200034          ",
               "0403300034          ",
               "foobar@bar.baz                                                                  ",
               "foobar@bar.baz                                                                  "
             ]
             |> Enum.join("")
  end

  test "nat090 - test fields" do
    assert Avetmiss.Report.nat090_row(%Nat090{
             client_id: "foo",
             disability_type_id: "11"
           }) ==
             [
               "foo       ",
               "11"
             ]
             |> Enum.join("")
  end

  test "nat100 - test fields" do
    assert Avetmiss.Report.nat100_row(%Nat100{
             client_id: "foo",
             prior_education_achievement_id: "410"
           }) ==
             [
               "foo       ",
               "410"
             ]
             |> Enum.join("")
  end

  test "nat120 - test fields" do
    assert Avetmiss.Report.nat120_row(%Nat120{
             training_organisation_id: "foo",
             training_organisation_delivery_location_id: "bar",
             client_id: "baz",
             subject_id: "egg",
             program_id: "bacon",
             activity_start_date: ~N[2018-05-26 12:05:29],
             activity_end_date: ~D[2018-11-20],
             delivery_mode_id: "23",
             outcome_id_national: "43",
             funding_source_national: "45",
             commencing_program_id: "4",
             training_contract_id: "19",
             client_id_apprenticeships: "foo",
             study_reason_id: 13,
             vet_in_schools_flag: false,
             specific_funding_id: "23",
             school_type_identifier: "6",
             outcome_id_training_organisation: "36",
             funding_source_state_training_authority: "43",
             client_tuition_fee: "66",
             fee_exemption_concession_type_id: "3",
             purchasing_contract_id: "345",
             purchasing_contract_schedule_id: "45",
             hours_attended: "3",
             associated_course_id: "3456",
             scheduled_hours: 420,
             predominant_delivery_mode: 2
           }) ==
             [
               "foo       ",
               "bar       ",
               "baz       ",
               "egg         ",
               "bacon     ",
               "26052018",
               "20112018",
               "23 ",
               "43",
               "45",
               "4",
               "19        ",
               "foo       ",
               "13",
               "N",
               "23        ",
               "6 ",
               "36 ",
               "43 ",
               "66   ",
               "3 ",
               "345         ",
               "45 ",
               "3   ",
               "3456      ",
               "420 ",
               "2"
             ]
             |> Enum.join("")
  end

  test "nat130 - test fields" do
    assert Avetmiss.Report.nat130_row(%Nat130{
             training_organisation_id: "foo",
             program_id: "bar",
             client_id: "baz",
             date_program_completed: ~D[2017-10-23],
             issued_flag: true,
             parchment_issue_date: ~D[2019-05-11],
             parchment_number: 12
           }) ==
             [
               "foo       ",
               "bar       ",
               "baz       ",
               "23102017",
               "Y",
               "11052019",
               "12                       "
             ]
             |> Enum.join("")
  end
end
