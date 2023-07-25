-- Table: log_demissao
create table log_demissao(
	id_colaborador int,
    cpf varchar(11) not null,
	nome varchar(50) not null,
	dt_nascimento date not null,
	sexo varchar(10) not null,
	nacionalidade varchar(20) not null,
    end_logradouro varchar(50) not null,
    end_numero int not null,
	email varchar(50) not null,
    telefone varchar(14) not null,
	cargo varchar(30) not null,
	crm int,
	coren int,
	especialidade varchar(30),
    dt_demissao date,
    hr_demissao time,
    by_user varchar(50),
    primary key (id_colaborador)
);

-- Trigger: tr_demissao
-- Objetivo: controlar a atualização da coluna 'dt_demissao' da tabela 'colaboradores'
delimiter $$
create trigger `tr_demissao`
after update on `colaboradores`
for each row
begin
	if new.dt_demissao is not null then
		insert into `log_demissao`(
			id_colaborador, 
			cpf, 
			nome, 
			dt_nascimento, 
			sexo, 
			nacionalidade, 
			end_logradouro, 
			end_numero, 
			email, 
			telefone, 
			cargo, 
			crm, 
			coren,  
			especialidade, 
			dt_demissao,
			hr_demissao,
			by_user)
		values (
			old.id_colaborador, 
			old.cpf, 
			old.nome,  
			old.dt_nascimento, 
			old.sexo, 
			old.nacionalidade, 
			old.end_logradouro, 
			old.end_numero, 
			old.email, 
			old.telefone, 
			old.cargo,
			old.crm,
			old.coren,
			old.especialidade, 
			curdate(),
			curtime(), 
			user());
	end if;
end $$

-- Teste: tr_demissao
update colaboradores set dt_demissao = curdate() where id_colaborador = 4; -- atualizar a coluna dt_demissao da tabeça colaboradores
select * from log_del_colaborador; -- verificar a inserção do registro atualizado na tabela `log_demissao`

-- Trigger: tr_validacao
-- Objetivo: Controlar o cadastramento de novos usuários pelo CPF, evitando duplicagem.
delimiter $$
create trigger `tr_validacao`
before insert on `paciente`
for each row
begin
	if new.cpf = (select distinct cpf from paciente where cpf = new.cpf) then -- Se o novo cpf já estiver cadastrado na tabela paciente, retornar uma mensagem de erro
		signal sqlstate '45000'
			set message_text = 'CPF já cadastrado em nosso sistema.';
	end if;
end $$

-- Teste: tr_validacao
INSERT INTO paciente (cpf, nome, dt_nascimento, sexo, nacionalidade, email, telefone) 
VALUES 
  ('33600797956', 'Bento Enzo Marcos Vinicius Almeida', '1990-01-01', 'Masculino', 'Brasileira', 'bento-almeida82@eletrotex.com.br', '+5538997231911');
