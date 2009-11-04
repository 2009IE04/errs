# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_errs_base_session',
  :secret      => '3aef05996af4196dbbb730e155162b8c8c285036a63b37185bbd2868725b32958bd0c835cefd0830c3b09d23cd1b1508e0f8b75348fe9e9340fb5c13e5f1f098'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
