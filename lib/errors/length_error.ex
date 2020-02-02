defmodule Avetmiss.Errors.LengthError do
  defexception [:message]

  @impl true
  def exception({length, value}) do
    msg = "Value exceeds field length. Length: #{length}, Value: #{value}"
    %Avetmiss.Errors.LengthError{message: msg}
  end
end
