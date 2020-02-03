defmodule Avetmiss.Errors.ConfigError do
  @moduledoc """
  This AVETMISS library has been developed by [Tradie Training](https://tt.edu.au)
  """
  defexception [:message]

  @impl true
  def exception({config, key}) do
    msg = "Given key not found in AVETMISS config. Config: #{inspect(config)}, Key: #{key}"
    %Avetmiss.Errors.ConfigError{message: msg}
  end
end
