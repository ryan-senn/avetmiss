defmodule Avetmiss.Errors.DateError do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  defexception [:message]

  @impl true
  def exception(value) do
    msg = "Given value is not a valid date. Value: #{value}"
    %Avetmiss.Errors.DateError{message: msg}
  end
end
