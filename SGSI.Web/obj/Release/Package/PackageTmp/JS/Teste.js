﻿Ext.ns("Tcc.javaScript");

Tcc.javaScript = {
    constructor: function (config) {
        Ext.apply(this, config);    
    },
    

    login: function (email, senha) {
        SGSI.ConsultarLogin(email, senha, {
            json: true,
            showFailureWarning: true,
            success: function (result) {


                if (result == 2) {
                    Ext.Msg.show({
                        msg: 'Usuário ou senha incorretos, tente novamente ou entre em contato com o administrador!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });
                    WinUsuario.hide();

                }
            }
        });

    },

    //logout: function () {
    //    SGSI.Sair();
    //},


    //salvarNorma: function (nome) {
    //    SGSI.SalvarNorma(nome, {
    //        json: true,
    //        showFailureWarning: true,
    //        success: function (result) {


    //            if (result == 1) {
    //                Ext.Msg.show({
    //                    msg: 'Usuario adicionado com sucesso!',
    //                    buttons: Ext.Msg.OK,
    //                    title: 'Aviso'
    //                });
    //                WinUsuario.hide();

    //            }
    //            Usuarios.reload();
    //            if (result == 2) {
    //                Ext.Msg.show({
    //                    msg: 'Este usuário já esta cadastrado no sistema!',
    //                    buttons: Ext.Msg.OK,
    //                    title: 'Aviso'
    //                });
    //                WinUsuario.hide();

    //            }
    //        },
    //        eventMask: {
    //            showMask: true,
    //            msg: 'Aguarde, atualizando informações...'
    //        }
    //    })
    //},

    //abrirFormUser: function (WinUser, forUser) {

    //    forUser.reset();
    //    WinUser.show();

    //},


    //cadastroUsuario: function (departamento, nome, email, cargo, tipo, senha, WinUsuario, Usuarios) {
    //    SGSI.AdicionarUsuario(nome, cargo, departamento, email, tipo, senha, {
    //        json: true,
    //        showFailureWarning: true,
    //        success: function (result) {

    //            var x = result;
    //            if (result == 1) {
    //                Ext.Msg.show({
    //                    msg: 'Usuario adicionado com sucesso!',
    //                    buttons: Ext.Msg.OK,
    //                    title: 'Aviso'
    //                });
    //                WinUsuario.hide();

    //            }
    //            Usuarios.reload();
    //            if (result == 2) {
    //                Ext.Msg.show({
    //                    msg: 'Este usuário já esta cadastrado no sistema!',
    //                    buttons: Ext.Msg.OK,
    //                    title: 'Aviso'
    //                });
    //                WinUsuario.hide();

    //            }
    //        },
    //        eventMask: {
    //            showMask: true,
    //            msg: 'Aguarde, atualizando informações...'
    //        }
    //    })
    //},

    //carregaFunc: function (dpId) {
    //    SGSI.CarregaComboFuncionario(dpId);
    //    Ext.getCmp('CmbNewUserNome').reset();
    //    Ext.getCmp('TextNewUserEmail').reset();
    //    Ext.getCmp('TextNewUserCargo').reset();

    //},
    //carregaEmail: function (nome, dpId) {
    //    SGSI.CarregaEmailCargoFuncionario(nome, dpId);
    //},

    gridUsuarios: function (command, record, storeUsuarios, WinAtualizarSenha, form) {
        switch (command) {
            case ('Apagar'):
                Ext.Msg.confirm('Aviso', 'Tem certeza que gostaria de remover este usuário?', function (btn) {
                    if (btn == 'yes') {
                        SGSI.RemoverUsuario(record.data.Email, {
                            json: true,
                            showFailureWarning: true,
                            success: function (result) {

                                if (result == 1) {
                                    Ext.Msg.show({
                                        msg: 'Usuario removido com sucesso!',
                                        buttons: Ext.Msg.OK,
                                        title: 'Aviso'
                                    });
                                    storeUsuarios.reload();
                                }

                            }
                        });
                    }
                })
                break;

            case ('Senha'):
                form.reset();
                form.getForm().loadRecord(record);
                WinAtualizarSenha.show();

                break;
        }
    },

    login: function (email, senha) {
        SGSI.ConsultarLogin(email, senha, {
            json: true,
            showFailureWarning: true,
            success: function (result) {


                if (result == 2) {
                    Ext.Msg.show({
                        msg: 'Usuário ou senha incorretos, tente novamente ou entre em contato com o administrador!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });
                    WinUsuario.hide();

                }
            }
        });

    },
    alterarSenha: function (email, senha, winAtualizarSenha) {
        SGSI.AlterarSenhaUsuario(email, senha, {
            json: true,
            showFailureWarning: true,
            success: function (result) {

                var x = result;

                if (result == 1) {
                    Ext.Msg.show({
                        msg: 'Senha alterada com sucesso!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });
                    winAtualizarSenha.hide();

                }
            }
        });
    }
}