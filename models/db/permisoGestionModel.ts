
import { QueryTypes } from 'sequelize';
import db from '../../db/connection';
import bcrypt from 'bcryptjs';

class permisoGestionModel{

    static async obtenerPermisoGestion (USR_ID:Number,TCG_ID:number,TCG_CODIGO:string){
        try{
            const [results, metadata] = await db.query(
                `EXECUTE [dbo].[obtenerPermisoGestion] 
                @USR_ID = ?,
                @TCG_ID = ?,
                @TCG_CODIGO = ?

                `,
                {type: QueryTypes.RAW,replacements: [
                    USR_ID,
                    (TCG_ID)?TCG_ID:null,
                    (TCG_CODIGO)?TCG_CODIGO:null
                ]}
            );
            return{ success:true, data:results}
        }
        catch{
             return{ success:false, data:""}
        }
    }
    
}

export default permisoGestionModel;