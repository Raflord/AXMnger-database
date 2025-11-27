-- ================================================
-- CRIAÇÃO DO BANCO DE DADOS (opcional)
-- ================================================
CREATE DATABASE AXMngr;
\c AXMngr;

-- TABELA Usuario
CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    nome_completo VARCHAR(255) NOT NULL,
    nome_usuario VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    data_criacao DATE NOT NULL DEFAULT CURRENT_DATE,
    rua VARCHAR(255),
    numero INT,
    bairro VARCHAR(255),
    cep VARCHAR(20),

    CONSTRAINT unique_usuario UNIQUE (email, nome_usuario, cpf)
);

-- TABELA Fornecedor
CREATE TABLE Fornecedor (
    id SERIAL PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,

    -- Endereço inline
    rua VARCHAR(255),
    numero INT,
    bairro VARCHAR(255),
    cep VARCHAR(20),

    CONSTRAINT unique_fornecedor_cnpj UNIQUE (cnpj)
);

-- TABELA Material
-- Relacionamento com fornecedor
CREATE TABLE Material (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255),
    posicao VARCHAR(50),
    id_fornecedor INT,

    CONSTRAINT fk_material_fornecedor 
        FOREIGN KEY (id_fornecedor)
        REFERENCES Fornecedor(id)
        ON DELETE SET NULL
);

-- TABELA Lote
-- Relacionamento com material
CREATE TABLE Lote (
    id SERIAL PRIMARY KEY,
    quantidade_lote INT NOT NULL,
    peso_lote_kg INT NOT NULL,
    nota_fiscal VARCHAR(50) NOT NULL,
    validade DATE NOT NULL,
    id_material INT NOT NULL,

    CONSTRAINT fk_lote_material
        FOREIGN KEY (id_material)
        REFERENCES Material(codigo)
        ON DELETE CASCADE
);

-- TABELA Registro
-- Registro de saída/entrada vinculado a usuário, material e lote
CREATE TABLE Registro (
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    id_usuario INT,
    id_material INT,
    id_lote INT,

    CONSTRAINT fk_registro_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id)
        ON DELETE SET NULL,

    CONSTRAINT fk_registro_material
        FOREIGN KEY (id_material)
        REFERENCES Material(codigo)
        ON DELETE SET NULL,

    CONSTRAINT fk_registro_lote
        FOREIGN KEY (id_lote)
        REFERENCES Lote(id)
        ON DELETE CASCADE
);
