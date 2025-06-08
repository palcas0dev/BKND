
import { QueryTypes } from 'sequelize';
import db from '../../db/connection';
import {isValidDate} from '../../helpers/tools';

class expedienteModel{

    static async obtenerExpedientes (
        ID: number,
        USR_ID: number,
        FISCAL: string,
        CODIGO: string,
        RECEPCION_INCIAL: string,
        RECEPCION_FINAL: string,
        TITULO: string,
        DESCRIPCION: string,
        ESTADO: string
    ){
        try{
            
            const [results, metadata] = await db.query(
                `EXECUTE [dbo].[obtenerExpedientes] 
                    @TNE_ID = ?,
                    @TAU_ID = ?,
                    @tne_nombre_fiscal = ?,
                    @tne_codigo = ?,
                    @tne_fecha_recepcion_inicial = ?,
                    @tne_fecha_recepcion_final = ?,
                    @tne_titulo = ?,
                    @tne_descripcion = ?,
                    @tne_estado = ?
                `,
                {type: QueryTypes.RAW,replacements: [
                    (!ID)?null:ID,
                    (!USR_ID)?null:USR_ID,
                    (FISCAL)?FISCAL:null,
                    (CODIGO)?CODIGO:null,
                    (isValidDate(RECEPCION_INCIAL))?RECEPCION_INCIAL:null,
                    (isValidDate(RECEPCION_FINAL))?RECEPCION_FINAL:null,
                    (TITULO)?TITULO:null,
                    (DESCRIPCION)?DESCRIPCION:null,
                    (ESTADO)?ESTADO:null
                ]}
            );
            return {
                success :true,
                data:results
            }
        }
        catch (error){
             return{
                success:false,
                data:""
             }
        }
    }

    static async guardarExpediente (
        USR_ID: number,
        FISCAL: string,
        CODIGO: string,
        RECEPCION: string,
        TITULO: string,
        DESCRIPCION: string,
        ESTADO: string,
        LOGIN:string
    ){
        try{
            const [results, metadata] = await db.query(
                `EXECUTE [dbo].[guardarExpediente]
                @TAU_ID =?,
                @tne_nombre_fiscal =?,
                @tne_codigo =?,
                @tne_fecha_recepcion =?,
                @tne_titulo =?,
                @tne_descripcion =?,
                @tne_estado =?,
                @USR_LOGIN =?
                `,
                {type: QueryTypes.SELECT,replacements: [
                    (USR_ID<1)?null:USR_ID,
                    (FISCAL.length >0)?FISCAL:null,
                    (CODIGO.length >0)?CODIGO:null,
                    (isValidDate(RECEPCION))?RECEPCION:null,
                    (TITULO.length >0)?TITULO:null,
                    (DESCRIPCION.length >0)?DESCRIPCION:null,
                    (ESTADO.length >0)?ESTADO:null,
                    LOGIN
                ]}
            );
            return{
                success:true,
                data:results
            }
        }
        catch{
             return{
                success:false,
                data:""
            }
        }
    }

    static async actualizarEstadoExpediente (
        ID: number,
        ESTADO: string,
        LOGIN: string
    ){
        try{
            const [results, metadata] = await db.query(
                `EXECUTE [dbo].[actualizarEstadoExpediente] 
                    @TNE_ID = ?,
                    @tne_estado = ?,
                    @USR_LOGIN = ?
                `,
                {type: QueryTypes.RAW,replacements: [
                    ID,ESTADO,LOGIN
                ]}
            );
            return true;
        }
        catch{
             return false;
        }
    }
    
}

export default expedienteModel;