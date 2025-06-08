import { NextFunction, Request, Response } from 'express';
import  db  from '../db/connection'

function  validarPermisos (permisos: string | undefined) {
    const vp = async (req: Request, res: Response, next:NextFunction) => {
        const { QueryTypes } = require('sequelize');
        const uid:any = req.uid || "";
        if ( !permisos ){
            return res.status(401).json({
                estatus:-1,
                msg:'Acceso Denegado'
            });
        }
        try{
            //Verifica que el Usuario tenga permiso
            const lst_MENUS:any = await db.query(
                "SELECT  "
                        +" tsm.tsm_modulo  as Modulo "
                        +" ,tsm.tsm_nombre as Menu "
                        +" ,tsm.tsm_route as Ruta "
                +" FROM 	tbl_sec_permisos tsp  "
                +" JOIN	tbl_sec_permisos_perfiles tspp ON tspp.TSP_ID = tsp.TSP_ID  "
                +" JOIN	tbl_sec_menu_permisos tsmp ON tsmp.TSP_ID  = tsp.TSP_ID "
                +" JOIN 	tbl_sec_menu tsm ON tsm.TSM_ID = tsmp.TSM_ID "
                +" JOIN	tbl_admin_perfiles tap ON tap.TAP_ID = tspp.TAP_ID "
                +" JOIN 	tbl_admin_usuarios tau ON tau.TAP_ID  = tap.TAP_ID "
                +" WHERE   tsm.tsm_modulo = 'API' "
                +" AND      tau.tau_activo = true"
                +" AND     tspp.tspp_activo ='S' "
                +" AND    	tsm.tsm_nombre = '" + permisos + "'"
                +" AND    	tau.TAU_ID = " + uid 
                , {type : QueryTypes.SELECT} 
            );
            
            if ((lst_MENUS.length === 0 )){
                return res.status(403).json({
                    estatus:-2,
                    msg:'Acceso Denegado'
                    ,lst_MENUS
                    
                });
            }
            next();
        }
        catch (error){
            console.log(error);
            return res.status(500).json({
                msg:'Error. Contacte al administrador'
            });
        }
    }
    return vp;
}

export default validarPermisos;