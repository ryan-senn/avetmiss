defmodule Avetmiss.Errors.StateError do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  defexception [:message]

  @impl true
  def exception(value) do
    msg = "Given value is not a valid state. Value: #{value}"
    %Avetmiss.Errors.StateError{message: msg}
  end
end
