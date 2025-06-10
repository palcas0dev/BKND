import { Sequelize }  from 'sequelize';
import { MsSqlDialect } from '@sequelize/mssql';
import * as dotenv from 'dotenv';
dotenv.config({path:'../.env'});
let DBName : string = process.env.BD_NAME||"mptest";
let DBPass : string = process.env.BD_PASS||"casa123.";
let DBUser : string = process.env.BD_USR ||"sa";
let DBHost : string = process.env.BD_HOST||"DTUNCHEZ";
let DBPort : any = process.env.BD_PORT || 1433;


// const db = new Sequelize(DBName,DBUser,DBPass,{
//     host: DBHost,
//     port: DBPort,
//     dialect:'mysql',
//     //logging: false
// });

const db = new Sequelize(DBName,DBUser,DBPass,{
    dialect: "mssql",
    host: DBHost,
    port: 1433,
    database: DBName,
    dialectOptions: {
      options: {
        encrypt: true, // importante si usas Azure u otras configuraciones seguras
        trustServerCertificate: true, // si estás en desarrollo
      }
    }
  });

export default db;