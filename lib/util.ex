defmodule Avetmiss.Util do
  def length(string, length) do
    string = to_string(string)

    cond do
      String.length(string) > length ->
        raise "String exceeds permitted length"

      true ->
        String.pad_trailing(string, length, " ")
    end
  end

  def name_for_encryption(first_name, last_name) do
    "#{last_name}, #{first_name}"
  end

  # if the user has a single name, report it as the last name
  def name_for_encryption(name) do
    "#{name}, "
  end

  def date(date) when date == nil do
    ""
  end

  def date(%Date{} = date) do
    [
      date.day
      |> pad_int(2),
      date.month
      |> pad_int(2),
      date.year
    ]
    |> Enum.join("")
  end

  def has_flag(items) when items == nil do
    ""
  end

  def has_flag(items) do
    if Enum.empty?(items) do
      "N"
    else
      "Y"
    end
  end

  def bool_flag(bool) when bool == nil do
    ""
  end

  def bool_flag(bool) do
    if bool do
      "Y"
    else
      "N"
    end
  end

  def pad_int(int, _) when int == nil do
    ""
  end

  def pad_int(int, length) do
    int
    |> Integer.to_string()
    |> String.pad_leading(length, "0")
  end
end
