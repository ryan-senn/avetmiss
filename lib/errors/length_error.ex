defmodule Avetmiss.Errors.LengthError do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  defexception [:message]

  @impl true
  def exception({length, value}) do
    msg = "Value exceeds field length. Length: #{length}, Value: #{value}"
    %Avetmiss.Errors.LengthError{message: msg}
  end
end
