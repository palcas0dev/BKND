import * as dotenv from 'dotenv';
import Server from './models/server';

// lee configuracion pordefecto (archivo .env)
dotenv.config();

const server = new Server();

server.listen();