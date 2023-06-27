-- Insert
-- Insert table: paciente 
INSERT INTO paciente (cpf, rg, nome, dt_nascimento, sexo, naturalidade, end_logradouro, end_numero, email, telefone, convenio) 
VALUES 
  ('33600797956', '120036319', 'Bento Enzo Marcos Vinicius Almeida', '1990-01-01', 'M', 'Natal', 'Rua La Paz', 123, 'bento-almeida82@eletrotex.com.br', '+5538997231911', 'Unimed'),
  ('46448605819', '152669334', 'Márcia Heloisa Fernandes', '1995-05-10', 'F', 'Patos de Minas', 'Avenida Nossa Senhora das Graças', 678, 'marcia_fernandes@tglaw.com.br', '+5534928105066', 'Amil'),
  ('97356075571', '103646863', 'Gustavo Davi Nascimento', '1985-08-15', 'M', 'Belo Horizonte', 'Rua Vila Júlia Maria', 89, 'gustavo_davi_nascimento@depotit.com.br', '+5585929800374', 'SulAmérica'),
  ('68202976022', '362187952', 'Heloisa Maria Almeida', '1982-04-20', 'F', 'Salvador', 'Avenida Vinte e Cinco de Maio', 987, 'heloisamariaalmeida@royalplas.com.br', '+5532997231980', 'Bradesco'),
  ('22981502816', '483249592', 'Manoel Elias Teixeira', '1998-12-25', 'M', 'Belém', 'Ponta Grossa Icoaraci', 654, 'manoel.elias.teixeira@yande.com.br', '+5591927940935', 'Unimed'),
  ('61661264255', '104253022', 'Carla Francisca Nunes', '1993-07-07', 'F', 'Palmas', 'Quadra 1106 Sul Alameda 39', 321, 'carla_nunes@maorifilmes.com.br', '+5563929661214', 'Amil'),
  ('30757613543', '505604401', 'Laura Emanuelly Luzia Moraes', '1991-03-15', 'F', 'Fortaleza', 'Rua 10', 789, 'laura-moraes95@obrativaengenharia.com.br', '+5585938062217', 'SulAmérica'),
  ('12546150324', '299136188', 'Geraldo Rafael Corte Real', '1980-11-30', 'M', 'Maracanaú', 'Rua Romênia', 654, 'geraldo_rafael_cortereal@detorsul.com', '+5585927261325', 'Bradesco'),
  ('54171293138', '368346249', 'Josefa Manuela Almeida', '1988-09-05', 'F', 'Várzea Grande', 'Rua Beija-Flor', 321, 'josefa_manuela_almeida@dr.com', '+5565937150344', 'Unimed'),
  ('94831705080', '104538946', 'Vitória Isabelle Jaqueline Cavalcanti', '1996-06-12', 'F', 'João Pessoa', 'Rua Pedro Romulo Aguiar', 987, 'vitoria.isabelle.cavalcanti@raya3.com.br', '+5583925973383', 'Amil');

-- Insert table: funcionario 
INSERT INTO funcionario (nome, rg, cpf, coren, crm, dt_nascimento, sexo, naturalidade, end_logradouro, end_numero, email, telefone, funcao, especialidade)
VALUES 
  ('Roberto Fernando Viana', '355471644', '42962933386', NULL, 12345, '1990-01-08', 'M', 'Porto Velho', 'Rua Uruguai', 31, 'roberto-viana85@img.com.br', '+55699991023723', 'Médico', 'Ortopedia e Traumatologia'),
  ('Samuel Otávio Davi da Paz', '384532950', '90613180330', NULL, 34567, '1992-03-13', 'M', 'Belo Horizonte', 'Rua Nova Jerusalém', 156, 'samuel_otavio_dapaz@profemme.com.br', '+5583938893288', 'Médico', 'Psiquiatria'),
  ('Leonardo Calebe da Conceição', '357393776', '07417931995', NULL, 56789, '1994-05-07', 'M', 'Uberaba', 'Rua Francisco Meireles', 47, 'leonardo_calebe_daconceicao@corpoclinica.com.br', '+55349999014489', 'Médico', NULL),
  ('Flávia Isabela Martins', '403896320', '01773773640', NULL, 90123, '1998-09-10', 'M', 'Lençóis Paulista', 'Rodovia Marechal Rondon', 221, 'elisa.marcela.caldeira@tanby.com.br', '+5514998866045', 'Médico', NULL),
  ('Alice Isabela Assunção', '136110125', '47411235377', 23456, NULL, '1991-02-15', 'F', 'Macapá', 'Travessa Fortunato Peres', 387, 'alice_assuncao@emcinfo.com.br', '+5596939976516', 'Enfermeiro', NULL),
  ('Melissa Débora Novaes', '215970287', '89422568218', 45678, NULL, '1993-04-20', 'F', 'Araguaína', 'Rua Tietê', 44, 'melissa-novaes80@robertacorrea.com', '+5563937829160', 'Enfermeiro', NULL),
  ('Cecília Sarah Peixoto', '438463377', '05796398008', 67890, NULL, '1995-06-18', 'F', 'Santo Ângelo', 'Travessa A', 768, 'cecilia_peixoto@agencia10clic.com.br', '+5555929656340', 'Enfermeiro', NULL),
  ('Letícia Sabrina Barros', '232552733', '30928412806', 89012, NULL , '1997-08-01', 'F', 'São Lourenço da Mata', 'Rua Belarmino Dias', 402, 'leticia_sabrina_barros@texfuse.com.br', '+5521990987654', 'Enfermeiro', NULL),
  ('Julio Francisco Pinto', '313417210', '75841169220', NULL, NULL, '1996-07-29', 'M', 'Natal', 'Travessa Santa Paulina', 23, 'julio_pinto@heindmec.com.br', '+5584991321004', 'Recepcionista', NULL),
  ('Juan Oliver Ribeiro', '142476201', '87332458519', NULL, NULL , '1999-10-19', 'F', 'Campo Grande', 'Rua Jaciro de Souza e Silva', 370, 'juan.oliver.ribeiro@a-qualitybrasil.com.br', '+5567996921096', 'Recepcionista', NULL);

