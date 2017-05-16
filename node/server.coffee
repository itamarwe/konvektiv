#!/usr/bin/env coffee
express               = require 'express'
http                  = require 'http'
assets                = require 'connect-assets'
async                 = require 'async'
Routes                = require './routes'

NODE_PORT = 8080

require 'coffee-script'

app = express()
app.set('view engine', 'pug')
app.use(express.static('public'))
app.use assets
  paths: [
    'public/css'
    'public/img'
    'public/js'
  ]

router = (new Routes(app)).router
app.use '/', router

server = http.createServer app
server.listen NODE_PORT, (err)->
  if err?
    console.error err
  console.log "Server is listenting on port #{NODE_PORT}"

shutdownTasks = [
    server.close.bind(server)
  ]

process.on 'SIGINT', ->
  console.log 'Shutting down'
  async.parallel shutdownTasks, (err)->
    if err?
      console.error err
    console.log "Finished shutting down"
    process.exit()
