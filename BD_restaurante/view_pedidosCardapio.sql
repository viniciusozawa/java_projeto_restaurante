SELECT 
    cl.nomeCliente AS nomeCliente,
    p.codpedido AS codpedido,
    c.nomeComida AS nomeComida,
    c.valorComida AS valorComida,
    pc.quantidade AS quantidade,
    (c.valorComida * pc.quantidade) AS totalItem
FROM 
    pedido p
INNER JOIN 
    pedido_por_cardapio pc 
    ON p.codpedido = pc.pedido_idpedido
INNER JOIN 
    cardapio c 
    ON pc.cardapio_codCardapio = c.codCardapio
INNER JOIN 
    cliente cl 
    ON p.cliente_codCliente = cl.codCliente;
