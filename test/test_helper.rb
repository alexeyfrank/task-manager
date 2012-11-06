require 'simplecov'
SimpleCov.start


ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require "rails/test_help"
require 'turn/autorun'

class ActiveSupport::TestCase
  include AuthHelper
  include FactoryGirl::Syntax::Methods
  include ActionDispatch::TestProcess

  FactoryGirl.reload
end
