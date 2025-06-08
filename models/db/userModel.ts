
import { QueryTypes } from 'sequelize';
import db from '../../db/connection';
import bcrypt from 'bcryptjs';

class userModel{
        
    static async login(login:string , pass:string){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[obtenerUsuarios] @USR_LOGIN = ? , @USR_ESTADO = ?",
                {type: QueryTypes.RAW,replacements: [login,'S']}
            );
            const validarPass = bcrypt.compareSync(pass, results.USR_PASS);
            if(!validarPass){
                return{
                    success:false,
                    id: 0,
                    perfil_id:0,
                    perfil:"",
                    usr_login:"",
                    usr_nombre:""
                };
            }
            return {
                success:true,
                id: results.USR_ID,
                perfil_id:results.PERFIL_ID,
                perfil:results.PERFIL,
                usr_login:results.USR_LOGIN,
                usr_nombre:results.USR_NOMBRE
            };
        }
        catch (error) {
            return{
                    success:false,
                    id: 0,
                    perfil_id:0,
                    usr_login:"",
                    usr_nombre:""
                };
        }
    }

    static async obtenerUsuario (id:any,perfil_id:any,login:any, nombre:any,estado:any){
        try{
            const [results, metadata] = await db.query(
                "EXECUTE [dbo].[obtenerUsuarios] ,@USR_ID = ?,@PERFIL_ID = ?,@USR_LOGIN	= ?,@USR_NOMBRE = ?,@USR_ESTADO = ? ",
                {type: QueryTypes.RAW,replacements: [
                    (!id)?id:null,
                    (!perfil_id)?perfil_id:null,
                    (!login)?login:null,
                    (!nombre)?nombre:null,
                    (!estado)?estado:null
                ]}
            );
            return {
                success:true,
                results
            }
        }
        catch{
            return {
                success:true,
                results:undefined
            }    
        }
    }
    
}

export default userModel;