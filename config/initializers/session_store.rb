# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_c4c_reg_session',
  :secret      => 'd608397ff56c52537ee7cee4b493e482eaba08a1cc64ff2ad7aad2add8c72f81ed535e71427dec26a6f41f0e2797ab91e8e627f5deb4913a7b530c5cc953e9be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
