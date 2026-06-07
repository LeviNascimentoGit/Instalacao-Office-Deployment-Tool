# Pra que serve
> Nota: Esse script não é uma ferramenta de modificação.

A finalidade desse script é Baixar/Instalar a versão oficial do pacote MS Office via ODT ([Office Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117)), que é uma ferramenta original Microsoft.  

## Como utilizar
### 1. Criar uma Nova Pasta para o instalador  
O nome da pasta e o local do diretório precisam ser fáceis de encontrar, pois, vai ser necessário acessar ela algumas vezes durante a instalação.  
EX: Área de Trabalho > Instalador Office

### 2. Baixar e executar a versão atualizada do [Office Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117)  
O arquivo `officedeploymenttool.exe` apenas extrai o `setup.exe`. 
Escolha a pasta criada anteriormente. Por isso, precisa ter um nome e local de diretório fácil de encontrar.

### 3. Gerar o arquivo `XML` no site oficial usando a [Ferramenta de Personalização do Office](https://config.office.com/deploymentsettings)  
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

### 4. Baixar e salvar os scripts deste repositório na Nova Pasta do Instalador
[Script de Download](https://github.com/LeviNascimentoGit/Instalacao-Office-Deployment-Tool/blob/main/Download%20-%20Arraste%20o%20XML%20aqui.bat)  

[Script de Instalação](https://github.com/LeviNascimentoGit/Instalacao-Office-Deployment-Tool/blob/main/Instala%C3%A7%C3%A3o%20-%20Execute%20como%20administrador.bat)  

### 5. Baixar ou Instalar o Office 
- Para baixar. Clique e arraste o arquivo de configuração XML para cima do script `Download - Arraste o XML aqui.bat`  
 Esse script executa o `setup.exe` no modo de Download.  
 O `setup.exe` vai criar uma nova pasta com o nome `Office` e baixar pra dentro dela os arquivos para instalação Offline.  
 Isso possibilita copiar a Pasta do Instalador e realizar a instalação em outro computador sem conexão à internet; ou  
 Realizar instalações e atualizações via conexão LAN, caso a Pasta do Instalador possa ser acessada por outros computadores conectados na mesma rede, útil para prestar suporte nos escritórios de empresas.  
> Nota: Caso seja executado um arquivo de configuração 

- Para instalar. Execute o script `Instalação - Execute como administrador.bat` como administrador  
 Esse script executa o `setup.exe` no modo de Instalação.  
 Caso o `setup.exe` não localize a pasta `Office` para realizar a instalação Offline, ele vai tentar executar a instalação online. Nesse caso será necessário uma conexão com a internet.  
 
> Dica: Após completar o download dos arquivos de instalação offline, renomeie a pasta `Office` para o mesmo nome do arquivo de instalação por exemplo `Excel-PowerPoint-Word-2021-LTSC_x64`. Isso vai permitir baixar várias versões diferntes do Office sem sobrescrever a anterior. Quando desejar realizar a instalação de uma dessas versões baixadas, apenas renomeie a pasta novamente para `Office`.


## Links úteis
[Manual do Office Deployment Tool](https://learn.microsoft.com/pt-br/microsoft-365-apps/deploy/overview-office-deployment-tool)
