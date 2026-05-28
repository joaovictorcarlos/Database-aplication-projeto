CREATE DATABASE IF NOT EXISTS alfabe_db;
USE alfabe_db;

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    matricula_aluno VARCHAR(20) UNIQUE NOT NULL,
    idade INT NOT NULL,
    CONSTRAINT chk_idade_aluno CHECK (idade >= 2 AND idade <= 12)
);

CREATE TABLE professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    matricula_professor VARCHAR(20) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE responsavel (
    id_responsavel INT PRIMARY KEY AUTO_INCREMENT,
    matricula_responsavel VARCHAR(20) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);


CREATE TABLE hospital (
    id_hospital INT PRIMARY KEY AUTO_INCREMENT,
    nome_hospital VARCHAR(100) NOT NULL,
    endereco VARCHAR(200)
);

CREATE TABLE medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    matricula_medico VARCHAR(20) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    funcao VARCHAR(50),
    id_hospital INT,
    FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);

CREATE TABLE atividades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_atividade VARCHAR(50) NOT NULL,
    niveis_totais INT NOT NULL,
    niveis_concluidos INT DEFAULT 0,
    CONSTRAINT chk_niveis CHECK (niveis_concluidos <= niveis_totais)
);

CREATE TABLE aula (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_atividades INT NOT NULL,
    id_professor INT,
    nivel VARCHAR(50) NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_atividades) REFERENCES atividades(id),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    CONSTRAINT chk_nivel CHECK (nivel IN ('Básico', 'Reconhecimento', 'Intermediário'))
);

CREATE TABLE progresso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_nivel INT NOT NULL,
    recompensa INT DEFAULT 0,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_nivel) REFERENCES aula(id),
    CONSTRAINT chk_recompensa CHECK (recompensa >= 0 AND recompensa <= 3)
);

CREATE TABLE prontuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    desc_prontuario TEXT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE chamado_medico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_medico INT NOT NULL,
    id_aluno INT NOT NULL,
    desc_chamado TEXT,
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE sessao (
    id_sessao INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    tempo_jogado_minutos INT,
    data_sessao DATE,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);


INSERT INTO aluno (matricula_aluno, idade) VALUES 
('A01', 5), ('A02', 6), ('A03', 7), ('A04', 5), ('A05', 8), ('A06', 4), ('A07', 5), ('A08', 6), ('A09', 7), ('A10', 5),
('A11', 8), ('A12', 4), ('A13', 5), ('A14', 6), ('A15', 7), ('A16', 5), ('A17', 8), ('A18', 4), ('A19', 5), ('A20', 6),
('A21', 7), ('A22', 5), ('A23', 8), ('A24', 4), ('A25', 5), ('A26', 6), ('A27', 7), ('A28', 5), ('A29', 8), ('A30', 4),
('A31', 5), ('A32', 6), ('A33', 7), ('A34', 5), ('A35', 8), ('A36', 4), ('A37', 5), ('A38', 6), ('A39', 7), ('A40', 5),
('A41', 8), ('A42', 4), ('A43', 5), ('A44', 6), ('A45', 7), ('A46', 5), ('A47', 8), ('A48', 4), ('A49', 5), ('A50', 6);


