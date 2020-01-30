#Elixir library to generate AVETMISS reports

## Installation

Add `avetmiss` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:avetmiss, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
import Avetmiss.Report
alias Avetmiss.Nat.{Nat010, Nat020, Nat030, Nat060 ...}

# define your generate_report function that exports all required files
def generate_report(destination) do
  files = [
    {'./nat00010.txt', generate_nat010()},
    {'./nat00020.txt', generate_nat020()},
    {'./nat00030.txt', generate_nat030()},
    {'./nat00060.txt', generate_nat060()},
    ...
  ]

  :zip.create("#{destination}/report.zip", files)
end

defp generate_nat010() do
  # collect the necessary data (typically from the db)
  rtos = ...

  # create your rows by feeding a Nat010 Struct into the nat010_row function
  Enum.map(rtos, fn rto ->
    nat010_row(%Nat010{
          training_organisation_id: rto.id,
          training_organisation_name: rto.name,
          contact_name: rto.contact_name,
          telephone_number: rto.telephone_number,
          facsimile_number: rto.facsimile_number,
          email_address: rto.email_address
        })
    )
    # join your rows with Line Feeds to create the file content
    |> Enum.join("\n")
end

# ... repeat for other NAT files
```

## NAT Structs
As we saw above, the NAT Structs are at the core of the library's API. They are located in the `./lib/nat` folder.

I recommend to alias the NAT Structs that you need:
```elixir
alias Avetmiss.Nat.{Nat010, Nat020, Nat030, Nat060 ...}
```

Once imported, all that's left to do is populate them with your data and feed them into the `nat*_row` functions as seen above.

## NAT row functions
The NAT Structs are then fed into `nat*_row` functions located in `./lib/report.ex`. I recommend to import them:
```elixir
import Avetmiss.Report
```

## AVETMISS config
There is a config file exposed in `./lib/config.ex` in a `[{code, name}]` list of tuple format.

It exposes the standard AVETMISS config that you'll need for reporting such as genders, indigenous statuses, disabilities etc.

## About
To learn more about what AVETMISS is and how it works, read [What is AVETMISS, and how does it work? A technical dive](https://rtoadvisors.com.au/articles/what-is-avetmiss)

Developed for the needs of the [Tradie Training White Card course](https://tt.edu.au).

The White Card course is a mandatory requirement for anyone whishing to enter construction sites in Australia. It teaches basic safety concepts such as identifying hazards, identifying risks, fitting & wearing PPE etc.

[Tradie Training is a registered training organisation in Brisbane](https://training.gov.au/Organisation/Details/45555), Australia.

