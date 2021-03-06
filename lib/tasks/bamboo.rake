require 'bamboohr/sync'

namespace :bamboo do
  desc "Synchronize users with bamboo"
  task sync_users: :environment do
    BambooHR::Sync.users
  end
end
