
import { QueryTypes } from 'sequelize';
import db from '../../db/connection';
import bcrypt from 'bcryptjs';

class gestionModel{

    static async obtenerGestion (){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[obtenerUsuarios] @USR_LOGIN = ? , @USR_ESTADO = ?",
                {type: QueryTypes.RAW,replacements: [,'S']}
            );
        }
        catch{
             
        }
    }

    static async guardarGestion (){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[obtenerUsuarios] @USR_LOGIN = ? , @USR_ESTADO = ?",
                {type: QueryTypes.RAW,replacements: [,'S']}
            );
        }
        catch{
             
        }
    }

    static async actualizarGestion (){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[obtenerUsuarios] @USR_LOGIN = ? , @USR_ESTADO = ?",
                {type: QueryTypes.RAW,replacements: [,'S']}
            );
        }
        catch{
             
        }
    }
    
}

export default gestionModel;