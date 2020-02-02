defmodule Avetmiss.Errors.DateError do
  defexception [:message]

  @impl true
  def exception(value) do
    msg = "Given value is not a valid date. Value: #{value}"
    %Avetmiss.Errors.DateError{message: msg}
  end
end
