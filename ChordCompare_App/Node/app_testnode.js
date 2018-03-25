
// Test nodejs

let con = require('./app_connect.js')

function test()
{
  con.openDB()
  con.getRomanNames(r => console.log(r))
  con.closeDB()
}
test()
