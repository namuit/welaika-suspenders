require "bundler/setup"
require "pry-byebug"

Bundler.require(:default, :test)

require (Pathname.new(__FILE__).dirname + '../lib/suspenders').expand_path

Dir['./spec/support/**/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.include SuspendersTestHelpers

  config.before(:all) do
    create_tmp_directory
  end

  config.before(:each) do
    FakeHeroku.clear!
    FakeGithub.clear!
  end
end
