import * as fs from 'fs';
class QrcodeGenrator {
 
  fetchcode(req) {
    ///// Generates random seed
    var result = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for (var i = 0; i < 32; i++) {
      result += characters.charAt(Math.floor(Math.random() *
        charactersLength));
    }
    // saves the seed into a txt file for later validation
    // But production it will be saved into some secure location DB
    let time = Date.now();
    let convertedtime = Math.floor(time / 1000);
    let data = `${req}, ${result}, ${convertedtime}`;
    fs.appendFile('validation.txt', `\n${data},`, function (err) {
      if (err) {
        console.log(err);
      } 
    })
    // Data is sent back to the user
    return {
      seed: result,
      id: req,
      time: convertedtime
    };
  }
}

export default QrcodeGenrator;