INSERT INTO professor (matricula_professor, cpf, telefone, email) VALUES 
('P01','11111111101','99990001','p1@m.com'), ('P02','11111111102','99990002','p2@m.com'), ('P03','11111111103','99990003','p3@m.com'), ('P04','11111111104','99990004','p4@m.com'), ('P05','11111111105','99990005','p5@m.com'),
('P06','11111111106','99990006','p6@m.com'), ('P07','11111111107','99990007','p7@m.com'), ('P08','11111111108','99990008','p8@m.com'), ('P09','11111111109','99990009','p9@m.com'), ('P10','11111111110','99990010','p10@m.com'),
('P11','11111111111','99990011','p11@m.com'), ('P12','11111111112','99990012','p12@m.com'), ('P13','11111111113','99990013','p13@m.com'), ('P14','11111111114','99990014','p14@m.com'), ('P15','11111111115','99990015','p15@m.com'),
('P16','11111111116','99990016','p16@m.com'), ('P17','11111111117','99990017','p17@m.com'), ('P18','11111111118','99990018','p18@m.com'), ('P19','11111111119','99990019','p19@m.com'), ('P20','11111111120','99990020','p20@m.com'),
('P21','11111111121','99990021','p21@m.com'), ('P22','11111111122','99990022','p22@m.com'), ('P23','11111111123','99990023','p23@m.com'), ('P24','11111111124','99990024','p24@m.com'), ('P25','11111111125','99990025','p25@m.com'),
('P26','11111111126','99990026','p26@m.com'), ('P27','11111111127','99990027','p27@m.com'), ('P28','11111111128','99990028','p28@m.com'), ('P29','11111111129','99990029','p29@m.com'), ('P30','11111111130','99990030','p30@m.com'),
('P31','11111111131','99990031','p31@m.com'), ('P32','11111111132','99990032','p32@m.com'), ('P33','11111111133','99990033','p33@m.com'), ('P34','11111111134','99990034','p34@m.com'), ('P35','11111111135','99990035','p35@m.com'),
('P36','11111111136','99990036','p36@m.com'), ('P37','11111111137','99990037','p37@m.com'), ('P38','11111111138','99990038','p38@m.com'), ('P39','11111111139','99990039','p39@m.com'), ('P40','11111111140','99990040','p40@m.com'),
('P41','11111111141','99990041','p41@m.com'), ('P42','11111111142','99990042','p42@m.com'), ('P43','11111111143','99990043','p43@m.com'), ('P44','11111111144','99990044','p44@m.com'), ('P45','11111111145','99990045','p45@m.com'),
('P46','11111111146','99990046','p46@m.com'), ('P47','11111111147','99990047','p47@m.com'), ('P48','11111111148','99990048','p48@m.com'), ('P49','11111111149','99990049','p49@m.com'), ('P50','11111111150','99990050','p50@m.com');


INSERT INTO responsavel (matricula_responsavel, cpf, telefone, email, id_aluno) VALUES 
('R01','22222222201','88880001','r1@m.com',1), ('R02','22222222202','88880002','r2@m.com',2), ('R03','22222222203','88880003','r3@m.com',3), ('R04','22222222204','88880004','r4@m.com',4), ('R05','22222222205','88880005','r5@m.com',5),
('R06','22222222206','88880006','r6@m.com',6), ('R07','22222222207','88880007','r7@m.com',7), ('R08','22222222208','88880008','r8@m.com',8), ('R09','22222222209','88880009','r9@m.com',9), ('R10','22222222210','88880010','r10@m.com',10),
('R11','22222222211','88880011','r11@m.com',11), ('R12','22222222212','88880012','r12@m.com',12), ('R13','22222222213','88880013','r13@m.com',13), ('R14','22222222214','88880014','r14@m.com',14), ('R15','22222222215','88880015','r15@m.com',15),
('R16','22222222216','88880016','r16@m.com',16), ('R17','22222222217','88880017','r17@m.com',17), ('R18','22222222218','88880018','r18@m.com',18), ('R19','22222222219','88880019','r19@m.com',19), ('R20','22222222220','88880020','r20@m.com',20),
('R21','22222222221','88880021','r21@m.com',21), ('R22','22222222222','88880022','r22@m.com',22), ('R23','22222222223','88880023','r23@m.com',23), ('R24','22222222224','88880024','r24@m.com',24), ('R25','22222222225','88880025','r25@m.com',25),
('R26','22222222226','88880026','r26@m.com',26), ('R27','22222222227','88880027','r27@m.com',27), ('R28','22222222228','88880028','r28@m.com',28), ('R29','22222222229','88880029','r29@m.com',29), ('R30','22222222230','88880030','r30@m.com',30),
('R31','22222222231','88880031','r31@m.com',31), ('R32','22222222232','88880032','r32@m.com',32), ('R33','22222222233','88880033','r33@m.com',33), ('R34','22222222234','88880034','r34@m.com',34), ('R35','22222222235','88880035','r35@m.com',35),
('R36','22222222236','88880036','r36@m.com',36), ('R37','22222222237','88880037','r37@m.com',37), ('R38','22222222238','88880038','r38@m.com',38), ('R39','22222222239','88880039','r39@m.com',39), ('R40','22222222240','88880040','r40@m.com',40),
('R41','22222222241','88880041','r41@m.com',41), ('R42','22222222242','88880042','r42@m.com',42), ('R43','22222222243','88880043','r43@m.com',43), ('R44','22222222244','88880044','r44@m.com',44), ('R45','22222222245','88880045','r45@m.com',45),
('R46','22222222246','88880046','r46@m.com',46), ('R47','22222222247','88880047','r47@m.com',47), ('R48','22222222248','88880048','r48@m.com',48), ('R49','22222222249','88880049','r49@m.com',49), ('R50','22222222250','88880050','r50@m.com',50);


