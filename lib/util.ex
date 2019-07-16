defmodule Avetmiss.Util do
  alias Avetmiss.Errors.{LengthError, DateError, ConfigError, FlagError}

  def length(string, length) do
    string = to_string(string)

    cond do
      String.length(string) > length ->
        raise LengthError

      true ->
        String.pad_trailing(string, length, " ")
    end
  end

  def name_for_encryption(first_name, last_name), do: "#{last_name}, #{first_name}"
  # if the user has a single name, report it as the last name
  def name_for_encryption(name), do: "#{name}, "

  def date(nil), do: ""
  def date(""), do: ""
  def date(%Date{} = date), do: fomat_date(date)
  def date(%NaiveDateTime{} = date), do: fomat_date(date)

  def date(value) do
    case Date.from_iso8601(value) do
      {:ok, date} ->
        fomat_date(date)

      # not valid iso8601, check if it's already AVETMISS format
      {:error, _} ->
        day = String.slice(value, 0, 2)
        month = String.slice(value, 2, 2)
        year = String.slice(value, 4, 4)
        iso8601 = Enum.join([year, month, day], "-")

        case Date.from_iso8601(iso8601) do
          {:ok, date} -> fomat_date(date)
          {:error, _} -> raise DateError
        end
    end
  end

  defp fomat_date(date) do
    [
      date.day
      |> pad_int(2),
      date.month
      |> pad_int(2),
      date.year
    ]
    |> Enum.join("")
  end

  def has_flag(nil), do: ""
  def has_flag(""), do: ""
  def has_flag(true), do: "Y"
  def has_flag(false), do: "N"
  def has_flag("Y"), do: "Y"
  def has_flag("N"), do: "N"
  def has_flag(items), do: if(Enum.empty?(items), do: "N", else: "Y")

  def bool_flag(nil), do: ""
  def bool_flag(""), do: ""
  def bool_flag(true), do: "Y"
  def bool_flag(false), do: "N"
  def bool_flag("Y"), do: "Y"
  def bool_flag("N"), do: "N"
  def bool_flag(_), do: raise(FlagError)

  def pad_int(int, _) when int == nil do
    ""
  end

  def pad_int(int, length) do
    int
    |> Integer.to_string()
    |> String.pad_leading(length, "0")
  end

  # the order is bit counter intuitive, normally we'd go (Enum, key),
  # but this way makes it more pipe-able as we get the key passed down the chain
  def in_config(key, config) do
    is_valid? =
      config
      |> Enum.map(fn {k, _} -> k end)
      |> Enum.member?(key)

    if is_valid?, do: key, else: raise(ConfigError)
  end

  def state_code(state_name) do
    case state_name do
      "NSW" ->
        1

      "VIC" ->
        2

      "QLD" ->
        3

      "SA" ->
        4

      "WA" ->
        5

      "TAS" ->
        6

      "NT" ->
        7

      "ACT" ->
        8

      _ ->
        ""
    end
  end
end
