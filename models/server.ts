import express,{Application} from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import * as dotenv from 'dotenv';

import db from '../db/connection';
import authRoutes from '../routes/authRoute';
import expedienteRoutes from '../routes/expedienteRoute';
// import userRoutes from '../routes/users';
// import profileRoutes from '../routes/profiles';
// import securityRoutes from '../routes/permisos';

dotenv.config({path:'../.env'});

// export class Server{ TODO  }
class Server{
    private app: Application;
    private port: string;
    private apiPaths = {
        auth:'/api/auth',
        expedientes: '/api/expedientes'
    };

    constructor(){
        //Iniciar servidor express
        this.app = express();
        
        //Setear puerto de API
        this.port = process.env.PORT || '8080';

        // DB
         this.dbCnn();
        
         //definir middlewares
        this.middlewares();

        // definir las rutas
        this.routes();
        
    }

    async dbCnn () {
        try{
            await db.authenticate();
            console.log('Se conecto a la BD :) ');
        }
        catch ( error ){
            console.error('ERROR, No se conecta a BD',error);
        }
    }

    middlewares(){
        //cors
        this.app.use(cors({

        }));

        // body
        this.app.use(bodyParser.json());
        this.app.use(bodyParser.urlencoded({extended: true}));
        
        //carpeta publica
        this.app.use( express.static('public'));
    }

    routes (){
        this.app.use(this.apiPaths.auth, authRoutes);
        this.app.use(this.apiPaths.expedientes, expedienteRoutes);
    }

    listen () {
        this.app.listen( this.port, () => {
            console.log('Servidor Corriendo en puerto :: ' + this.port);
        } )
    }

}


export default Server;