namespace :hacker_news do
  desc 'Run story fetcher'
  task fetch: :environment do
    UserFetcherJob.perform_later
  end
end
