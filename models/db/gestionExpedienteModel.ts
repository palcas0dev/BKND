
import { QueryTypes } from 'sequelize';
import db from '../../db/connection';
import bcrypt from 'bcryptjs';
import { isValidDate } from '../../helpers/tools';

class gestionExpedienteModel{

    static async obtenerGestionesExpedientes (){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[obtenerUsuarios] @USR_LOGIN = ? , @USR_ESTADO = ?",
                {type: QueryTypes.RAW,replacements: [,'S']}
            );
        }
        catch{
             
        }
    }

    static async guardarGestionExpediente (
        TNE_ID : number,
        TCG_ID : number,
        TAU_ID : number,
        tneg_fecha_gestion : string,
        tneg_mensaje : string,
        tneg_info : string,
        tneg_estado : string,
        USR_LOGIN : string,
    ){
        try{
            
            const [results, metadata] = await db.query(
                `EXECUTE [dbo].[obtenerUsuarios] 
                    @TNE_ID=?,
                    @TCG_ID=?,
                    @TAU_ID=?,
                    @tneg_fecha_gestion=?,
                    @tneg_mensaje=?,
                    @tneg_info=?,
                    @tneg_estado=?,
                    @USR_LOGIN=?
                `,
                {type: QueryTypes.RAW,replacements: [
                    (TNE_ID	> 0)?TNE_ID:null,
                    (TCG_ID	> 0)?TCG_ID:null,
                    (TAU_ID	> 0)?TAU_ID:null,
                    (isValidDate(tneg_fecha_gestion))?tneg_fecha_gestion:null,
                    tneg_mensaje,
                    tneg_info,
                    tneg_estado,
                    USR_LOGIN,
                ]}
            );
            return {success:true, data:results};
        }
        catch{
             return {success:false, data:""};
        }
    }

    
}

export default gestionExpedienteModel;