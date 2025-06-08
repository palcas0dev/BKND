import { Router } from "express";
import { check,header } from 'express-validator';
import { login , logout } from '../controllers/authController';
import validarCampos from "../middlewares/validarCamposMiddleware";
import validarJwt from "../middlewares/validarJwtMiddleware";
import validarSesion from "../middlewares/validarSesionMiddleware";

const router = Router();

router.post('/login',
[
    check('login','El usuario es obligatorio').not().isEmpty(),
    check('pass','La contraseña es obligatoria').not().isEmpty(),
    validarCampos
]
,login);

router.delete('/logout',
[
    header('x-token','No se puede recuperar la sesion.').not().isEmpty(),
    header('x-user','No se puede recuperar la sesion.').not().isEmpty(),
    validarJwt,
    validarSesion(),
    validarCampos
]
,logout);

export default router;