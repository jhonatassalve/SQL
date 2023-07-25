-- Function: declaracaoHora
delimiter $$
create function declaracaoHora(
	n_cpf varchar(14))
returns time
deterministic
begin
	declare resultado time;
	
	-- Retorna o tempo que o paciente permaneceu no hospital (necessário o CPF do paciente)
	set resultado = (select timediff(now(), data)
						from senha s
						inner join paciente p
						on s.id_paciente = p.id_paciente
						where p.cpf = n_cpf);
	return resultado;
end $$

select declaracaoHora('94831705080');

-- Function: tratamentoExame
delimiter $$
create function tratamentoExame(
	n_cid varchar(3))
returns varchar(200)
deterministic
begin
	declare resultado varchar(200);
    
	-- Retorna o exame solicitado para o tratamento de determinada doença (necessário o CID)
    set resultado = (select distinct exame
						from consulta c
                        inner join exame e
                        on c.id_consulta = e.id_consulta 
                        where c.cid = n_cid);
	return resultado;
end $$

-- Function: tratamentoMedicacao
delimiter $$
create function tratamentoMedicacao(
	n_cid varchar(3))
returns varchar(200)
deterministic
begin
	declare resultado varchar(200);
    
	-- Retorna a medicação prescrita para o tratamento de determinada doença (necessário o CID)
    set resultado = (select distinct m.prescricao_medica
						from consulta c
                        inner join medicacao m
                        on c.id_consulta = m.id_consulta
                        where c.cid = n_cid);
	return resultado;
end $$

-- Function: diagnosticoPaciente
delimiter $$
create function diagnosticoPaciente(
	n_cpf varchar(14))
returns varchar(512)
deterministic
begin
	declare resultado varchar(512);
    
    -- Retorna a descrição sobre o diagnóstico do paciente (necessário o CPF do paciente)
    set resultado = (select cd.descricao
						from paciente p
						inner join senha s on p.id_paciente = s.id_paciente
						inner join consulta c on s.senha = c.senha
                        inner join cid cd on c.cid = cd.cid
						where p.cpf = n_cpf);
	return resultado;
end $$

-- Function: totalAtendimentos
delimiter $$
create function totalAtendimentos(
	dia date)
returns int
deterministic
begin
	declare resultado int;
    
    -- Retorna a quantidade total de atendimento de determinado dia(YYYY-MM-DD)
    set resultado = (select count(*) 
						from atendimento a
                        inner join senha s
                        on a.senha = s.senha
                        where cast(s.data as date) = dia);
	return resultado;
end $$

-- Function: totalAtendimentoRecepcao
delimiter $$
create function totalAtendimentoRecepcao(
	n_recepcao int)
returns int
deterministic
begin
	declare resultado int;
    
    -- Retorna a média de atendimentos realizados nos últimos 30 dias pela recepção (1 ou 2)
    set resultado = (select floor(avg(qtd)) 
						from (select cast(data as date), count(*) as qtd
								from senha s
								inner join atendimento a
								on s.senha = a.senha
								where cast(data as date) between (curdate() - interval 30 day) 
																and (curdate() - interval 1 Day) 
																and a.recepcao = n_recepcao
								group by cast(data as date)) as qtd);
	return resultado;
end $$

-- Function: totalAtendimentoConsultorio
delimiter $$
create function totalAtendimentoConsultorio(
	n_consultorio int)
returns int
deterministic
begin
	declare resultado int;
    
    -- Retorna a média de atendimentos realizados nos últimos 30 dias em cada consultório (1, 2, 3 ou 4)
	set resultado = (select floor(avg(qtd)) 
						from (select cast(data as date), count(*) as qtd
								from senha s
								inner join consulta c
								on s.senha = c.senha
								where cast(data as date) between (curdate() - interval 30 day) 
																and (curdate() - interval 1 Day) 
																and c.consultorio = n_consultorio
								group by cast(data as date)) as qtd);
	return resultado;
end $$
