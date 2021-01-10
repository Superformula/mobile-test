const consign = require("consign")
const app = require("express")()
const { functions } = require("../services/firebase")

consign({
  cwd: 'src',
  extensions: [ '.js', '.json', '.node', '.ts' ]
})
.include("middlewares")
.then("routes")
.into(app)

exports.api = functions.https.onRequest(app)