require 'rubygems'

require 'rails'
require 'rails/all'

require 'test/unit'
require 'active_support/testing/isolation'

require File.expand_path('../../lib/quiet_assets', __FILE__)

class HomeController < ActionController::Base
  def index
    render :text => 'Hi there!'
  end
end

class HelperTest < Test::Unit::TestCase
  include ActiveSupport::Testing::Isolation

  attr_reader :app, :output

  def setup
    @output = StringIO.new

    # Ruby 1.8 doesn't call self.inherited inside Class.new
    # Config and routes are unreacheable inside the block here.
    @app = Class.new(Rails::Application)

    app.configure do
      config.active_support.deprecation = :notify
      config.secret_token = '685e1a60792fa0d036a82a52c0f97e42'
      config.eager_load = false

      routes {
        root :to => 'home#index'
        get 'assets/picture' => 'home#index'
        get 'quiet/this' => 'home#index'
      }
    end
  end

  def initialize!(&block)
    app.configure(&block) if block_given?

    app.initialize!

    Rails.logger = Logger.new(output)
    Rails.logger.formatter = lambda { |s, d, p, m| "#{m}\n" }
  end

  def request(uri)
    Rack::MockRequest.env_for(uri)
  end

  def test_assets_url_with_option_by_default
    initialize!

    app.call request('/assets/picture')

    assert_equal '', output.string
  end

  def test_assets_url_with_turned_on_option
    initialize! { config.quiet_assets = true }

    app.call request('/assets/picture')

    assert_equal '', output.string
  end

  def test_in_multi_thread_env
    initialize! { config.quiet_assets = true }

    th1 = Thread.new do
      sleep 0.1
      app.call request('/assets/picture')
    end

    th2 = Thread.new do
      sleep 0.1
      app.call request('/')
    end

    th3 = Thread.new do
      sleep 0.1
      app.call request('/assets/picture')
    end

    [th1, th2, th3].map { |i| i.join }

    n = output.string.lines.select{|i| i.match(/Started GET "\/"/) }

    assert_equal n.size, 1
  end

  def test_assets_url_with_turned_off_option
    initialize! { config.quiet_assets = false }

    app.call request('/assets/picture')

    assert_match(/Started GET \"\/assets\/picture\" for  at/, output.string)
  end

  def test_regular_url
    initialize!

    app.call request('/')

    assert_match(/Started GET \"\/\" for  at/, output.string)
  end

  def test_full_url_with_couple_slashes
    initialize!

    app.call request('http://some-url.com//assets/picture')

    assert_equal '', output.string
  end

  def test_quiet_url
    initialize!

    app.call request('/quiet/this')

    assert_match(/Started GET \"\/quiet\/this\" for  at/, output.string)
  end

  def test_quiet_url_with_paths_option_as_string_equality
    initialize! { config.quiet_assets_paths = '/quiet/' }

    app.call request('/quiet/this')

    assert_equal '', output.string
  end

  def test_quiet_url_with_paths_option_as_string_appending
    initialize! { config.quiet_assets_paths << '/quiet/' }

    app.call request('/quiet/this')

    assert_equal '', output.string
  end

  def test_quiet_url_with_paths_option_as_array
    initialize! { config.quiet_assets_paths += ['/quiet/'] }

    app.call request('/quiet/this')

    assert_equal '', output.string
  end

end