INSERT INTO hospital (nome_hospital, endereco) VALUES 
('Hosp Infantil 1', 'Rua A, 1'), ('Hosp Infantil 2', 'Rua B, 2'), ('Hosp Infantil 3', 'Rua C, 3'), ('Hosp Infantil 4', 'Rua D, 4'), ('Hosp Infantil 5', 'Rua E, 5'),
('Hosp Infantil 6', 'Rua F, 6'), ('Hosp Infantil 7', 'Rua G, 7'), ('Hosp Infantil 8', 'Rua H, 8'), ('Hosp Infantil 9', 'Rua I, 9'), ('Hosp Infantil 10', 'Rua J, 10'),
('Hosp Infantil 11', 'Rua K, 11'), ('Hosp Infantil 12', 'Rua L, 12'), ('Hosp Infantil 13', 'Rua M, 13'), ('Hosp Infantil 14', 'Rua N, 14'), ('Hosp Infantil 15', 'Rua O, 15'),
('Hosp Infantil 16', 'Rua P, 16'), ('Hosp Infantil 17', 'Rua Q, 17'), ('Hosp Infantil 18', 'Rua R, 18'), ('Hosp Infantil 19', 'Rua S, 19'), ('Hosp Infantil 20', 'Rua T, 20'),
('Hosp Infantil 21', 'Rua U, 21'), ('Hosp Infantil 22', 'Rua V, 22'), ('Hosp Infantil 23', 'Rua W, 23'), ('Hosp Infantil 24', 'Rua X, 24'), ('Hosp Infantil 25', 'Rua Y, 25'),
('Hosp Infantil 26', 'Rua Z, 26'), ('Hosp Infantil 27', 'Rua AA, 27'), ('Hosp Infantil 28', 'Rua AB, 28'), ('Hosp Infantil 29', 'Rua AC, 29'), ('Hosp Infantil 30', 'Rua AD, 30'),
('Hosp Infantil 31', 'Rua AE, 31'), ('Hosp Infantil 32', 'Rua AF, 32'), ('Hosp Infantil 33', 'Rua AG, 33'), ('Hosp Infantil 34', 'Rua AH, 34'), ('Hosp Infantil 35', 'Rua AI, 35'),
('Hosp Infantil 36', 'Rua AJ, 36'), ('Hosp Infantil 37', 'Rua AK, 37'), ('Hosp Infantil 38', 'Rua AL, 38'), ('Hosp Infantil 39', 'Rua AM, 39'), ('Hosp Infantil 40', 'Rua AN, 40'),
('Hosp Infantil 41', 'Rua AO, 41'), ('Hosp Infantil 42', 'Rua AP, 42'), ('Hosp Infantil 43', 'Rua AQ, 43'), ('Hosp Infantil 44', 'Rua AR, 44'), ('Hosp Infantil 45', 'Rua AS, 45'),
('Hosp Infantil 46', 'Rua AT, 46'), ('Hosp Infantil 47', 'Rua AU, 47'), ('Hosp Infantil 48', 'Rua AV, 48'), ('Hosp Infantil 49', 'Rua AW, 49'), ('Hosp Infantil 50', 'Rua AX, 50');


