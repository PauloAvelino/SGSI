Ext.ns("Tcc.javaScript");

Tcc.javaScript = {
    constructor: function (config) {
        Ext.apply(this, config);
    },
    teste: function () {

        Ext.Msg.confirm('Aviso', 'Tem certeza que gostaria de remover esta carga?', function (btn) {
            if (btn == 'yes') {
                SGSI.AdicionarUsuario();
            }
        })
    },

    AbrirFormUser: function (WinUser, forUser) {

        forUser.reset();
        WinUser.show();

    },


    CadastroUsuario: function (nome, email, senha, WinUsuario, Usuarios) {
        SGSI.AdicionarUsuario(nome, email, senha, {
            json: true,
            showFailureWarning: true,
            success: function (result) {


                if (result == 1) {
                    Ext.Msg.show({
                        msg: 'Usuario adicionado com sucesso!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });
                    WinUsuario.hide();

                }
                Usuarios.reload();
            },
            eventMask: {
                showMask: true,
                msg: 'Aguarde, atualizando informações...'
            }
        })
    }

}