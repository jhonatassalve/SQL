-- Schema: hospital
create schema hospital;

-- Tables
-- Table: paciente
create table paciente (
	id_paciente int auto_increment,
    cpf varchar(11) not null,
    rg varchar(9) not null,
    nome varchar(50) not null,
    dt_nascimento date not null,
    sexo varchar(1) not null,
    naturalidade varchar(20) not null,
    end_logradouro varchar(50) not null,
    end_numero int not null,
    email varchar(50) not null,
    telefone varchar(14) not null,
    convenio varchar(20) not null,
    primary key (id_paciente)
);

-- Table: senha
create table senha (
	id_senha int auto_increment,
    id_paciente int not null,
    data datetime not null,
    preferencial bit not null,
    primary key (id_senha)
);

-- Table: recepcao
create table recepcao (
	num_recepcao int not null,
    id_funcionario int not null,
    ramal int not null,
    primary key (num_recepcao)
);

-- Table: atendimento
create table atendimento (
    id_atendimento int auto_increment,
    id_senha int not null,
    num_recepcao int not null,
    primary key (id_atendimento)
);

-- table: triagem
create table triagem (
	id_triagem int auto_increment,
    id_senha int not null,
    id_funcionario int not null,
    pressao float not null,
    glicemia float not null,
    grau_gravidade varchar(10) not null,
    primary key (id_triagem)
);

-- Table: consultorio
create table consultorio (
	num_consultorio int not null,
    id_funcionario int not null,
    ramal int not null,
    primary key (num_consultorio)
);

-- Table: consulta
create table consulta (
    id_consulta int auto_increment,
    id_senha int not null,
    num_consultorio int not null,
    cid varchar(10),
    descricao varchar (200),
    primary key (id_consulta)
);

-- Table: exame
create table exame (
    id_consulta int not null,
    exame varchar(200) not null
);

-- Table: diagnostico
create table diagnostico (
    id_consulta int not null,
    diagnostico varchar(200) not null,
    internacao bit not null
);

-- Table: funcionario
create table funcionario (
	id_funcionario int auto_increment,
	nome varchar(50) not null,
    cpf varchar(11) not null,
    rg varchar(9) not null,
	coren int,
	crm int,
	dt_nascimento date not null,
	sexo varchar(1) not null,
	naturalidade varchar(20) not null,
    end_logradouro varchar(50) not null,
    end_numero int not null,
	email varchar(50) not null,
    telefone varchar(14) not null,
	funcao varchar(20) not null,
	especialidade varchar(30),
    primary key (id_funcionario)
);

-- foreign keys
-- Reference: fk_paciente_senha (table: senha)
alter table senha 
add constraint fk_paciente_senha
foreign key (id_paciente) references paciente(id_paciente);

-- Reference: fk_func_recepcao (table: recepcao)
alter table recepcao
add constraint fk_funcionario_recepcao
foreign key (id_funcionario) references funcionario (id_funcionario);

-- Reference: fk_senha_atendimento (table: atendimento)
alter table atendimento
add constraint fk_senha_atendimento
foreign key (id_senha) references senha (id_senha);

-- Reference: fk_recepcao_atendimento (table: atendimento)
alter table atendimento
add constraint fk_recepcao_atendimento
foreign key (num_recepcao) references recepcao (num_recepcao);

-- Reference: fk_senha_triagem (table: triagem)
alter table triagem
add constraint fk_senha_triagem
foreign key (id_senha) references senha (id_senha);

-- Reference: fk_funcionario_triagem (table: triagem)
alter table triagem
add constraint fk_funcionario_triagem
foreign key (id_funcionario) references funcionario (id_funcionario);

-- Reference: fk_func_consultorio (table: consultorio)
alter table consultorio
add constraint fk_funcionario_consultorio
foreign key (id_funcionario) references funcionario (id_funcionario);

-- Reference: fk_senha_consulta (table: consulta)
alter table consulta
add constraint fk_senha_consulta
foreign key (id_senha) references senha (id_senha);

-- Reference: fk_consultorio_consulta (table: consulta)
alter table consulta
add constraint fk_consultorio_consulta
foreign key (num_consultorio) references consultorio (num_consultorio);

-- Reference: fk_consulta_exame (table: exame)
alter table exame
add constraint fk_consulta_exame
foreign key (id_consulta) references consulta (id_consulta);

-- Reference: fk_consulta_diagnostico (table: diagnostico)
alter table diagnostico
add constraint fk_consulta_diagnostico
foreign key (id_consulta) references consulta (id_consulta);
