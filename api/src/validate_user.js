import { promises as fs } from 'fs';

class ValidateUser {
  isvalid(req, res) {
    let userDeviceId = req['id'];
    let seed = req['seed'];
    let time = Date.now();
    let convertedtimenow = Math.floor(time / 1000);
    const filename = 'validation.txt';
    // Get's all entries from the file 
    const data = (async () => {
      return await fs.readFile(filename, { encoding: 'utf-8' });
    });

    // Goes through each to see if it matches and time isn't expired
    // and returns if User is validated or not
    data().then(function (result) {
      return result;
    }).then(function (listdata) {
      var array = listdata.split('\n');
      for (let i of array) {
        var temp = i.split(',');
        if (temp[0].trim() == userDeviceId) {
          var maxtime = parseInt(temp[2].trim()) + 15;
          if (temp[1].trim() == seed && convertedtimenow <= maxtime) {
            return 'valid';
          }
        }
      }
      return 'not_valid';
    }).then(function (result) {
      res.json({ 'valid': result });
    });
  }
}
export default ValidateUser;
