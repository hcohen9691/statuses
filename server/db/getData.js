const sql = require('mssql')
const castParam = require('../castParameters')

var config = {
    user: 'Node',
    password: '2345',
    server: 'DESKTOP-DM144K9',
    databse: 'status',
    synchronize: true,
    options: { "trustServerCertificate": true }
}

module.exports = function MyObject(procedure) {
   // var table = col

    // this.findAll = async () => {
    //     let connaction = await sql.connect(config)
    //     let result = await connaction.request().query(`select * from ${table}`)
    //     console.log(result)
    //     return result.recordset
    // }

    this.prop = async (obj) => {
        let result;
        const param = castParam(obj)
        try {console.log(`EXEC ${procedure} ${param}`);
            let connaction = await sql.connect(config)
            result = await connaction.request().query(`EXEC ${procedure} ${param}`)
        }
        catch (err) {
            console.log(err);
        }
        // if (result.recordset.length == 0)
        //     return "undefined"
         return result.recordset


    }
}