# UpWork skills parser
Just for fun, maybe it will be helpful for someone :smile:

## Usage

Very simple:

```ruby
skill_parser = SkillParser.new ('a'..'z')
skill_parser.parse_pages
p skill_parser.data #=> Array[..]
```

## Contributing

1. Fork it ( https://github.com/max-si-m/up_work_skill/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
