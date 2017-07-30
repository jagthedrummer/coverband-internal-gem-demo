# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :coverband do
  desc "record coverband coverage baseline capturing custom files"
  task :baseline_custom do
    Coverband::Baseline.record {
        if Rake::Task.tasks.any?{ |key| key.to_s.match(/environment$/) }
          Coverband.configuration.logger.info "invoking rake environment"
          Rake::Task['environment'].invoke
        elsif Rake::Task.tasks.any?{ |key| key.to_s.match(/env$/) }
          Coverband.configuration.logger.info "invoking rake env"
          Rake::Task["env"].invoke
        end

        baseline_files = [File.expand_path('./config/boot.rb',  Dir.pwd),
                          File.expand_path('./config/application.rb', Dir.pwd),
                          File.expand_path('./config/environment.rb', Dir.pwd)]

        baseline_files.each do |baseline_file|
          if File.exists?(baseline_file)
            require baseline_file
          end
        end
        if defined? Rails
          # Include custome Engine files
          files = Coverband::Baseline.exclude_files(Dir.glob("#{InteralFullMountableGem::Engine.paths.path}/app/**/*.rb"))
          files.sort.each do |file|
              begin
                require_dependency file
              rescue Exception
                #ignore
              end
          end
          
          files = Coverband::Baseline.exclude_files(Dir.glob("#{Rails.root}/app/**/*.rb"))
          files.sort.each { |file|
              begin
                require_dependency file
              rescue Exception
                #ignore
              end }
          if File.exists?("#{Rails.root}/lib")
            files = Coverband::Baseline.exclude_files(Dir.glob("#{Rails.root}/lib/**/*.rb"))
            files.sort.each { |file|
              begin
                require_dependency file
              rescue Exception
                #ignoring file
              end}
          end
        end
      }
  end
end
