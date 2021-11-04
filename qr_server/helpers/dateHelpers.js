/**
 * Function used to convert date objects into ISO strings
 * @param  {} dateToConvert This should be a date object.
 * @returns {string} Return date object converted to ISO string
 */
module.exports.dateToString = (dateToConvert) => {
  const convertedDate = new Date(
    dateToConvert.getTime() - dateToConvert.getTimezoneOffset() * 60000
  )
    .toISOString()
    .split("T")[0];
  return convertedDate;
};

/**
 * Function used to convert date in the string ISO format yyyy-mm-dd to the string US readable format mm/dd/yyyy
 * @param  {string} dateToFormat Date in the string format yyyy-mm-dd.
 * @returns {string} Return date in the string format mm/dd/yyyy
 */
module.exports.dateToStringUSFormat = (stringISODate) => {
  const stringISODateSplit = stringISODate.split("-");
  const stringUSDate = `${stringISODateSplit[1]}/${stringISODateSplit[2]}/${stringISODateSplit[0]}`;
  return stringUSDate;
};
/**
 * @param  {int} minutes Date in the string format yyyy-mm-dd.
 * @returns A date object for the specificied date and time""
 **/
module.exports.dateWhithMinutes = (minutes) => {
  var oldDateObj = new Date();
  var newDateObj = new Date();
  newDateObj.setTime(oldDateObj.getTime() + minutes * 60 * 1000);
  console.log(newDateObj);
  return newDateObj;
};

/**
 * Returns tomorrows date at a specific time
 * @param  {Integer} hour Specific hour from 0 to 24, by default 7
 * @param  {} minute Specific minute from 0 to 60, by default 0
 * @param  {} second Specific second from 0 to 60, by default 0
 * @returns A date object for the specificied date and time""
 */
module.exports.tomorrowDateAtSpecificTime = ({
  hour = 0,
  minute = 10,
  second = 0,
} = {}) => {
  const today = new Date();
  const tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);
  tomorrow.setHours(hour);
  tomorrow.setMinutes(minute);
  tomorrow.setMilliseconds(second);
  return tomorrow;
};

/**
 * Returns tomorrows date as string ISO format yyyy-mm-dd
 * @returns A date as ISO string in the format yyyy-mm-dd""
 */
module.exports.tomorrowDateAsISOString = () => {
  const today = new Date();
  const tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);
  const convertedDate = new Date(
    tomorrow.getTime() - tomorrow.getTimezoneOffset() * 60000
  )
    .toISOString()
    .split("T")[0];
  return convertedDate;
};
