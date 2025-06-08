import { NextFunction, Request, Response } from 'express';
import jwt from 'jsonwebtoken'
import sessionModel from '../models/db/sessionModel';
import userModel from '../models/db/userModel';
import responseModel from "../models/responseModel";
let rMvc: responseModel;

function  validarSesion () {
    const vp = async (req: Request, res: Response, next:NextFunction) => {
        const token = req.header('x-token')||"";
        const user = req.header('x-user');
        try{
            const privKey = process.env.PRIVATEKEY || 'Ch1n6@7umdr3';
            const {uid}:any = jwt.verify(token,privKey); 
            const existeUsuario:any = await userModel.obtenerUsuario(uid,undefined,user,undefined,'S');
            if (!existeUsuario){
                rMvc  = new responseModel(false,'Acceso Denegado',{});
                return res.status(401).json(rMvc);
            }
            const existeSesion:any = await sessionModel.obtenerSesion(uid,token)
            if ( !existeSesion ){
                rMvc  = new responseModel(false,'Acceso Denegado',{});
                return res.status(401).json(rMvc);
            }
            next();
        }
        catch (error){
            console.log(error);
            rMvc  = new responseModel(false,'Sesion no se puede recuperar',{});
            return res.status(401).json(rMvc);
        }
    }
    return vp;
}

export default validarSesion;