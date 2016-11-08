Ext.ns("Tcc.javaScript");

Tcc.javaScript = {
    constructor: function (config) {
        Ext.apply(this, config);
    },


    login: function (email, senha) {
        SGSI.ConsultarLogin(email, senha, {
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

    logout: function () {
        SGSI.Sair();
    },

    salvarNorma: function (nome) {
        SGSI.SalvarNorma(nome, {
            showFailureWarning: true,
            success: function (result) {

                if (result == 1) {
                    Ext.Msg.show({
                        msg: 'Norma cadastrada com sucesso!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });
                    Ext.getCmp('WinNorma').hide();
                }

                else if (result == 2) {
                    Ext.Msg.show({
                        msg: 'Esta norma já esta cadastrada no sistema!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });

                }
            },
            eventMask: {
                showMask: true,
                msg: 'Aguarde, atualizando informações...'
            }
        })
    },


    salvarProcedimento: function (nome, norma, departamento, dtInicial, dtFinal, descricao, winNorma, store) {
        SGSI.SalvarProcedimento(nome, norma, departamento, dtInicial, dtFinal, descricao, {
            showFailureWarning: true,
            success: function (result) {

                if (result == 1) {
                    Ext.Msg.show({
                        msg: 'Procedimento cadastrado com sucesso!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });
                    Ext.getCmp('WinProcedimentos').hide();
                }

                else if (result == 2) {
                    Ext.Msg.show({
                        msg: 'Esta norma já esta cadastrada no sistema!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });

                }
                store.reload();
            },
            eventMask: {
                showMask: true,
                msg: 'Aguarde, atualizando informações...'
            }
        })
    },
    abrirFormUser: function (WinUser, forUser) {

        forUser.reset();
        WinUser.show();

    },

    ManagerExit: function () {
        SGSI.Sair();
    },

    cadastroUsuario: function (departamento, nome, email, cargo, tipo, senha, WinUsuario, Usuarios) {
        SGSI.AdicionarUsuario(nome, cargo, departamento, email, tipo, senha, {
            showFailureWarning: true,
            success: function (result) {
                if (result == 1) {
                    Ext.Msg.show({
                        msg: 'Usuario adicionado com sucesso!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });
                    WinUsuario.hide();
                    Usuarios.reload();
                }

                if (resultado == 2) {
                    Ext.Msg.show({
                        msg: 'Este usuário já esta cadastrado no sistema!',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });
                    WinUsuario.hide();

                }

                eventMask: {
                        showMask: true,
                        msg; 'Aguarde, atualizando informações...'
                }
            }
        }
    )
    },

    carregaFunc: function (dpId) {
        SGSI.CarregaComboFuncionario(dpId);
        Ext.getCmp('CmbNewUserNome').reset();
        Ext.getCmp('TextNewUserEmail').reset();
        Ext.getCmp('TextNewUserCargo').reset();

    },
    carregaEmail: function (nome, dpId) {
        SGSI.CarregaEmailCargoFuncionario(nome, dpId);
    },


    gridNormas: function (command, record) {
        switch (command) {
            case ('Norma'):
                SGSI.AbrirNorma(record.data.Caminho);
                form.reset();
                form.getForm().loadRecord(record);
                WinAtualizarSenha.show();

                break;
        }
    },
    gridUsuarios: function (command, record, storeUsuarios, WinAtualizarSenha, form) {
        switch (command) {
            case ('Apagar'):
                Ext.Msg.confirm('Aviso', 'Tem certeza que gostaria de remover este usuário?', function (btn) {
                    if (btn == 'yes') {
                        SGSI.RemoverUsuario(record.data.Email, {
                            showFailureWarning: true,
                            success: function (result) {
                                if (result == 1) {
                                    Ext.Msg.show({
                                        msg: 'Senha alterada com sucesso',
                                        buttons: Ext.Msg.OK,
                                        title: 'Aviso'
                                    });
                                    storeUsuarios.reload();
                                }
                            }
                        })
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
    
    gridProcedimentos: function (command, record, storeUsuarios, WinDetalhes, form) {
            switch (command) {
                case ('Apagar'):
                    Ext.Msg.confirm('Aviso', 'Tem certeza que gostaria de remover este usuário?', function (btn) {
                        if (btn == 'yes') {
                            SGSI.RemoverUsuario(record.data.Email, {
                                showFailureWarning: true,
                                success: function (result) {
                                    if (result == 1) {
                                        Ext.Msg.show({
                                            msg: 'Senha alterada com sucesso',
                                            buttons: Ext.Msg.OK,
                                            title: 'Aviso'
                                        });
                                        storeUsuarios.reload();
                                    }
                                }
                            })
                        }
                    })
                    break;

                case ('Detalhes'):
                    SGSI.CarregaHistoricoProc(record.data.ProcedimentoId);
                    form.reset();
                    form.getForm().loadRecord(record);
                    WinDetalhes.show();

                    break;
            }
        },
    alterarSenha: function (email, senha, winAtualizarSenha) {
        SGSI.AlterarSenhaUsuario(email, senha, {
            showFailureWarning: true,
            success: function (result) {

                if (result == 1) {
                    Ext.Msg.show({
                        msg: 'Senha alterada com sucesso',
                        buttons: Ext.Msg.OK,
                        title: 'Aviso'
                    });
                    winAtualizarSenha.hide();
                }
            }
        })
    },
    desabilitarCommand: function (grid, toolbar, rowIndex, record) {
        var command = toolbar.items.get(0);
        var command1 = toolbar.items.get(1);
        var command2 = toolbar.items.get(2);
        var command3 = toolbar.items.get(3);
        var userName = Ext.getCmp('HUserName').getValue();

        ////Desabilita botão excluir para usuários que não são gestores
        //var userListaId = Ext.getCmp('hiddenUsuarioListaId').getValue();
        //var userId = Ext.getCmp('hiddenUsuarioId').getValue();
        //var arrayUser = userListaId.split(";");
        //var i, fLen;

        //fLen = arrayUser.length;
        //for (i = 0; i < fLen; i++) {
        //    if (arrayUser[i] == userId) {
        //        command2.setVisible(true);
        //    };
        //}


        if (record.data.ResponsavelAtual == userName) {
            if (record.data.Situacao == 'Aceitação Pendente') {

                command.setHidden(false);
                command1.setHidden(false);
                command3.setHidden(true);
                if (record.data.Situacao == 'Delegação Pendente') {
                    command.setHidden(true);
                    command1.setHidden(true);
                }
            }
        } else if (record.data.DemandaSituacaoProjeto == 'Pendente') {
            grid.view.addRowClass(rowIndex, 'yellow');
        } else if (record.data.DemandaSituacaoProjeto == 'Finalizado') {
            grid.view.addRowClass(rowIndex, 'blue');
        } else if (record.data.DemandaSituacaoProjeto == 'Impedido') {
            grid.view.addRowClass(rowIndex, 'red');
        } else {
            grid.view.addRowClass(rowIndex, 'black');
        }

    },

}