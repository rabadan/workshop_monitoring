
namespace :top_shop do
  desc "Generate users and orders"
  task generate_everything: :environment do
    GenerateEverythingJob.perform_now
  end
end
