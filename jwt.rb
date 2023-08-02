require "jwt"

payload = { data: "test" }

# IMPORTANT: set nil as password parameter
token = JWT.encode payload, nil, "none", { typ: "JWT" }

# eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.eyJkYXRhIjoidGVzdCJ9.
puts token

# Set password to nil and validation to false otherwise this won't work
decoded_token = JWT.decode token, nil, false

# Array
# [
#   {"data"=>"test"}, # payload
#   {"typ"=>"JWT", "alg"=>"none"} # header
# ]
puts decoded_token[0]["data"]

payload = { data: "executing rubocop -s '/Users/enochkang/actualize/practice_sockets/jwt.rb' -f json" }
token = JWT.encode payload, nil, "none", { typ: "JWT" }
pp token

decoded_token = JWT.decode token, nil, false
puts decoded_token[0]["data"]
