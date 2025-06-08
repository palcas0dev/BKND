import { Sequelize }  from 'sequelize';
import { MsSqlDialect } from '@sequelize/mssql';
import * as dotenv from 'dotenv';
dotenv.config({path:'../.env'});
let DBName : string = process.env.BD_NAME||"---";
let DBPass : string = process.env.BD_PASS||"--";
let DBUser : string = process.env.BD_USR ||"--";
let DBHost : string = process.env.BD_HOST||"--";
let DBPort : any = process.env.BD_PORT || 0;


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