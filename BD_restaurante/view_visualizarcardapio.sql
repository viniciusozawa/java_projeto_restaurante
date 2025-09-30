SELECT 
    c.nomeComida AS nomeComida,
    c.valorComida AS valorComida,
    c.descricaoComida AS descricaoComida,
    cat.nomeCategoria AS nomeCategoria
FROM 
    cardapio c
INNER JOIN 
    categoria cat 
    ON c.categoria_codCategoria = cat.codCategoria;
