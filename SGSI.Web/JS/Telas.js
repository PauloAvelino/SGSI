Ext.ns("Tcc.javaScript");

Tcc.javaScript = {
    constructor: function (config) {
        Ext.apply(this, config);
},
    teste : function(){

    Ext.Msg.confirm('Aviso', 'Tem certeza que gostaria de remover esta carga?');
   Tcc.Habilitar();

}
}