INSERT INTO medico (matricula_medico, cpf, telefone, email, funcao, id_hospital) VALUES 
('M01','33333333301','77770001','m1@m.com','Pediatra', 1), ('M02','33333333302','77770002','m2@m.com','Oftalmologista', 1), ('M03','33333333303','77770003','m3@m.com','Pediatra', 1), ('M04','33333333304','77770004','m4@m.com','Neurologista', 1), ('M05','33333333305','77770005','m5@m.com','Pediatra', 1),
('M06','33333333306','77770006','m6@m.com','Oftalmologista', 1), ('M07','33333333307','77770007','m7@m.com','Pediatra', 1), ('M08','33333333308','77770008','m8@m.com','Fonoaudiólogo', 1), ('M09','33333333309','77770009','m9@m.com','Pediatra', 1), ('M10','33333333310','77770010','m10@m.com','Pediatra', 1),
('M11','33333333311','77770011','m11@m.com','Pediatra', 1), ('M12','33333333312','77770012','m12@m.com','Oftalmologista', 1), ('M13','33333333313','77770013','m13@m.com','Pediatra', 1), ('M14','33333333314','77770014','m14@m.com','Neurologista', 1), ('M15','33333333315','77770015','m15@m.com','Pediatra', 1),
('M16','33333333316','77770016','m16@m.com','Oftalmologista', 1), ('M17','33333333317','77770017','m17@m.com','Pediatra', 1), ('M18','33333333318','77770018','m18@m.com','Fonoaudiólogo', 1), ('M19','33333333319','77770019','m19@m.com','Pediatra', 1), ('M20','33333333320','77770020','m20@m.com','Pediatra', 1),
('M21','33333333321','77770021','m21@m.com','Pediatra', 1), ('M22','33333333322','77770022','m22@m.com','Oftalmologista', 1), ('M23','33333333323','77770023','m23@m.com','Pediatra', 1), ('M24','33333333324','77770024','m24@m.com','Neurologista', 1), ('M25','33333333325','77770025','m25@m.com','Pediatra', 1),
('M26','33333333326','77770026','m26@m.com','Oftalmologista', 1), ('M27','33333333327','77770027','m27@m.com','Pediatra', 1), ('M28','33333333328','77770028','m28@m.com','Fonoaudiólogo', 1), ('M29','33333333329','77770029','m29@m.com','Pediatra', 1), ('M30','33333333330','77770030','m30@m.com','Pediatra', 1),
('M31','33333333331','77770031','m31@m.com','Pediatra', 1), ('M32','33333333332','77770032','m32@m.com','Oftalmologista', 1), ('M33','33333333333','77770033','m33@m.com','Pediatra', 1), ('M34','33333333334','77770034','m34@m.com','Neurologista', 1), ('M35','33333333335','77770035','m35@m.com','Pediatra', 1),
('M36','33333333336','77770036','m36@m.com','Oftalmologista', 1), ('M37','33333333337','77770037','m37@m.com','Pediatra', 1), ('M38','33333333338','77770038','m38@m.com','Fonoaudiólogo', 1), ('M39','33333333339','77770039','m39@m.com','Pediatra', 1), ('M40','33333333340','77770040','m40@m.com','Pediatra', 1),
('M41','33333333341','77770041','m41@m.com','Pediatra', 1), ('M42','33333333342','77770042','m42@m.com','Oftalmologista', 1), ('M43','33333333343','77770043','m43@m.com','Pediatra', 1), ('M44','33333333344','77770044','m44@m.com','Neurologista', 1), ('M45','33333333345','77770045','m45@m.com','Pediatra', 1),
('M46','33333333346','77770046','m46@m.com','Oftalmologista', 1), ('M47','33333333347','77770047','m47@m.com','Pediatra', 1), ('M48','33333333348','77770048','m48@m.com','Fonoaudiólogo', 1), ('M49','33333333349','77770049','m49@m.com','Pediatra', 1), ('M50','33333333350','77770050','m50@m.com','Pediatra', 1);