-- Insert table: senha 
INSERT INTO senha (id_paciente, data, preferencial)
VALUES 
  (1, '2023-06-19 09:00:00', 0),
  (2, '2023-06-19 09:05:00', 1),
  (3, '2023-06-19 09:10:00', 0),
  (4, '2023-06-19 09:15:00', 0),
  (5, '2023-06-19 09:20:00', 1),
  (6, '2023-06-19 09:25:00', 0),
  (7, '2023-06-19 09:30:00', 0),
  (8, '2023-06-19 09:35:00', 1),
  (9, '2023-06-19 09:40:00', 0),
  (10, '2023-06-19 09:45:00', 0);

-- Insert table: recepcao
INSERT INTO recepcao (num_recepcao, id_funcionario, ramal)
VALUES
  (1, 9, 2345),
  (2, 10, 2346);

-- Insert table: atendimento
INSERT INTO atendimento (id_senha, num_recepcao)
VALUES 
  (2, 1),
  (1, 2),
  (3, 1),
  (5, 1),
  (4, 2),
  (8, 1),
  (6, 2),
  (7, 1),
  (9, 2),
  (10, 2);

-- Insert table: triagem 
INSERT INTO triagem (id_senha, id_funcionario, pressao, glicemia, grau_gravidade) 
VALUES
  (1, 5, 103, 77, 'Leve'),
  (2, 6, 140, 76, 'Grave'),
  (3, 5, 131, 76, 'Moderado'),
  (4, 6, 116, 83, 'Leve'),
  (5, 5, 156, 73, 'Grave'),
  (6, 7, 137, 78, 'Moderado'),
  (7, 8, 109, 83, 'Leve'),
  (8, 7, 105, 87, 'Leve'),
  (9, 8, 110, 77, 'Leve'),
  (10, 7, 149, 84, 'Grave');

-- Insert table: consultorio
INSERT INTO consultorio (num_consultorio, id_funcionario, ramal)
VALUES
  (1, 1, 1001),
  (2, 2, 1002),
  (3, 3, 1003),
  (4, 4, 1004);

-- Insert table: consulta 
INSERT INTO consulta (id_senha, num_consultorio, cid, descricao)
VALUES 
  (1, 3, 'J01', 'Sinusite Aguda'),
  (2, 2, 'F41', 'Outros Transtornos Ansiosos'),
  (3, 1, 'S93', 'Luxação, Entorse e Distensão Das Articulações e Dos Ligamentos ao Nível do Tornozelo e do pé'),
  (4, 4, 'J30', 'Rinite Alérgica e Vasomotora'),
  (5, 3, 'K29', 'Gastrite e Duodenite'),
  (6, 1, 'S93', 'Luxação, Entorse e Distensão Das Articulações e Dos Ligamentos ao Nível do Tornozelo e do pé'),
  (7, 4, 'A95', 'Febre Amarela'),
  (8, 3, 'R05', 'Tosse'),
  (9, 3, 'R07', 'Dor de Garganta e no Peito'),
  (10, 2, 'F41', 'Outros Transtornos Ansiosos');

-- Insert table: exame 
INSERT INTO exame (id_consulta, exame)
VALUES 
  (1, 'Raio-x dos seios da face'),
  (2, 'Hemograma completo'),
  (3, 'Radiografia'),
  (5, 'Endoscopia'),
  (6, 'Radiografia'),
  (9, 'Raio-x do tórax'),
  (10, 'Hemograma completo');

-- Insert table: diagnostico 
INSERT INTO diagnostico (id_consulta, diagnostico, internacao)
VALUES 
  (1, 'Antibiótico e descongestionante nasal', 0),
  (2, 'Antidepressivos', 0),
  (3, 'Analgésicos e compressa com gelo no local da dor', 1),
  (4, 'Anti-histamínico e descongestionante nasal', 0),
  (5, 'Antiácido e inibidor da bomba de prótons', 0),
  (6, 'Analgésicos e compressa com gelo no local da dor', 1),
  (7, 'Anti-inflamatório', 1),
  (8, 'Antitússico', 0),
  (9, 'Antitússico, anti-inflamatório e pastilhas para garganta', 0),
  (10, 'Antidepressivos', 0);
