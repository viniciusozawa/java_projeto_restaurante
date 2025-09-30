SELECT 
    e.nomeItem AS nomeItem,
    e.quant AS quant,
    e.descricao AS descricao,
    DATE_FORMAT(e.dataProducao, '%d/%m/%Y') AS data_producao,
    DATE_FORMAT(e.dataVencimento, '%d/%m/%Y') AS Produtos_Vencendo,
    f.nomeFornecedor AS nomeFornecedor,
    f.endereco AS endereco
FROM 
    estoque e
INNER JOIN 
    estoque_por_fornecedor ep 
    ON e.codEstoque = ep.estoque_codEstoque
INNER JOIN 
    fornecedores f 
    ON ep.fornecedores_codFornecedor = f.codFornecedor
ORDER BY 
    e.dataVencimento;
