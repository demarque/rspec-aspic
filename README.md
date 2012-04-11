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

In your spec_helper.rb:

```ruby
require 'rspec-aspic'

RSpec.configure do |config|
  config.include RSpecAspic
end
```

Usage
-----

Currently, Aspic only contain one helper.

###the

```ruby
describe "POST /categories" do
  before { post "/categories" }

  the(:last_response) { should be_ok }
  the('Category.count') { should eql 2 }
end
```

*is the equivalent of*

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
end
```

###fixture

```ruby
describe "fixture" do
  fixture :fx, { 'items' => [1,2,3] } do
    it { should_not be_empty }
    the("fx['items']") { should eql [1,2,3] }
  end
end
```

*is the equivalent of*

```ruby
describe "fixture" do
  context "with the fixture fx {'items'=>[1,2,3]}" do
    let(:fx) { {'items'=>[1,2,3]} }

    subject { fx }

    it { should_not be_empty }
    the("fx['items']") { should eql [1,2,3] }
  end
end
```

Copyright
---------

Copyright (c) 2012 De Marque inc. See LICENSE for further details.
