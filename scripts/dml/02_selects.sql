-- Listar todos os usuários e seus respectivos cargos
SELECT nome_completo, email, cargo
FROM Usuario
ORDER BY nome_completo;

-- Listar materiais com informações do fornecedor
SELECT 
    m.codigo,
    m.descricao,
    m.posicao,
    f.razao_social AS fornecedor
FROM Material m
LEFT JOIN Fornecedor f ON m.id_fornecedor = f.id
ORDER BY m.codigo;

-- Buscar registros com detalhes do usuário, material e lote
SELECT 
    r.id AS registro_id,
    r.data,
    r.hora,
    u.nome_usuario,
    m.descricao AS material,
    l.nota_fiscal,
    l.validade
FROM Registro r
JOIN Usuario u ON r.id_usuario = u.id
JOIN Material m ON r.id_material = m.codigo
JOIN Lote l ON r.id_lote = l.id
ORDER BY r.data DESC;

-- Mostrar materiais que possuem lote com validade menor que 2025
SELECT 
    m.descricao,
    l.validade,
    l.quantidade_lote
FROM Material m
JOIN Lote l ON m.codigo = l.id_material
WHERE l.validade < '2025-01-01'
ORDER BY l.validade;

-- Limitar resultado aos 2 primeiros fornecedores
SELECT id, razao_social, cnpj
FROM Fornecedor
LIMIT 2;
