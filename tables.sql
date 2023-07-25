-- Table: paciente
create table paciente (
	id_paciente int auto_increment,
    cpf varchar(11) not null,
    nome varchar(50) not null,
    dt_nascimento date not null,
    sexo varchar(10) not null,
    nacionalidade varchar(20) not null,
    email varchar(50) not null,
    telefone varchar(14) not null,
    primary key (id_paciente)
);

-- Table: senha
create table senha (
    data datetime not null,
	senha int auto_increment,
    preferencial bit not null,
    id_paciente int not null,
    primary key (senha)
);

-- Table: recepcao
create table recepcao (
	recepcao int not null,
    id_colaborador int not null,
    ramal int not null,
    primary key (recepcao)
);

-- Table: atendimento
create table atendimento (
    id_atendimento int auto_increment,
    senha int not null,
    recepcao int not null,
    primary key (id_atendimento)
);

-- table: triagem
create table triagem (
	id_triagem int auto_increment,
    id_colaborador int not null,
    senha int not null,
    pressao float not null,
    glicemia float not null,
    classificacao varchar(20) not null,
    primary key (id_triagem)
);

-- Table: consultorio
create table consultorio (
	consultorio int not null,
    id_colaborador int not null,
    ramal int not null,
    primary key (consultorio)
);

-- Table: consulta
create table consulta (
    id_consulta int auto_increment,
    consultorio int not null,
    senha int not null,
    cid varchar(3),
    primary key (id_consulta)
);

-- Table: cid
create table cid(
	cid varchar(3) not null,
    descricao varchar(220) not null,
    primary key(cid)
);

-- Table: exame
create table exame (
    id_consulta int not null,
    exame varchar(300) not null
);

-- Table: medicacao
create table medicacao (
    id_consulta int not null,
    prescricao_medica varchar(300) not null,
    internacao bit not null
);

-- Table: colaboradores
create table colaboradores (
	id_colaborador int auto_increment,
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
    dt_admissao date not null,
    dt_demissao date,
    primary key (id_colaborador)
);

-- foreign keys
-- Reference: fk_paciente_senha (table: senha)
alter table senha 
add constraint fk_paciente_senha
foreign key (id_paciente) references paciente(id_paciente);

-- Reference: fk_colaborador_recepcao (table: recepcao)
alter table recepcao
add constraint fk_colaborador_recepcao
foreign key (id_colaborador) references colaboradores (id_colaborador);

-- Reference: fk_senha_atendimento (table: atendimento)
alter table atendimento
add constraint fk_senha_atendimento
foreign key (senha) references senha (senha);

-- Reference: fk_recepcao_atendimento (table: atendimento)
alter table atendimento
add constraint fk_recepcao_atendimento
foreign key (recepcao) references recepcao (recepcao);

-- Reference: fk_senha_triagem (table: triagem)
alter table triagem
add constraint fk_senha_triagem
foreign key (senha) references senha (senha);

-- Reference: fk_colaborador_triagem (table: triagem)
alter table triagem
add constraint fk_colaborador_triagem
foreign key (id_colaborador) references colaboradores (id_colaborador);

-- Reference: fk_colaborador_consultorio (table: consultorio)
alter table consultorio
add constraint fk_colaborador_consultorio
foreign key (id_colaborador) references colaboradores (id_colaborador);

-- Reference: fk_senha_consulta (table: consulta)
alter table consulta
add constraint fk_senha_consulta
foreign key (senha) references senha (senha); 

-- Reference: fk_consultorio_consulta (table: consulta)
alter table consulta
add constraint fk_consultorio_consulta
foreign key (consultorio) references consultorio (consultorio);

-- Reference: fk_cid_consulta (table: consulta)
alter table consulta
add constraint fk_cid_consulta
foreign key (cid) references cid(cid);

-- Reference: fk_consulta_exame (table: exame)
alter table exame
add constraint fk_consulta_exame
foreign key (id_consulta) references consulta (id_consulta);

-- Reference: fk_consulta_medicacao (table: medicacao)
alter table medicacao
add constraint fk_consulta_medicacao
foreign key (id_consulta) references consulta (id_consulta);
