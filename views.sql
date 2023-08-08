-- View: atendimento_emergencial 
-- Descrição: retorna os dados sobre os pacientes que receberam a classificacao de "Emergência", 
-- e o nome do responsável pela triagem.

create view atendimento_emergencial as
select cast(s.data as date) as dt_atendimento, p.cpf, p.nome, p.dt_nascimento, p.sexo, p.telefone, c.nome as responsavel_triagem from paciente p
inner join senha s on p.id_paciente = s.id_paciente
inner join triagem t on s.senha = t.senha
inner join colaboradores c on t.id_colaborador = c.id_colaborador
where t.classificacao = 'Emergência';

-- View: atendimento_preferencial 
-- Descrição: retorna os dados sobre os pacientes que receberam atendimento preferencial

create view atendimento_preferencial as
select cast(s.data as date) as dt_atendimento, p.cpf, p.nome, p.dt_nascimento, p.sexo, p.telefone from paciente p
inner join senha s on p.id_paciente = s.id_paciente
where s.preferencial is true;

-- View: paciente_febre_amarela 
-- Descrição: retorna os dados sobre os pacientes diagnosticados com a doença febre amarela, 
-- e o nome do médico responsável por esse diagnostico

create view paciente_febre_amarela as
select cast(s.data as date) as dt_atendimento, p.cpf, p.nome, p.dt_nascimento, p.sexo, p.nacionalidade, p.telefone, cls.nome as medico_responsavel from paciente p
inner join senha s on p.id_paciente = s.id_paciente
inner join consulta c on s.senha = c.senha
inner join cid on c.cid = cid.cid
inner join consultorio cto on c.consultorio = cto.consultorio 
inner join colaboradores cls on cto.id_colaborador = cls.id_colaborador
where cid.descricao like 'Febre amarela';

-- View: paciente_tratamento_antidepressivo 
-- Descrição: retorna os dados dos pacientes que iniciaram um tratamento com antidepressivo,
-- e o nome do médico responsável pela prescrição da medicação.

create view paciente_tratamento_antidepressivo as
select cast(s.data as date) dt_atendimento, p.cpf, p.nome, p.dt_nascimento, p.sexo, p.telefone, m.prescricao_medica, cls.nome as medico_responsavel from paciente p
inner join senha s on p.id_paciente = s.id_paciente
inner join consulta c on s.senha = c.senha
inner join medicacao m on c.id_consulta = m.id_consulta
inner join consultorio cto on c.consultorio = cto.consultorio
inner join colaboradores cls on cto.id_colaborador = cls.id_colaborador
where m.prescricao_medica like 'antidepressivos';

-- View: pre_cadastro 
-- Descrição: retorna os dados dos pacientes que realizaram apenas um pré-cadastro (cadastro sem atendimento)

create view pre_cadastro as
select * from paciente
where id_paciente not in (select id_paciente from senha);
