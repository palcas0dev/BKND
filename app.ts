import * as dotenv from 'dotenv';
import Server from './models/server';

// lee configuracion pordefecto (archivo .env)
dotenv.config();

const swaggerAutogen = require('swagger-autogen')()

const outputFile = './swagger_output.json'
const endpointsFiles = ['./routes/authRoute.ts','./routes/expedienteRoute.ts']

swaggerAutogen(outputFile, endpointsFiles)

const server = new Server();

server.listen();