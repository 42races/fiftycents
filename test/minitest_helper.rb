ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'database_cleaner'
require 'minitest/reporters'
require 'active_support/testing/setup_and_teardown'

Minitest::Reporters.use!
DatabaseCleaner.strategy = :deletion

class MiniTest::Spec
  before(:each) { DatabaseCleaner.clean }

  include FactoryGirl::Syntax::Methods
end

class ControllerTest < Minitest::Spec
  include Rails.application.routes.url_helpers
  include ActiveSupport::Testing::SetupAndTeardown
  include ActionController::TestCase::Behavior
  include Devise::TestHelpers
  register_spec_type(/Controller$/, self)

  before do
    @routes = Rails.application.routes
  end

  def login_user
    user = create(:user)
    user.confirm!
    sign_in(user)
    user
  end
end
