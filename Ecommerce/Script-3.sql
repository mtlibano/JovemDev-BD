insert into cidade values (1, 'Tubarão', 'SC');
insert into cidade values (2, 'Gravatal', 'SC');

--7
insert into venda values (1, '04/06/2023', 1);
insert into venda values (2, '06/06/2023', 1);
insert into venda values (3, '08/06/2023', 1);
insert into venda values (4, '10/06/2023', 1);
insert into venda values (5, '05/06/2023', 2);
insert into venda values (6, '07/06/2023', 2);
insert into venda values (7, '09/06/2023', 2);
insert into venda values (8, '11/06/2023', 2);

insert into venda_produto values (1, 1, 1, 2);
insert into venda_produto values (2, 1, 2, 1);
insert into venda_produto values (3, 2, 3, 1);
insert into venda_produto values (4, 2, 4, 4);
insert into venda_produto values (5, 3, 5, 2);
insert into venda_produto values (6, 4, 6, 2);
insert into venda_produto values (7, 5, 1, 1);
insert into venda_produto values (8, 6, 2, 2);
insert into venda_produto values (9, 7, 3, 1);
insert into venda_produto values (10, 7, 4, 1);
insert into venda_produto values (11, 8, 5, 2);
insert into venda_produto values (12, 8, 6, 2);

--8
select *
from cliente c
inner join endereco e on e.id_endereco = c.id_endereco
inner join cidade cid on cid.id_cidade = e.id_cidade and cid.nome = 'Tubarão';

--9
select c.nome, v.id_venda, v.data_venda
from venda v
inner join cliente c on c.id_cliente = v.id_cliente and c.nome = 'Max';

--10
select *
from categoria c
left join produto p on p.id_categoria = c.id_categoria
order by c.id_categoria;

--11
--Selecionar as vendas por intervalo de data
select c.nome, v.id_venda, v.data_venda
from venda v
inner join cliente c on c.id_cliente = v.id_cliente
where v.data_venda between '08/06/2023' and '10/06/2023';

--Selecionar o total de vendas realizada em determinada data
select count(*)
from venda v
where v.data_venda = '06/06/2023';

--Selecionar produtos com baixo estoque (<4)
select *
from produto p
where p.qtd < 4;

--Selecionar o cliente que realizou a primeira compra na loja
select *
from cliente c
inner join venda v on v.id_cliente = c.id_cliente and v.data_venda = (select max(data_venda) from venda);









