-- Stored Procedure: ordemColaborador
delimiter $$
create procedure `ordemColaborador` (
	in campo char(20),
    in ordem char(5))
begin
	-- ordernar pelo valor de entrada
	set @ordenarCampo = concat('order by ', campo);
    
    -- se ordem for igual a 'asc' então ordene por 'asc'
    if ordem = 'asc' then
		set @tipoOrdenacao = concat(@ordenarCampo, ' asc');
	else
		-- se não, se ordem for igual a 'desc' ordene por 'desc'
		if ordem = 'desc' then
		set @tipoOrdenacao = concat(@ordenarCampo, ' desc');
        end if;
	end if;
    
    set @retorno = concat('select * from colaboradores ', @tipoOrdenacao);
    prepare runSQL from @retorno;
    execute runSQL;
    deallocate prepare runSQL;
end $$

-- call ordemColaborador('dt_admissao', 'desc');


-- Stored Procedure: cadastroPaciente
delimiter $$
create procedure `cadastroPaciente`(
	in n_cpf varchar(11),
    in nomeCompleto varchar(50),
    in dt_nasc date,
    in tipoSexo varchar(10),
    in tipoNacionalidade varchar(20),
    in e_mail varchar(50),
    in celular varchar(14))
begin
	-- se uma das variaveis forem iguais a '', retorne um ERRO
	if n_cpf = ''
    or nomeCompleto = ''
    or dt_nasc = null
    or tipoSexo = ''
    or tipoNacionalidade = ''
    or e_mail = ''
    or celular = '' then
		select 'Não foi possível cadastrar o paciente! Tente novamente.';
	
    -- se não, insira os valores na tabela paciente
	else
		insert into paciente(cpf, nome, dt_nascimento, sexo, nacionalidade, email, telefone)
        values (n_cpf, nomeCompleto, dt_nasc, tipoSexo, tipoNacionalidade, e_mail, celular);
        select * from paciente order by id_paciente desc;
	end if;
end $$

-- call cadastroPaciente('46032125858', 'Jhonatas Germano Lima Salve', '1998-12-15', 'Masculino', 'Brasileira', 'jhonatasgerman@gmail.com', '+5511966191138');
