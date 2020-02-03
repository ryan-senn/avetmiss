defmodule Avetmiss.UtilTest do
  use ExUnit.Case

  import Avetmiss.Util

  alias Avetmiss.Config

  alias Avetmiss.Errors.{LengthError, DateError, ConfigError, FlagError, StateError}

  test "length pads with spaces" do
    assert length("foo", 10) == "foo       "
  end

  test "length raises LengthError if string is too long" do
    assert_raise LengthError, fn ->
      length("foobarfoobar", 10)
    end
  end

  test "name_for_encryption encodes single name as last name" do
    assert name_for_encryption({"first", ""}) == "first, "
  end

  test "name_for_encryption encodes first and last name properly" do
    assert name_for_encryption({"first", "last"}) == "last, first"
  end

  test "date returns empty string for nil" do
    assert date(nil) == ""
  end

  test "date returns empty string for empty string" do
    assert date("") == ""
  end

  test "date formats %Date{} properly" do
    assert date(~D[2019-06-10]) == "10062019"
  end

  test "date formats %NaiveDateTime{} properly" do
    assert date(~N[2019-06-12 04:28:14.000000]) == "12062019"
  end

  test "date formats iso8601 string properly" do
    assert date("2019-06-10") == "10062019"
  end

  test "date returns unchanged date if already in AVETMISS format" do
    assert date("10062019") == "10062019"
  end

  test "date raises DateError if invalid value given" do
    assert_raise DateError, fn ->
      date("jsdf")
    end
  end

  test "has_flag returns empty string for nil" do
    assert has_flag(nil) == ""
  end

  test "has_flag returns empty string for empty string" do
    assert has_flag("") == ""
  end

  test "has_flag returns Y for true" do
    assert has_flag(true) == "Y"
  end

  test "has_flag returns N for false" do
    assert has_flag(false) == "N"
  end

  test "has_flag returns Y for Y" do
    assert has_flag("Y") == "Y"
  end

  test "has_flag returns N for N" do
    assert has_flag("N") == "N"
  end

  test "has_flag returns Y if there are items" do
    assert has_flag(1..3) == "Y"
  end

  test "has_flag returns N if there are no items" do
    assert has_flag([]) == "N"
  end

  test "bool_flag returns empty string for nil" do
    assert bool_flag(nil) == ""
  end

  test "bool_flag returns empty string for empty string" do
    assert bool_flag("") == ""
  end

  test "bool_flag returns Y for true" do
    assert bool_flag(true) == "Y"
  end

  test "bool_flag returns N for false" do
    assert bool_flag(false) == "N"
  end

  test "bool_flag returns Y for Y" do
    assert bool_flag("Y") == "Y"
  end

  test "bool_flag returns N for N" do
    assert bool_flag("N") == "N"
  end

  test "bool_flag raises FlagError for invalid flag" do
    assert_raise FlagError, fn ->
      bool_flag("sdfsfd")
    end
  end

  test "pad_int adds leading zeros" do
    assert pad_int(34, 4) == "0034"
  end

  test "pad_int returns empty string when nil" do
    assert pad_int(nil, 4) == ""
  end

  test "in_config returns empty string for nil" do
    assert in_config(nil, Config.indigenous_statuses()) == ""
  end

  test "in_config returns empty string for empty string" do
    assert in_config("", Config.indigenous_statuses()) == ""
  end

  test "in_config returns key if key exists in config" do
    assert in_config(2, Config.indigenous_statuses()) == 2
  end

  test "in_config raises ConfigError if invalid" do
    assert_raise ConfigError, fn ->
      in_config(10, Config.indigenous_statuses())
    end
  end

  test "state_code returns empty string for nil" do
    assert state_code(nil) == ""
  end

  test "state_code returns empty string for empty string" do
    assert state_code("") == ""
  end

  test "state_code returns code for string value if valid" do
    assert state_code("QLD") == 3
  end

  test "state_code returns existing code if valid" do
    assert state_code(2) == 2
  end

  test "state_code raises StateError if not valid" do
    assert_raise StateError, fn ->
      state_code("54")
    end
  end

  test "accents are removed" do
    assert combine(["Léo Jürgen árboles ça", ["pötætoēs"]]) == "Leo Jurgen arboles capotaetoes"
  end
end
