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
   

    this.prop = async (obj) => {
        let result;
        const param = castParam(obj)
        try {
            console.log(`EXEC ${procedure} ${param}`);
            let connaction = await sql.connect(config)
            result = await connaction.request().query(`EXEC ${procedure} ${param}`)
        }
        catch (err) {
            console.log(err);
        }
        


    }

}