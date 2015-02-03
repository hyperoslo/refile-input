# Refile Input

Refile Input gem adds custom input type to formtastic to use refile file uploader. Well, name is self-explanatory and gem is super-simple. It's built upon refile's input helper.

# Installation

Add the gem:

``` ruby
gem "refile_input", require: ["inputs/refile_input"]
```

Use the gem:

``` ruby
form do |f|
  f.input :image, as: :refile
end
```

# Available options

Gem brings support of the following options:

* `direct` determines whether file should be uploaded asynchronously or not. Uploading host might be changed with `host` option. More about it read in refile [documentation](https://github.com/elabs/refile/). Note that refile's js should be included on the page.
* `image_preview` is an option to generate image preview. As arguments it accepts list of refile `attachment_url` options. Read more [here](https://github.com/elabs/refile/#4-rails-helpers).
* all formtastic's options such as `hint`, `label`, etc.

# License

[MIT](LICENSE.txt)
