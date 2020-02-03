defmodule Avetmiss.Errors.FlagError do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  defexception [:message]

  @impl true
  def exception(value) do
    msg = "Given value can't be interpreted as AVETMISS flag. Value: #{value}"
    %Avetmiss.Errors.FlagError{message: msg}
  end
end
