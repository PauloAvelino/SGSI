Ext.ns("Tcc.javaScript");

Tcc.javaScript = {
    constructor: function (config) {
        Ext.apply(this, config);
    },
    teste : function(){

        Ext.Msg.confirm('Aviso', 'Tem certeza que gostaria de remover esta carga?', function (btn) {
            if (btn == 'yes') {
                SGSI.AdicionarUsuario();}

        })
    },

    CadastroUsuario : function(nome, email, senha){
        SGSI.AdicionarUsuario(nome, email, senha);
    }

}