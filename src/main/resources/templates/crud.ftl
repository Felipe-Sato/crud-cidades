<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD Cidades</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
        <nav class="navbar navbar-expand-sm bg-dark">
            <ul class="navbar-nav ml-auto">
                    <#-- Sair da aplicação -->
                    <a 
                        href="/logout" 
                        class="nav-link btn btn-secondary"
                        >Sair da aplicação</a>
                </li>
            </ul>
        </nav>

    <div class="container-fluid">    
        <div class="jumbotron mt-5">
            <h1>CRUD DE CIDADES E ESTADOS</h1>
            <p>ADICIONE ABAIXO ESTADOS E RELACIONE-OS COM CIDADES</p>
        </div>
    </div>

    <#-- ===================== ESTADOS ===================== -->
    <div class="crud_estado">
        <div class="container-fluid">    
            <div class="jumbotron mt-5">
                <h2>GERENCIAMENTO DE ESTADOS</h2>
                <p>UM CRUD PARA CRIAR, ALTERAR, EXCLUIR E LISTAR ESTADOS</p>
            </div>
                <#-- Alteração do Conteúdo? -->
            <#if estadoAtual??>
                <form action="/alterarEstado" method="POST" class="needs-validation" novalidate>
                <input type="hidden" name="nomeAtual" value="${(estadoAtual.nome)!}"/>
                <input type="hidden" name="siglaAtual" value="${(estadoAtual.sigla)!}"/>
            <#else>
                <form action="/criarEstado" method="POST" class="needs-validation" novalidate>
            </#if>

                    <#-- Campo para Estados -->        
                    <div class="form-group">
                        <label for="nome">Estado:</label>
                        <input 
                            value="${(estadoAtual.nome)!}${nomeInformado!}" 
                            name="nome" 
                            type="text" 
                            class="form-control ${(nome??)?then('is-invalid', '')}" 
                            placeholder="Informe o nome do estado" 
                            id="nome">
                        
                        <div class="invalid-feedback">
                            ${nome!}
                        </div>
                    </div>
                    <#-- Campo para Siglas -->
                    <div class="form-group">
                        <label for="sigla">Sigla:</label>
                        <input 
                            value="${(estadoAtual.sigla)!}${siglaInformada!}" 
                            name="sigla" 
                            type="text" 
                            class="form-control ${(sigla??)?then('is-invalid', '')}" 
                            placeholder="Informe a sigla que representa o estado"
                            id="sigla">
                    
                        <div class="invalid-feedback">
                            ${sigla!}
                        </div>
                    </div>
                    <#-- Alterar conteúdo do botão de envio -->
                    <#if estadoAtual??>
                        <button type="submit" class="btn btn-warning">CONCLUIR ALTERAÇÃO</button>
                    <#else>
                        <button type="submit" class="btn btn-primary">CRIAR</button>
                    </#if>
                </form>
            <#-- Lista de elementos na memória -->
            <table class="table table-striped table-hover mt-5">
                <thead class="thead-dark">
                    <tr>
                        <th>Nome</th>
                        <th>Sigla</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <#list listaEstados as estado >
                        <tr>
                            <td>${estado.nome}</td>
                            <td>${estado.sigla}</td>
                            <td>
                                <div class="d-flex d-justify-content-center">
                                <a href="/preparaAlterarEstado?nome=${estado.nome}&sigla=${estado.sigla}" class="btn btn-warning mr-3">ALTERAR</a>
                                <a href="/excluirEstado?nome=${estado.nome}&sigla=${estado.sigla}" class="btn btn-danger">EXCLUIR</a>
                                </div>
                            </td>
                        </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </div>
    
    <#-- ===================== CIDADES ===================== -->
    <div class="crud_cidade">
        <div class="container-fluid">    
            <div class="jumbotron mt-5">
                <h2>GERENCIAMENTO DE CIDADES</h2>
                <p>UM CRUD PARA CRIAR, ALTERAR, EXCLUIR E LISTAR CIDADES</p>
            </div>

            <#-- Alteração do Conteúdo -->
            <#if cidadeAtual??>
                <form action="/alterarCidade" method="POST" class="needs-validation" novalidate>
                <input type="hidden" name="nomeAtual" value="${(cidadeAtual.nome)!}"/>
                <input type="hidden" name="estadoAtual" value="${(cidadeAtual.estado)!}"/>
            <#else>
                <form action="/criarCidade" method="POST" class="needs-validation" novalidate>
            </#if>
                    <#-- Campo para Cidades -->        
                    <div class="form-group">
                        <label for="nome">Cidade:</label>
                        <input 
                            value="${(cidadeAtual.nome)!}${nomeInformado!}" 
                            name="nome" 
                            type="text" 
                            class="form-control ${(nome??)?then('is-invalid', '')}" 
                            placeholder="Informe o nome da cidade" 
                            id="nome">
                        
                        <div class="invalid-feedback">
                            ${nome!}
                        </div>
                    </div>
                    <#-- Campo para Estados -->
                    <div class="form-group">
                        <label for="estado">Estado:</label>
                        <select name="estado">
                            <option value="??">Selecione o Estado</option>
                                <#list listaEstados as estado>
                                    <option value=${(estado.sigla)!}>${estado.nome}</option>
                                </#list>
                        </select>
                            
                        <div class="invalid-feedback">
                            ${estado!}
                        </div>
                    </div>
                    <#-- Alterar conteúdo do botão de envio -->
                    <#if cidadeAtual??>
                        <button type="submit" class="btn btn-warning">CONCLUIR ALTERAÇÃO</button>
                    <#else>
                        <button type="submit" class="btn btn-primary">CRIAR</button>
                    </#if>
                </form>

            <#-- Lista de elementos na memória -->
            <table class="table table-striped table-hover mt-5">
                <thead class="thead-dark">
                    <tr>
                        <th>Nome</th>
                        <th>Estado</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <#list listaCidades as cidade >
                        <tr>
                            <td>${cidade.nome}</td>
                            <td>${cidade.estado}</td>
                            <td>
                                <div class="d-flex d-justify-content-center">
                                <a href="/preparaAlterarCidade?nome=${cidade.nome}&estado=${cidade.estado}" class="btn btn-warning mr-3">ALTERAR</a>
                                <a href="/excluirCidade?nome=${cidade.nome}&estado=${cidade.estado}" class="btn btn-danger">EXCLUIR</a>
                                </div>
                            </td>
                        </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>
