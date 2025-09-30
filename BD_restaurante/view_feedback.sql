SELECT 
    c.nomeCliente AS nomeCliente,
    c.telefone AS telefone,
    DATE_FORMAT(f.dataFeedback, '%d/%m/%Y %H:%i:%s') AS DATA_Feedback,
    f.nota AS nota,
    f.descricao AS descricao
FROM 
    cliente c
INNER JOIN 
    feedback f 
    ON c.codCliente = f.cliente_codCliente
ORDER BY 
    f.dataFeedback DESC;
