# CTM-tech-test

Jeremy's solution to the CTM tech test.

Original problem spec can be found in `./docs`.

## Getting Started

```bash
rvm use 2.5.1 # Ensure correct Ruby version is installed and active
bundle
rails db:setup
rails db:seed
rails s
# Visit http://localhost:3000 and get going!
```

## Development

```bash
rubocop # Code linting
rspec # Run tests
```

## Developer Notes

- Scaffolding Transactions and Merchants was a bit heavy for the purposes of this demo, but it was done to save time and those methods would be needed anyway for pretty much any kind of imaginable additions to this app.

- Instructions didn't specify an input format or desired output display, so I went with a simple text box for input and output display in reverse chronological transactions to fit the use case of a "banking" type user. Input is a bit painful for anything more than a trivial data set, an obvious next step would be a simple loop to accept JSON or CSV data for populating transactions/merchants.

- String matching for descriptions > merchant is not ultra robust and not intended to be, it's just a minimal implementation that handles the example data set (inclusion of apostrophes, known overlapping company name groups i.e. Uber/ Uber Eats, Amazon / Amazon Prime) without planning for additional tricks in the extra data.
