require 'rack'

app = Proc.new do |env|
  puts env.inspect
  ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
end

Rack::Handler::WEBrick.run app
