
import { QueryTypes } from 'sequelize';
import db from '../../db/connection';
import bcrypt from 'bcryptjs';

class perfilModel{

    static async obtenerPerfil (){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[obtenerUsuarios] @USR_LOGIN = ? , @USR_ESTADO = ?",
                {type: QueryTypes.RAW,replacements: [,'S']}
            );
        }
        catch{
             
        }
    }

    static async guardarPerfil (){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[obtenerUsuarios] @USR_LOGIN = ? , @USR_ESTADO = ?",
                {type: QueryTypes.RAW,replacements: [,'S']}
            );
        }
        catch{
             
        }
    }

    static async actualizarPerfil (){
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

export default perfilModel;