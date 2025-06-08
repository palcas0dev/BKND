import { QueryTypes } from 'sequelize';
import db from '../../db/connection';

class sessionModel {

    static async cerraSesiones(usr_id:number, login:string){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[cerrarSesion] @USR_ID= ? ,@USR_LOGIN = ? ",
                {type: QueryTypes.RAW,replacements: [usr_id,login]}
            );

        }
        catch{}
    }

    static async abrirSesion(usr_id:number, token:string, login:string){
        const [results, metadata] = await db.query(
                "EXECUTE [dbo].[nuevaSesion] @USR_ID= ? ,@TOKEN = ? ,@USR_LOGIN = ? ",
                {type: QueryTypes.RAW,replacements: [usr_id,token,login]}
        );


    }

    static async obtenerSesion(usr_id:number, token:string){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[obtenerSesion] @USR_ID= ? ,@TOKEN = ? ",
                {type: QueryTypes.RAW,replacements: [usr_id,token]}
            );

            if (!results){
                return false;
            }
            return true;
        }
        catch{
            return false;
        }
    }
}
export default sessionModel;

