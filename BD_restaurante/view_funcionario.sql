SELECT 
    f.nomeFuncionario AS nomeFuncionario,
    DATE_FORMAT(f.dataNascimento, '%d/%m/%Y') AS dataNascimento,
    FLOOR((TO_DAYS(CURDATE()) - TO_DAYS(f.dataNascimento)) / 365) AS idade,
    f.salarioFuncionario AS salarioFuncionario,
    c.nomeCargo AS nomeCargo
FROM 
    funcionario f
INNER JOIN 
    cargo c 
    ON f.cargo_codCargo = c.codCargo;
