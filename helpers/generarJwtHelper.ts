import jwt from 'jsonwebtoken';

export const generarJWT = ( uid = '' ) => {
    return new Promise ( (resolve, reject) => {
        const payload = { uid };
        const privKey = process.env.PRIVATEKEY || 'Ch1n6@7umdr3';

        jwt.sign( payload, privKey ,{
            expiresIn: '4h'
        }
        , ( err, token ) => {
            if ( err ){
                console.log(err);
                reject ( 'No se pudo generar el token' );
            }
            else {
                resolve ( token );
            }
        })
        
        

    } )
}