INSERT INTO atividades (nome_atividade, niveis_totais, niveis_concluidos) VALUES 
('Vogais', 3, 1), ('Consoantes', 3, 0), ('Sílabas', 3, 0), ('Palavras', 3, 0), ('Números', 3, 1),
('Cores', 3, 2), ('Animais', 3, 1), ('Frutas', 3, 0), ('Objetos', 3, 1), ('Veículos', 3, 0),
('Verbos 1', 3, 0), ('Verbos 2', 3, 1), ('Adjetivos', 3, 0), ('Opostos', 3, 1), ('Formas', 3, 2),
('Corpo Humano', 3, 0), ('Roupas', 3, 1), ('Clima', 3, 0), ('Profissões', 3, 1), ('Emoções', 3, 0),
('Natureza', 3, 0), ('Escola', 3, 1), ('Família', 3, 0), ('Casa', 3, 1), ('Brinquedos', 3, 2),
('Esportes', 3, 0), ('Música', 3, 1), ('Alimentos', 3, 0), ('Bebidas', 3, 1), ('Doces', 3, 0),
('Legumes', 3, 0), ('Insetos', 3, 1), ('Aves', 3, 0), ('Peixes', 3, 1), ('Dinossauros', 3, 2),
('Planetas', 3, 0), ('Estações', 3, 1), ('Meses', 3, 0), ('Dias da Semana', 3, 1), ('Horas', 3, 0),
('Direções', 3, 0), ('TamanSizes', 3, 1), ('Posições', 3, 0), ('Sentidos', 3, 1), ('Higiene', 3, 2),
('Ferramentas', 3, 0), ('Instrumentos', 3, 1), ('Países', 3, 0), ('Idiomas', 3, 1), ('Moedas', 3, 0);


INSERT INTO aula (id_atividades, id_professor, nivel, disponivel) VALUES 
(1, 1, 'Básico', TRUE), (1, 1, 'Reconhecimento', FALSE), (1, 1, 'Intermediário', FALSE), 
(2, 1, 'Básico', TRUE), (2, 1, 'Reconhecimento', FALSE), (2, 1, 'Intermediário', FALSE), 
(3, 1, 'Básico', TRUE), (3, 1, 'Reconhecimento', FALSE), (3, 1, 'Intermediário', FALSE), 
(4, 1, 'Básico', TRUE), (4, 1, 'Reconhecimento', FALSE), (4, 1, 'Intermediário', FALSE),
(5, 1, 'Básico', TRUE), (5, 1, 'Reconhecimento', TRUE), (5, 1, 'Intermediário', FALSE),
(6, 1, 'Básico', TRUE), (6, 1, 'Reconhecimento', TRUE), (6, 1, 'Intermediário', TRUE),
(7, 1, 'Básico', TRUE), (7, 1, 'Reconhecimento', FALSE), (7, 1, 'Intermediário', FALSE),
(8, 1, 'Básico', TRUE), (8, 1, 'Reconhecimento', FALSE), (8, 1, 'Intermediário', FALSE),
(9, 1, 'Básico', TRUE), (9, 1, 'Reconhecimento', FALSE), (9, 1, 'Intermediário', FALSE),
(10, 1, 'Básico', TRUE), (10, 1, 'Reconhecimento', FALSE), (10, 1, 'Intermediário', FALSE),
(11, 1, 'Básico', TRUE), (11, 1, 'Reconhecimento', FALSE), (11, 1, 'Intermediário', FALSE),
(12, 1, 'Básico', TRUE), (12, 1, 'Reconhecimento', FALSE), (12, 1, 'Intermediário', FALSE),
(13, 1, 'Básico', TRUE), (13, 1, 'Reconhecimento', FALSE), (13, 1, 'Intermediário', FALSE),
(14, 1, 'Básico', TRUE), (14, 1, 'Reconhecimento', FALSE), (14, 1, 'Intermediário', FALSE),
(15, 1, 'Básico', TRUE), (15, 1, 'Reconhecimento', FALSE), (15, 1, 'Intermediário', FALSE),
(16, 1, 'Básico', TRUE), (16, 1, 'Reconhecimento', FALSE), (16, 1, 'Intermediário', FALSE),
(17, 1, 'Básico', TRUE), (17, 1, 'Reconhecimento', FALSE);


