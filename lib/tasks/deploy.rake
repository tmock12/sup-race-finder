require 'paratrooper'

namespace :deploy do
  desc 'Deploy app in production environment'
  task :production do
    deployment = Paratrooper::Deploy.new("supracefinder") do |deploy|
      deploy.tag = 'production'
    end

    deployment.deploy
  end
end
