to start app in development  
`bundle install`  
`rake db:create db:migrate data:fetch data:import`  
`rackup -p 4567`  

to run tests  
`rake db:migrate RACK_ENV=test`  
`rake`  

this app is deployed at: secret-caverns-10553.herokuapp.com
