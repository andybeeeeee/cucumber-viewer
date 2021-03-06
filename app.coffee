###
 Module dependencies.
###

express = require('express')
http    = require('http')
path    = require('path')

router = require('./routes/router')

global.basePath = process.env.BASE_PATH || ''
port = process.env.PORT || 3000

app = express()

# routes
router.apply(app)

app.set 'port', port
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.use express.favicon()
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser('your secret here')
app.use express.session()

app.use require('stylus').middleware(__dirname + '/public')
app.use express.static(path.join(__dirname, 'public'))

app.use app.router

# Development only
if app.get('env') is 'development'
  app.use(express.errorHandler())

# Start server
http.createServer(app).listen port, ->
  console.log 'Express server listening on port ' + port
