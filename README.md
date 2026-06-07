# Pra que serve
> Nota: Esse script não é uma ferramenta de modificação.

A finalidade desse script é Baixar/Instalar a versão oficial do pacote MS Office via ODT ([Office Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117)), que é uma ferramenta original Microsoft.  

## Como utilizar
### 1. Criar uma Nova Pasta para o instalador  
O nome da pasta e o local do diretório precisam ser fáceis de encontrar, pois, vai ser necessário acessar ela algumas vezes durante a instalação.  
EX: Área de Trabalho > Instalador Office

### 2. Baixar e executar a versão atualizada do [Office Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117)  
O arquivo `officedeploymenttool.exe` apenas extrai o `setup.exe`. 
Escolha a pasta criada anteriormente, por isso, precisa ter um nome e local de diretório fácil de encontrar.

### 3. Gerar o arquivo `xml` no site oficial usando a [Ferramenta de Personalização do Office](https://config.office.com/deploymentsettings)  
1. Escolha a arquitetura (32 ou 64)  
2. Em `Office Suites`: Escolha as versões LTSC (Long-Term Servicing Channel). Isso garante que a versão é a mais estável e vai durar muito tempo com suporte  
3. Os itens `Visio`, `Project` e `Produtos Adicionais`, são opcionais  
4. Em Canal de Atualização, selecione Licença Perpétua e a versão Mais Recente  
5. Escolha quais aplicativos serão instalados (Os mais recomendados são PowerPoint, Word e Excel. Os outros, são opcionais)  
6. Selecione o Idioma Principal. Os Idiomas Adicionais e Revisores de Texto Adicionais, são opcionais  
7. Em Instalação e Atualização selecione `CDN` ou `Microsoft Endpoint Configuration Manager` (Mais recomendada)  
8. Marque todas as opções para `Desinstalar qualquer versão MSI do Office, incluindo o Visio e o Project`. Desmarque as opções `Para as versões desinstaladas do MSI do Office, instale os mesmos idiomas` e `Atualizar automaticamente para a arquitetura selecionada`  
9. Marque `Aceitar os termos de licença`. Selecione uma Chave do Produto `KMS` e Ativação do Produto `Baseada no usuário`.  
10. Os campos em Geral, são opcionais  
11. As preferências no aplicativo, são opcionais  
12. Clique em `Exportar`  
13. Selecine `Formatos Office Open XML`
14. Marque `Aceito os termos do contrato de licença`
15. Defina o Nome do Arquivo como algo fácil de identificar. Ex: `Excel-PowerPoint-Word-2021-LTSC_x64`
16. Clique em `Exportar`para baixar o arquivo de configuração XML. 
17. Mova o arquivo de configuração XML para a Nova Pasta do instalador

### 4. Baixar ou Instalar o Office 
- Para baixar. Clique e arraste o arquivo de configuração XML para cima do script `Baixar - Arraste o XML aqui.bat`  
> Será criado uma pasta com o nome `Office` e dentro dela ficam salvos todo o conteúdo do pacote de instalação Offline, isso é útil para implantar atualizações em massa, útil para suporte em grandes empresas.

- Para instalar. Clique e arraste o arquivo de configuração XML para cima do script `Instalação - Execute como administrador.bat`  
 
> Não é necessário Baixar antes de Instalar, pois, caso a opção de instalação seja iniciada, ela executa a instalação online, por isso, é obrigatório uma conexão com a internet.  

### 5. Baixar e salvar os scripts deste repositório na Nova Pasta do Instalador
[Script de Download](https://github.com/LeviNascimentoGit/Instalacao-Office-Deployment-Tool/blob/main/Baixar%20-%20Arraste%20o%20XML%20aqui.bat)  

[Script de Instalação](https://github.com/LeviNascimentoGit/Instalacao-Office-Deployment-Tool/blob/main/Instala%C3%A7%C3%A3o%20-%20Execute%20como%20administrador.bat)  

## Links úteis
[Manual do Office Deployment Tool](https://learn.microsoft.com/pt-br/microsoft-365-apps/deploy/overview-office-deployment-tool)
