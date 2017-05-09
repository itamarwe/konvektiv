#!/usr/bin/env coffee
express               = require 'express'
http                  = require 'http'

require 'coffee-script'

app = express()
app.use(express.static('public'))

server = http.createServer app
server.listen 8080
