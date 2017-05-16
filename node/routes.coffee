Router     = require('express').Router

class SiteRouter
  module.exports = SiteRouter

  constructor: (@app)->
    @router = new Router()
    @_initRoutes()

  _initRoutes: =>
    @router.get '/', (req, res)->
      res.render 'index'
