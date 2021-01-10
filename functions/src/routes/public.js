const QRCode = require('qrcode')

const ROUTES = {
  seed: "/seed"
}

module.exports = app => {
  
  //returns a seed that can be used to generate a QR code
  app.get(ROUTES.seed, async (req, res) => {
    try {
      const name = req.query.name
      const seed = await generateQRCodeSeed(name)
      const expires_at = generateExpirationTime()
      const response = {
        seed,
        expires_at
      }
      res.res
      res.send(response)
    } catch(error) {
      console.error(error)
      res.status(500).send({ error: error.toString() })
    }
  })

}

const generateQRCodeSeed = async text => {
  try {
    //TODO base64 is not the required format
    return await QRCode.toDataURL(text);
  } catch(error) {
    throw error
  }
}

const generateExpirationTime = () => {
  try {
    const now = new Date()
    now.setSeconds(now.getSeconds() + 30)
    return now.toJSON()
  } catch(error) {
    throw error
  }
}