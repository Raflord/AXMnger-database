Sistema de Controle de Estoque "AXMngr" — Banco de Dados

Este projeto implementa a modelagem e criação de um banco de dados para controle de estoque, incluindo usuários, fornecedores, materiais, lotes e registros de movimentação.
O objetivo é fornecer uma estrutura organizada, normalizada e com integridade referencial usando CONSTRAINTS e ON DELETE CASCADE / SET NULL.

Tabelas do Sistema
1. Usuario

Armazena os usuários responsáveis pelos registros do sistema.

2. Fornecedor

Guarda informações de fornecedores.

3. Material

Cadastro de materiais do estoque.

4. Lote

Armazena os lotes dos materiais.

5. Registro

Registra entradas/saídas, vinculando usuário + lote.

Relacionamentos Importantes

Material → Fornecedor
ON DELETE SET NULL
Se um fornecedor for excluído, os materiais permanecem, mas ficam sem fornecedor.

Registro → Lote
ON DELETE CASCADE
Se um lote for apagado, todos os registros dele também são excluídos.

Registro → Usuario
ON DELETE SET NULL
Caso o usuário seja apagado, seus registros permanecem.

Scripts de Criação

Todos os scripts SQL estão na pasta /database/scripts, organizados de forma sequencial para facilitar a execução.

