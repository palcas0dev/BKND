
import { QueryTypes } from 'sequelize';
import db from '../../db/connection';
import bcrypt from 'bcryptjs';

class permisoUsuarioModel{

    static async obtenerPermisoUsuario (){
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

export default permisoUsuarioModel;