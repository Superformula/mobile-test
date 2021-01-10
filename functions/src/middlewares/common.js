const cookieParser = require("cookie-parser")()
const cors = require('cors')({origin: "*"})
const compression = require('compression')()

/** @param { import('express').Express} app */
module.exports = app => {
  app.use(cors)
  app.use(compression)
  app.use(cookieParser)
}