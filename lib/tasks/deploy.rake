namespace :deploy do
  
  desc "Deploy all"
  task :all => ["bundle:install", :db, :web] do

  end  	

  desc "Deploy web server"
  task web: :environment do
  	sh "rails s"
  end

  desc "Deploy the migrations to db"
  task db: :environment do
  	Rake::Task["db:migrate"].invoke
  end

end
