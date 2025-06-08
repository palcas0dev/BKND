class responseModel {
    success:boolean;
    mensaje :string;
    data :object;
    
    constructor(
        success:boolean,
        mensaje :string,
        data :object
    ) {
        this.success = success;
        this.mensaje = mensaje;
        this.data = data;
    }
  }
  
  export default responseModel;