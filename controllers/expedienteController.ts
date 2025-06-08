import { Response,Request } from "express";
import expedienteModel from "../models/db/expedienteModel";
import responseModel from "../models/responseModel";
let rMvc: responseModel;

export const getExpedientes :any = async(req: Request, res:Response ) => {

    const { 
        expedienteId,
        usr_id,
        fiscal,
        codigo,
        recepcion_incial,
        recepcion_final,
        titulo,
        descripcion,
        estado
    } = req.query;
    try{

        const expedientes:any = await expedienteModel.obtenerExpedientes(parseInt(expedienteId),parseInt(usr_id),fiscal,
        codigo,
        recepcion_incial,
        recepcion_final,
        titulo,
        descripcion,
        estado);
        if (!expedientes.success){
            rMvc  = new responseModel(false,'No se encontro data',{});
            return res.status(404).json( 
                rMvc
            );    
        }
        rMvc  = new responseModel(true,'Expedientes Encontrados',expedientes.data);
        return res.status(200).json( rMvc);
    }
    catch (error){
        rMvc  = new responseModel(false,'Error en el servidor',{error});
        return res.status(500).json( 
            rMvc
         );
    }
}

export const postExpedientes:any = async(req: Request, res:Response ) => {
    const login:any = req.header('x-user');
    try{
        const [
            usr_id,
            fiscal,
            codigo,
            recepcion,
            titulo,
            descripcion,
            estado,
        ] = req.body;
        
        //verificar que exista el usuario y si esta activo
        const nuevoExpediente:any = await expedienteModel.guardarExpediente(parseInt(usr_id),fiscal,codigo,recepcion,titulo,descripcion,estado,login);
        if ( !nuevoExpediente.success ){
            rMvc  = new responseModel(false,'No se pudo insertar nuevo expediente',{});
            return res.status(400).json( rMvc);    
        }
        
        
        rMvc  = new responseModel(true,'Expediente Insertado',nuevoExpediente.data);
        return res.json( rMvc );

    }
    catch (error){
        console.log(error);
        rMvc  = new responseModel(false,'Acceso Denegado',{error});
        return res.status(500).json( rMvc );
    }
}


export const putExpedientes:any = async(req: Request, res:Response ) => {
    const login:any = req.header('x-user');
    try{
        const [estado] = req.body;
        const {id} = req.params;
        
        //verificar que exista el usuario y si esta activo
        const updExpediente:any = await expedienteModel.actualizarEstadoExpediente(parseInt(id),estado,login);
        if ( !updExpediente.success ){
            rMvc  = new responseModel(false,'No se pudo actualizar estado',{});
            return res.status(400).json( rMvc);    
        }
        
        
        rMvc  = new responseModel(true,'Expediente actualizado',{});
        return res.json( rMvc );

    }
    catch (error){
        console.log(error);
        rMvc  = new responseModel(false,'Error al actualizar Estado Expediente',{error});
        return res.status(500).json( rMvc );
    }
}
