defmodule Avetmiss.Config do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  def states() do
    [
      {1, "NSW"},
      {2, "VIC"},
      {3, "QLD"},
      {4, "SA"},
      {5, "WA"},
      {6, "TAS"},
      {7, "NT"},
      {8, "ACT"},
      {99, "Other (overseas but not an Australian territory or dependency)"}
    ]
  end

  def genders() do
    [
      {1, "Male"},
      {2, "Female"},
      {3, "Other"}
    ]
  end

  def indigenous_statuses() do
    [
      {4, "No"},
      {1, "Yes, Aboriginal"},
      {2, "Yes, Torres Strait Islander"},
      {3, "Yes, Aboriginal and Torres Strait Islander"}
    ]
  end

  def disabilities() do
    [
      {11, "Hearing/deaf"},
      {12, "Physical"},
      {13, "Intellectual"},
      {14, "Learning"},
      {15, "Mental illness"},
      {16, "Acquired brain impairment"},
      {17, "Vision"},
      {18, "Medical condition"},
      {19, "Other"}
    ]
  end

  def school_levels() do
    [
      {12, "Year 12 or equivalent"},
      {11, "Year 11 or equivalent"},
      {10, "Year 10 or equivalent"},
      {9, "Year 9 or equivalent"},
      {8, "Year 8 or below"},
      {2, "Never attended school"}
    ]
  end

  def qualifications() do
    [
      {8, "Bachelor degree or higher degree"},
      {410, "Advanced diploma or associate degree"},
      {420, "Diploma (or associate diploma)"},
      {511, "Certificate IV (or advanced certificate/technician)"},
      {514, "Certificate III (or trade certificate)"},
      {521, "Certificate II"},
      {524, "Certificate I"},
      {990, "Other education (inc. overseas)"}
    ]
  end

  def employment_statuses() do
    [
      {1, "Full-time employee"},
      {2, "Part-time employee"},
      {3, "Self employed – not employing others"},
      {4, "Self employed – employing others"},
      {5, "Employed – unpaid worker in a family business"},
      {6, "Unemployed – seeking full-time work"},
      {7, "Unemployed – seeking part-time work"},
      {8, "Not employed – not seeking employment"}
    ]
  end

  def study_reasons() do
    [
      {1, "To get a job"},
      {2, "To develop my existing business"},
      {3, "To start my own business"},
      {4, "To try for a different career"},
      {5, "To get a better job or promotion"},
      {6, "It was a requirement of my job"},
      {7, "I wanted extra skills for my job"},
      {8, "To get into another course of study"},
      {12, "For personal interest or self-development"},
      {13, "To get skills for community/voluntary work"},
      {11, "Other reasons"}
    ]
  end
end
