const functions = require("firebase-functions")
const admin = require("firebase-admin")

//admin must be initialized only once
admin.initializeApp()

module.exports = {
  admin,
  functions
}