
run ->(env){ [200, {"Content-Type" => "text/plain"}, ["Racked!"]] }

run ->(env){
  status  = 200
  headers = {"Content-Type" => "text/plain", "ada" => "0.0.1"}
  body    = env.collect{ |key, value| "#{key}: #{value}\n" }

  [status, headers, body]
}