INSERT INTO progresso (id_aluno, id_nivel, recompensa) VALUES 
(1, 1, 3), (2, 1, 2), (3, 1, 3), (4, 1, 1), (5, 1, 3), (6, 2, 2), (7, 2, 3), (8, 2, 1), (9, 2, 3), (10, 3, 2),
(11, 3, 3), (12, 3, 1), (13, 3, 3), (14, 4, 2), (15, 4, 3), (16, 4, 1), (17, 4, 3), (18, 5, 2), (19, 5, 3), (20, 5, 1),
(21, 6, 3), (22, 6, 2), (23, 6, 3), (24, 7, 1), (25, 7, 3), (26, 7, 2), (27, 8, 3), (28, 8, 1), (29, 8, 3), (30, 9, 2),
(31, 9, 3), (32, 9, 1), (33, 10, 3), (34, 10, 2), (35, 10, 3), (36, 11, 1), (37, 11, 3), (38, 11, 2), (39, 12, 3), (40, 12, 1),
(41, 13, 3), (42, 13, 2), (43, 13, 3), (44, 14, 1), (45, 14, 3), (46, 14, 2), (47, 15, 3), (48, 15, 1), (49, 15, 3), (50, 16, 2);


INSERT INTO prontuario (id_aluno, desc_prontuario) VALUES 
(1, 'Normal'), (2, 'Miopia leve'), (3, 'Normal'), (4, 'Atraso fala'), (5, 'Normal'), (6, 'Normal'), (7, 'Asma'), (8, 'Normal'), (9, 'Normal'), (10, 'TDHA leve'),
(11, 'Normal'), (12, 'Normal'), (13, 'Normal'), (14, 'Normal'), (15, 'Usa óculos'), (16, 'Normal'), (17, 'Normal'), (18, 'Normal'), (19, 'Normal'), (20, 'Normal'),
(21, 'Normal'), (22, 'Normal'), (23, 'Normal'), (24, 'Normal'), (25, 'Normal'), (26, 'Normal'), (27, 'Normal'), (28, 'Normal'), (29, 'Normal'), (30, 'Normal'),
(31, 'Normal'), (32, 'Normal'), (33, 'Normal'), (34, 'Normal'), (35, 'Normal'), (36, 'Normal'), (37, 'Normal'), (38, 'Normal'), (39, 'Normal'), (40, 'Normal'),
(41, 'Normal'), (42, 'Normal'), (43, 'Normal'), (44, 'Normal'), (45, 'Normal'), (46, 'Normal'), (47, 'Normal'), (48, 'Normal'), (49, 'Normal'), (50, 'Normal');


INSERT INTO chamado_medico (id_medico, id_aluno, desc_chamado) VALUES 
(1, 1, 'Rotina'), (2, 2, 'Exame vista'), (1, 3, 'Rotina'), (4, 4, 'Avaliação'), (1, 5, 'Rotina'), (1, 6, 'Rotina'), (1, 7, 'Crise asma'), (8, 8, 'Fono'), (1, 9, 'Rotina'), (4, 10, 'Avaliação TDHA'),
(1, 11, 'Rotina'), (1, 12, 'Rotina'), (1, 13, 'Rotina'), (1, 14, 'Rotina'), (2, 15, 'Retorno óculos'), (1, 16, 'Rotina'), (1, 17, 'Rotina'), (1, 18, 'Rotina'), (1, 19, 'Rotina'), (1, 20, 'Rotina'),
(1, 21, 'Rotina'), (1, 22, 'Rotina'), (1, 23, 'Rotina'), (1, 24, 'Rotina'), (1, 25, 'Rotina'), (1, 26, 'Rotina'), (1, 27, 'Rotina'), (1, 28, 'Rotina'), (1, 29, 'Rotina'), (1, 30, 'Rotina'),
(1, 31, 'Rotina'), (1, 32, 'Rotina'), (1, 33, 'Rotina'), (1, 34, 'Rotina'), (1, 35, 'Rotina'), (1, 36, 'Rotina'), (1, 37, 'Rotina'), (1, 38, 'Rotina'), (1, 39, 'Rotina'), (1, 40, 'Rotina'),
(1, 41, 'Rotina'), (1, 42, 'Rotina'), (1, 43, 'Rotina'), (1, 44, 'Rotina'), (1, 45, 'Rotina'), (1, 46, 'Rotina'), (1, 47, 'Rotina'), (1, 48, 'Rotina'), (1, 49, 'Rotina'), (1, 50, 'Rotina');


