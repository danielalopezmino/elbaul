namespace :bundle do
  
  desc "install bundle"
  task :install do
  	sh 'bundle install'
  end

end
