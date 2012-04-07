RSpec Aspic
===============

Various tools for RSpec

Install
-------

```
gem install rspec-aspic
```

Rails 3
-------

In your Gemfile:

```ruby
group :test do
  gem "rspec-aspic"
end
```

Usage
-----

Currently, Aspic only contain one helper.

**the**

```ruby
describe "POST /categories" do
  before { post "/categories" }

  the(:last_response) { should be_ok }
  the('Category.count') { should eql 2 }
end```

is the equivalent of ...

```ruby
describe "POST /categories" do
  before { post "/categories" }

  context "last_response" do
    subject { last_response }
    it { should be_ok }
  end

  context "Category.count" do
    subject { Category.count }
    it { should eql 2 }
  end
end```

Copyright
---------

Copyright (c) 2012 De Marque inc. See LICENSE for further details.
