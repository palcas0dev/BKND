import { Router } from "express";
import { check,header } from 'express-validator';
import validarCampos from "../middlewares/validarCamposMiddleware";
import validarJwt from "../middlewares/validarJwtMiddleware";
import validarSesion from "../middlewares/validarSesionMiddleware";
import { getExpedientes, postExpedientes, putExpedientes } from "../controllers/expedienteController";

const router = Router();


router.get('/',
[
    header('x-token','No se puede recuperar la sesion.').not().isEmpty(),
    header('x-user','No se puede recuperar la sesion.').not().isEmpty(),
    validarJwt,
    validarSesion(),
    validarCampos
]
,getExpedientes);
router.post('/',
[
    header('x-token','No se puede recuperar la sesion.').not().isEmpty(),
    header('x-user','No se puede recuperar la sesion.').not().isEmpty(),
    check('usr_id','usr_id es obligatoria').not().isEmpty(),
    check('fiscal','fiscal es obligatoria').not().isEmpty(),
    check('codigo','codigo es obligatoria').not().isEmpty(),
    check('recepcion','recepcion es obligatoria').not().isEmpty(),
    check('titulo','titulo es obligatoria').not().isEmpty(),
    check('descripcion','descripcion es obligatoria').not().isEmpty(),
    check('estado','estado es obligatoria').not().isEmpty(),
    validarJwt,
    validarSesion(),
    validarCampos
]
,postExpedientes);

router.put('/:id',
[
    header('x-token','No se puede recuperar la sesion.').not().isEmpty(),
    header('x-user','No se puede recuperar la sesion.').not().isEmpty(),
    check('estado','estado es obligatoria').not().isEmpty(),
    validarJwt,
    validarSesion(),
    validarCampos
]
,putExpedientes);

export default router;