INSERT INTO sessao (id_aluno, tempo_jogado_minutos, data_sessao) VALUES 
(1, 30, '2026-05-01'), (2, 45, '2026-05-01'), (3, 20, '2026-05-01'), (4, 60, '2026-05-02'), (5, 15, '2026-05-02'), (6, 30, '2026-05-02'), (7, 45, '2026-05-03'), (8, 25, '2026-05-03'), (9, 35, '2026-05-03'), (10, 50, '2026-05-04'),
(11, 30, '2026-05-04'), (12, 40, '2026-05-04'), (13, 20, '2026-05-05'), (14, 60, '2026-05-05'), (15, 15, '2026-05-05'), (16, 30, '2026-05-06'), (17, 45, '2026-05-06'), (18, 25, '2026-05-06'), (19, 35, '2026-05-07'), (20, 50, '2026-05-07'),
(21, 30, '2026-05-07'), (22, 40, '2026-05-08'), (23, 20, '2026-05-08'), (24, 60, '2026-05-08'), (25, 15, '2026-05-09'), (26, 30, '2026-05-09'), (27, 45, '2026-05-09'), (28, 25, '2026-05-10'), (29, 35, '2026-05-10'), (30, 50, '2026-05-10'),
(31, 30, '2026-05-11'), (32, 40, '2026-05-11'), (33, 20, '2026-05-11'), (34, 60, '2026-05-12'), (35, 15, '2026-05-12'), (36, 30, '2026-05-12'), (37, 45, '2026-05-13'), (38, 25, '2026-05-13'), (39, 35, '2026-05-13'), (40, 50, '2026-05-14'),
(41, 30, '2026-05-14'), (42, 40, '2026-05-14'), (43, 20, '2026-05-15'), (44, 60, '2026-05-15'), (45, 15, '2026-05-15'), (46, 30, '2026-05-16'), (47, 45, '2026-05-16'), (48, 25, '2026-05-16'), (49, 35, '2026-05-17'), (50, 50, '2026-05-17');


SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM responsavel;
SELECT * FROM medico;
SELECT * FROM hospital;
SELECT * FROM atividades;
SELECT * FROM aula;
SELECT * FROM progresso;
SELECT * FROM prontuario;
SELECT * FROM chamado_medico;
SELECT * FROM sessao;
SELECT matricula_aluno, idade FROM aluno;
SELECT nome_atividade FROM atividades;
SELECT funcao FROM medico;
SELECT endereco FROM hospital;


SELECT * FROM aluno WHERE idade > 5;
SELECT * FROM aluno WHERE idade = 4;
SELECT * FROM medico WHERE funcao = 'Pediatra';
SELECT * FROM medico WHERE funcao = 'Oftalmologista';
SELECT * FROM aula WHERE disponivel = TRUE;
SELECT * FROM aula WHERE nivel = 'Básico';
SELECT * FROM aula WHERE nivel = 'Reconhecimento';
SELECT * FROM atividades WHERE niveis_concluidos > 0;
SELECT * FROM progresso WHERE recompensa = 3;
SELECT * FROM progresso WHERE recompensa < 2;
SELECT * FROM prontuario WHERE desc_prontuario != 'Normal';
SELECT * FROM sessao WHERE tempo_jogado_minutos > 30;
SELECT * FROM sessao WHERE data_sessao = '2026-05-01';
SELECT * FROM responsavel WHERE id_aluno = 5;
SELECT * FROM chamado_medico WHERE id_medico = 1;


