module FeatureHelper
  def ensure_on(path)
    visit(path) unless current_path == path
  end
end

RSpec.configure do |config|
  config.include FeatureHelper, :type => :feature
end