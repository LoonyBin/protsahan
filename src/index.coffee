express = require 'express'
assets = require 'connect-assets'
http = require('http')

app = express()

app.configure ->
  app.set 'port', (process.env.PORT || 3000)
  app.set 'views', (process.cwd() + '/views')
  app.set 'view engine', 'jade'
  app.use assets()
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(process.cwd() + '/public')

app.configure 'development', ->
  app.use express.errorHandler()

# Get root_path return index view
app.get '/', (req, resp) ->
  resp.render 'index'

app.get '/pages/*', (req, resp) ->
  resp.render 'pages/' + req.params[0]

# Start Server
http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port " + app.get 'port'
