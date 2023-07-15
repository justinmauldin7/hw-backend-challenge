# README

## Notes

I have chosen to simply re-use the existing IDs from the respective ID columns in the files rather than to create a new index and sub-index on the given IDs. In the real-world, I would probably create new ID keys and translate the given IDs to a separate column or re-map all associations to reference the new key. This would need to be done during the import of subsequent data from other clients/carriers.

I have attempted to make a very basic mapping DSL to smooth over the naming differences between the files. This DSL (while needing significant improvement) would allow me to map multiple input file formats to a standard schema. While I have named the existing schema `Carrier`, `Client`, and `Policy`, likely these would end up being client/carrier-specific schema. While the DSL is "nice", it would be better to make schema mappings configurable outside of code so that onboarding additional clients does not require code change.

I also have some custom typecasting as part of the DSL which is extremely fragile and falls far short of libraries like Dry::Types, but I didn't want to spend a bunch of time working on the type casting or integrating secondary solutions when a simple solution would do given the time constraints. 

The load process can be a bit slow, especially given the size of the Policy data. Ideally, this would be parallelized, but ain't nobody got time for that.

## Running

```bash
bundle
rake db:migrate

# Run tests
rake test

# Run ingest script
./bin/runner.rb
```

If you have an existing DB and want to re-run the import, run `rake db:reset` to wipe the existing data prior to re-importing.
In the real world, the importer would probably do some existing record checks prior to import to avoid collisions.

## Possible Uses

In order to run the code, I am including a simple executable interface in the form of a script. Such a script could be used along side a cron job to pickup files in, say, an SFTP server or incorporated into a file watcher to pick up new files.

One could also write an API that utilizes the code sans-runner script and allows files to be sent over the wire. That effort seemed beyond the scope of the effort.
