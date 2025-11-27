-- Atualizar endereço de um usuário sem precisar de ID externo
UPDATE Usuario
SET rua = 'Av Brasil', numero = 999, bairro = 'Novo Centro', cep = '80500-000'
WHERE nome_usuario = 'jmendes';

-- Corrigir a posição de um material
UPDATE Material
SET posicao = 'A2'
WHERE codigo = 1;

-- Alterar lote aumentando quantidade
UPDATE Lote
SET quantidade_lote = quantidade_lote + 50
WHERE id = 2;
