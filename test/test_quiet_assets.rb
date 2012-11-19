require 'rails'
require 'tzinfo'
require 'test/unit'
require 'active_support'
require 'action_controller'
require 'active_support/testing/isolation'
require File.expand_path('../../lib/quiet_assets', __FILE__)

class HomeController < ActionController::Base
  def index
    render :text => 'Hi there!'
  end
end

class HelperTest < Test::Unit::TestCase
  include ActiveSupport::Testing::Isolation

  attr_reader :app

  def setup
    @stdout = StringIO.new

    @app = Class.new(Rails::Application) do
      routes.append { 
        root :to => 'home#index'
        get 'assets/picture' => 'home#index'
      }

      config.active_support.deprecation = :notify
      config.secret_token = '685e1a60792fa0d036a82a52c0f97e42'
    end

    @app.initialize!

    Rails.logger = Logger.new(@stdout)
    Rails.logger.formatter = ->(s, d, p, m) { "#{m}\n" }
  end

  def test_assets_url
    app.call Rack::MockRequest.env_for('/assets/picture')
    @stdout.rewind
    assert_equal '', @stdout.read
  end

  def test_regular_url
    app.call Rack::MockRequest.env_for('/')
    @stdout.rewind
    assert_match /\A\n\nStarted GET \"\/\" for  at/, @stdout.read
  end
end
