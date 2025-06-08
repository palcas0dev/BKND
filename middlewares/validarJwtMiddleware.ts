import { NextFunction, Request, Response } from 'express';
import jwt from 'jsonwebtoken'

const validarJwt = ( req:Request, res:Response, next:NextFunction ) => {
    //console.log(token);
    const token = req.header('x-token');
    const user = req.header('x-user');
    try{
        if ( !token ){
            return res.status(401).json({
                estatus:-1,
                msg:'Error al recuperar la sesion.'
            });
        }
        if (!user){
            return res.status(401).json({
                    estatus:-2,
                    msg:'Error al recuperar la sesion.'
            });
        }
        const privKey = process.env.PRIVATEKEY || 'Ch1n6@7umdr3';
        const {uid}:any = jwt.verify(token,privKey); 
        req.uid = uid;
        
        next();
    }
    catch (error){
        console.log(error);
        return res.status(401).json({
            estatus:0,
            msg:'Accesso Denegado'
        });
    }
}

export default validarJwt;