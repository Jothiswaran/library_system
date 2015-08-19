# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_library_system_session',
  :secret      => 'a48ce05c4b36146f2b42f35979747d203b7323afa4e2995d4ace2e1d45b5ad19b0aa5bc5e1f04fbc99c87032320c9d952fcf33f0c4d4e76cebc6eda7adbd1d7c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
