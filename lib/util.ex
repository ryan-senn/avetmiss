defmodule Avetmiss.Util do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  alias Avetmiss.Config
  alias Avetmiss.Errors.{LengthError, DateError, ConfigError, FlagError, StateError}

  def length(string, length) do
    string = to_string(string)

    cond do
      String.length(string) > length ->
        raise LengthError, {length, string}

      true ->
        String.pad_trailing(string, length, " ")
    end
  end

  # if the user has a single name, report it as the last name
  def name_for_encryption({name, nil}), do: "#{name}, "
  def name_for_encryption({name, ""}), do: "#{name}, "

  def name_for_encryption({first_name, last_name}) do
    name_for_encryption = "#{last_name}, #{first_name}"

    # truncate to 60 characters if too long
    #
    # See page 99: https://www.ncver.edu.au/__data/assets/pdf_file/0022/62383/AVETMISS-Data-element-definitions-2_3-PORTAL-VERSION.pdf
    # If the full name for encryption with commas and spaces exceeds 60 characters, enter client’s full name in the order above and truncate at 60 characters.
    String.slice(name_for_encryption, 0, 60)
  end

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
          {:error, _} -> raise DateError, value
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
  def bool_flag(value), do: raise(FlagError, value)

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
  def in_config(nil, _), do: ""
  def in_config("", _), do: ""

  def in_config(key, config) do
    is_valid? =
      config
      |> Enum.map(fn {k, _} -> k end)
      |> Enum.member?(key)

    if is_valid?, do: key, else: raise(ConfigError, {config, key})
  end

  def state_code(nil), do: ""
  def state_code(""), do: ""

  def state_code(value) do
    valid_code? =
      Config.states()
      |> Enum.map(fn {code, _} -> code end)
      |> Enum.member?(value)

    if valid_code? do
      value
    else
      code =
        Config.states()
        |> Enum.reduce([], fn {code, name}, acc ->
          if String.downcase(name) == String.downcase(value), do: [code] ++ acc, else: acc
        end)
        |> Enum.at(0)

      if code != nil do
        code
      else
        raise StateError, value
      end
    end
  end

  def gender_flag(key) do
    case key do
      1 -> "M"
      2 -> "F"
      3 -> "@"
    end
  end

  def combine(fields) do
    fields
    |> Enum.map(fn field -> WordSmith.remove_accents(field) end)
    |> Enum.join("")
  end
end
