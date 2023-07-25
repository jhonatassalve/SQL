	-- Visualiza a quantidade de médico(s).
	create view qtd_medico as 
	select count(*) as qtd_medico
    from colaboradores
    where crm is not null;

	-- Visualiza a quantidade de enfermeiro(s).
    
	create view qtd_enfermeiro as 
	select count(*) as qtd_medico
    from colaboradores
    where coren is not null;

	-- Visualiza a quantidade de pacientes que receberam atendimento preferencial.
    
	create view qtd_atendimento_preferencial as
	select count(*) as qtd_preferencial
    from senha
	group by preferencial
	having preferencial is true;

	-- Visualiza a quantidade de pacientes com a classificação "Emergência".
    
	create view qtd_atendimento_emergencia as
	select count(*) as qtd_emergencia
    from triagem
    group by classificacao
    having classificacao = 'Emergência';

	-- Visualiza a quantidade de pacientes com A95 (febre amarela).
    
	create view qtd_febre_amarela as
	select count(*) as qtd_febre_amarela
	from consulta
	group by cid
	having cid = 'A95';

	-- Visualiza a quantidade de pacientes diagnosticados com Antidepressivos.
    
	create view qtd_antidepressivos as
	select count(*) as qtd_antidepressivos
	from medicacao
	group by prescricao_medica
	having prescricao_medica = 'Antidepressivos';

	-- Visualiza a quantidade de pacientes internados.
    
	create view qtd_internado as
	select count(*) as qtd_internado
    from medicacao
	group by internacao
	having internacao is true;
