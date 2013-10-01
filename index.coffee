#!/usr/bin/env coffee

Hapi = require 'hapi'

hostname = '0.0.0.0'
port = process.env.PORT || 8000
port = parseInt port, 10 # HOTFIX for Hapi on Heroku

# Create a server with a host and port
server = Hapi.createServer server, port

# Add the route
server.route
  method: 'GET'
  path: '/{path*}'
  handler:
    directory:
      path: __dirname + '/public'
      listing: false
      index: true

# Start the server
server.start ->
  console.log "# Started at #{server.info.uri}"
