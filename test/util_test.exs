defmodule Avetmiss.UtilTest do
  use ExUnit.Case

  import Avetmiss.Util

  test "length pads with spaces" do
    assert length("foo", 10) == "foo       "
  end

  test "length raises exception if string is too long" do
    assert_raise RuntimeError, "String exceeds permitted length", fn ->
      length("foobarfoobar", 10)
    end
  end

  test "name_for_encryption encodes single name as last name" do
    assert name_for_encryption("foo") == "foo, "
  end

  test "name_for_encryption encodes first and last name properly" do
    assert name_for_encryption("foo", "bar") == "bar, foo"
  end

  test "date formats string properly" do
    assert date(~D[2019-06-10]) == "10062019"
  end

  test "date returns nil as empty string" do
    assert date(nil) == ""
  end

  test "has_flag returns Y if there are items" do
    assert has_flag(1..3) == "Y"
  end

  test "has_flag returns N if there are no items" do
    assert has_flag([]) == "N"
  end

  test "has_flag returns empty string for nil" do
    assert has_flag(nil) == ""
  end

  test "bool_flag returns Y for true" do
    assert bool_flag(true) == "Y"
  end

  test "bool_flag returns N for false" do
    assert bool_flag(false) == "N"
  end

  test "bool_flag returns empty string for nil" do
    assert bool_flag(nil) == ""
  end

  test "pad_int adds leading zeros" do
    assert pad_int(34, 4) == "0034"
  end

  test "pad_int returns empty string when nil" do
    assert pad_int(nil, 4) == ""
  end
end
