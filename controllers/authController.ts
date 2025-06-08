import { Response,Request } from "express";
import jwt from 'jsonwebtoken'
import userModel from "../models/db/userModel";
import sessionModel from "../models/db/sessionModel";
import { generarJWT } from "../helpers/generarJwtHelper";
import responseModel from "../models/responseModel";
let rMvc: responseModel;

export const login :any = async(req: Request, res:Response ) => {

    const { login, pass, pass_issue} = req.body;
    try{

        const validarLogin:any = await userModel.login(login, pass);
        //Generar JWT
        if (!validarLogin.success){
            rMvc  = new responseModel(false,'Acceso Denegado',{});
            return res.status(401).json( rMvc);
        }
        const token:any = await generarJWT( validarLogin.id );
        ////Cerrar otras sesiones
        await sessionModel.cerraSesiones(validarLogin.id,login);

        // //Agregar nueva sesion
        await sessionModel.abrirSesion(validarLogin.id,token,login);

        rMvc  = new responseModel(true,'Sesion Iniciada',{
            token,
            login:validarLogin.usr_login,
            nombre:validarLogin.usr_nombre,
            perfil:validarLogin.perfil
        });
        return res.status(200).json( rMvc);
    }
    catch (error){
        rMvc  = new responseModel(false,'Acceso Denegado',{error});
        return res.status(500).json( 
            rMvc
         );
    }
}

export const logout:any = async(req: Request, res:Response ) => {
    const token = req.header('x-token')||"";
    const login:any = req.header('x-user');
    try{

        const privKey = process.env.PRIVATEKEY || 'Ch1n6@7umdr3';
        const {uid}:any = jwt.verify(token,privKey); 
        //verificar que exista el usuario y si esta activo
        const existeUsuario:any = await userModel.obtenerUsuario(uid,undefined,login,undefined,undefined)
        if ( !existeUsuario ){
            rMvc  = new responseModel(false,'Acceso Denegado',{});
            return res.status(400).json( rMvc);    
        }
        
        //Cerrar otras sesiones
        const cerraSesiones:any = await sessionModel.cerraSesiones(uid,login);
        
        rMvc  = new responseModel(true,'Sesion Finalizada',{});
        return res.json( rMvc );

    }
    catch (error){
        console.log(error);
        rMvc  = new responseModel(false,'Acceso Denegado',{error});
        return res.status(500).json( rMvc );
    }
}
