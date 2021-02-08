exports.genSeed = function(length) {
   var result = '';
   var characters='abcdefghijklmnopqrstuvwxyz0123456789';
   for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * characters.length));
   }
   return result;
}