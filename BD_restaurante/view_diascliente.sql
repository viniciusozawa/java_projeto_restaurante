CREATE VIEW vi_diasClientes AS(
SELECT
    c.nomeCliente,
    c.cpfCliente,
    c.telefone,
    DATE_FORMAT(c.dataCadastro, '%d/%m/%Y') AS dataCadastro_formatada,
    DATEDIFF(CURDATE(), c.dataCadastro) AS dias_cadastrado
FROM cliente c);