SELECT a.matricula_aluno, r.email FROM aluno a JOIN responsavel r ON a.id_aluno = r.id_aluno;
SELECT a.matricula_aluno, p.recompensa FROM aluno a JOIN progresso p ON a.id_aluno = p.id_aluno;
SELECT at.nome_atividade, au.nivel FROM atividades at JOIN aula au ON at.id = au.id_atividades;
SELECT a.matricula_aluno, pr.desc_prontuario FROM aluno a JOIN prontuario pr ON a.id_aluno = pr.id_aluno;
SELECT m.funcao, c.desc_chamado FROM medico m JOIN chamado_medico c ON m.id_medico = c.id_medico;
SELECT a.matricula_aluno, c.desc_chamado, m.funcao FROM aluno a JOIN chamado_medico c ON a.id_aluno = c.id_aluno JOIN medico m ON c.id_medico = m.id_medico;
SELECT a.matricula_aluno, s.tempo_jogado_minutos FROM aluno a JOIN sessao s ON a.id_aluno = s.id_aluno;
SELECT r.telefone, pr.desc_prontuario FROM responsavel r JOIN prontuario pr ON r.id_aluno = pr.id_aluno;
SELECT au.nivel, p.recompensa FROM aula au JOIN progresso p ON au.id = p.id_nivel;
SELECT at.nome_atividade, p.recompensa FROM atividades at JOIN aula au ON at.id = au.id_atividades JOIN progresso p ON au.id = p.id_nivel;


SELECT COUNT(*) AS total_alunos FROM aluno;
SELECT COUNT(*) AS total_pediatras FROM medico WHERE funcao = 'Pediatra';
SELECT COUNT(*) AS total_aulas_basicas FROM aula WHERE nivel = 'Básico';


SELECT SUM(tempo_jogado_minutos) AS total_minutos_jogados FROM sessao;
SELECT SUM(niveis_concluidos) AS total_niveis_concluidos FROM atividades;
SELECT SUM(recompensa) AS total_estrelas_ganhas FROM progresso;


SELECT AVG(idade) AS media_idade_alunos FROM aluno;
SELECT AVG(tempo_jogado_minutos) AS media_tempo_sessao FROM sessao;
SELECT AVG(recompensa) AS media_estrelas_por_nivel FROM progresso;	

UPDATE aluno SET idade = 6 WHERE id_aluno = 1;
UPDATE aluno SET idade = 7 WHERE id_aluno = 2;
UPDATE aula SET disponivel = TRUE WHERE id = 2;
UPDATE aula SET disponivel = TRUE WHERE id = 3;
UPDATE atividades SET niveis_concluidos = 2 WHERE id = 1;
UPDATE progresso SET recompensa = 3 WHERE id = 2;
UPDATE medico SET telefone = '77779999' WHERE id_medico = 1;
UPDATE responsavel SET email = 'novo_r1@m.com' WHERE id_responsavel = 1;
UPDATE prontuario SET desc_prontuario = 'Usa óculos agora' WHERE id_aluno = 1;
UPDATE sessao SET tempo_jogado_minutos = 45 WHERE id_sessao = 1;


DELETE FROM chamado_medico WHERE id = 50;
DELETE FROM chamado_medico WHERE id = 49;
DELETE FROM sessao WHERE id_sessao = 50;
DELETE FROM sessao WHERE id_sessao = 49;
DELETE FROM progresso WHERE id = 50;
DELETE FROM progresso WHERE id = 49;
DELETE FROM prontuario WHERE id = 50;
DELETE FROM prontuario WHERE id = 49;
DELETE FROM hospital WHERE id_hospital = 50;
DELETE FROM hospital WHERE id_hospital = 49;