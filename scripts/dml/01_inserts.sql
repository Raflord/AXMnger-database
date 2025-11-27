-- Usuários
INSERT INTO Usuario (email, nome_completo, nome_usuario, cpf, cargo, rua, numero, bairro, cep)
VALUES
('ana.silva@example.com', 'Ana Silva', 'anasilva', '123.456.789-00', 'Admin', 'Rua A', 100, 'Centro', '80000-000'),
('joao.mendes@example.com', 'João Mendes', 'jmendes', '987.654.321-00', 'Operador', 'Rua B', 200, 'Industrial', '80100-000'),
('maria.sousa@example.com', 'Maria Sousa', 'msousa', '222.333.444-55', 'Gerente', 'Rua C', 150, 'Comercial', '80200-000');

-- Fornecedores
INSERT INTO Fornecedor (cnpj, razao_social, rua, numero, bairro, cep)
VALUES
('12.345.678/0001-99', 'Fornecedor Alpha LTDA', 'Av Central', 500, 'Centro', '90000-000'),
('23.456.789/0001-88', 'Industria Beta SA', 'Rua das Flores', 1200, 'Industrial', '90100-000');

-- Materiais
INSERT INTO Material (descricao, posicao, id_fornecedor)
VALUES
('Parafuso 10mm', 'A1', 1),
('Caixa de Papelão', 'B3', 2),
('Tinta Azul 5L', 'C2', 1);

-- Lotes
INSERT INTO Lote (quantidade_lote, peso_lote_kg, nota_fiscal, validade, id_material)
VALUES
(500, 25.5, 'NF-1001', '2025-05-10', 1),
(300, 10.0, 'NF-1002', '2025-08-22', 2),
(100, 5.5, 'NF-1003', '2024-12-01', 3);

-- Registros
INSERT INTO Registro (data, hora, id_usuario, id_material, id_lote)
VALUES
('2025-01-10', '10:30:00', 1, 1, 1),
('2025-01-11', '14:10:00', 2, 2, 2),
('2025-01-12', '16:20:00', 3, 3, 3);
