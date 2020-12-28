require_relative "routes/signup"
require_relative "routes/sessions"
require_relative "routes/equipos"

require_relative "libs/mongo"
require_relative "helper"

require "digest/md5"

def to_md5(pass)
  return Digest::MD5.hexdigest(pass)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do
    users = [
      { name: "Alexandre Nunes", email: "alexandrenunes@yahoo.com", password: to_md5("Teste@123") },
      { name: "Alexandre Filho", email: "alexandrefilho@yahoo.com", password: to_md5("Teste@123") },
      { name: "Murillo Nunes", email: "murillo@yahoo.com", password: to_md5("Teste@123") },
      { name: "Francielly Nunes", email: "fran@yahoo.com", password: to_md5("Teste@123") },
      { name: "Rosemary Nunes", email: "rose@yahoo.com", password: to_md5("Teste@123") },
    ]

    MongoDB.new.drop_danger
    MongoDB.new.insert_users(users)
  end
end
