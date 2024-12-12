-- Active: 1733826594340@@127.0.0.1@3306@you_code_events

-- Creation of tables
CREATE DATABASE you_code_events;

USE  you_code_events;

SHOW TABLES;

CREATE TABLE MEMBRE_BDE (
    id_membre INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL,
    date_adhesion DATE NOT NULL
);

CREATE TABLE EVENEMENT (
    id_evenement INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    date_heure DATETIME NOT NULL,
    lieu VARCHAR(100) NOT NULL,
    budget DECIMAL(10,2) NOT NULL
);

CREATE TABLE PARTICIPANT (
    id_participant INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    statut VARCHAR(20) NOT NULL
);

CREATE TABLE SPONSOR (
    id_sponsor INT PRIMARY KEY AUTO_INCREMENT,
    nom_entreprise VARCHAR(100) NOT NULL,
    nom_contact VARCHAR(100) NOT NULL,
    email_contact VARCHAR(100) NOT NULL,
    telephone_contact VARCHAR(20) NOT NULL,
    montant_sponsoring DECIMAL(10,2)
);

CREATE TABLE ORGANISATION (
    id_membre INT,
    id_evenement INT,
    PRIMARY KEY (id_membre, id_evenement),
    FOREIGN KEY (id_membre) REFERENCES MEMBRE_BDE(id_membre),
    FOREIGN KEY (id_evenement) REFERENCES EVENEMENT(id_evenement)
);

CREATE TABLE INSCRIPTION (
    id_participant INT,
    id_evenement INT,
    date_inscription DATETIME NOT NULL,
    PRIMARY KEY (id_participant, id_evenement),
    FOREIGN KEY (id_participant) REFERENCES PARTICIPANT(id_participant),
    FOREIGN KEY (id_evenement) REFERENCES EVENEMENT(id_evenement)
);

CREATE TABLE SPONSORING (
    id_sponsor INT,
    id_evenement INT,
    montant DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_sponsor, id_evenement),
    FOREIGN KEY (id_sponsor) REFERENCES SPONSOR(id_sponsor),
    FOREIGN KEY (id_evenement) REFERENCES EVENEMENT(id_evenement)
);

-- Sample data insertion
INSERT INTO MEMBRE_BDE (nom, prenom, email, role, date_adhesion) VALUES
('El Amrani', 'Mohammed', 'mohammed@bde.ma', 'Président', '2023-09-01'),
('Benali', 'Fatima', 'fatima@bde.ma', 'Trésorier', '2023-09-01'),
('Kadiri', 'Youssef', 'youssef@bde.ma', 'Secrétaire', '2023-09-01'),
('Tazi', 'Amina', 'amina@bde.ma', 'Membre actif', '2023-10-15'),
('Bennis', 'Karim', 'karim@bde.ma', 'Membre actif', '2023-11-01');

INSERT INTO EVENEMENT (nom, description, date_heure, lieu, budget) VALUES
('Hackathon 2024', 'Compétition annuelle de programmation', '2024-03-15 09:00:00', 'Campus Principal', 10000.00),
('Soirée Networking', 'Rencontre avec les professionnels', '2024-02-20 18:00:00', 'Hôtel Sofitel', 5000.00),
('Workshop Tech', 'Atelier IA/ML', '2024-01-25 14:00:00', 'Laboratoire 101', 2000.00),
('Tournoi Sportif', 'Compétition inter-écoles', '2024-04-10 10:00:00', 'Complexe Sportif', 3500.00),
('Forum Carrières', 'Salon annuel de l emploi', '2024-05-05 09:00:00', 'Centre de Conférences', 8000.00);

INSERT INTO PARTICIPANT (nom, prenom, email, statut) VALUES
('Alaoui', 'Hassan', 'hassan@student.ma', 'étudiant'),
('Berrada', 'Leila', 'leila@student.ma', 'étudiant'),
('Chaoui', 'Omar', 'omar@alumni.ma', 'alumni'),
('Drissi', 'Sara', 'sara@student.ma', 'étudiant'),
('El Fassi', 'Mehdi', 'mehdi@guest.ma', 'invité');

INSERT INTO SPONSOR (nom_entreprise, nom_contact, email_contact, telephone_contact, montant_sponsoring) VALUES
('TechCorp Maroc', 'Mansouri Rachid', 'rachid@techcorp.ma', '+212600000001', 15000.00),
('DataSoft', 'Idrissi Samira', 'samira@datasoft.ma', '+212600000002', 10000.00),
('Innovation Labs', 'Benjelloun Ahmed', 'ahmed@innov.ma', '+212600000003', 8000.00),
('Digital Solutions', 'Chraibi Nadia', 'nadia@digital.ma', '+212600000004', 5000.00),
('Future Tech', 'Alami Hamid', 'hamid@futuretech.ma', '+212600000005', 12000.00);

INSERT INTO ORGANISATION (id_membre, id_evenement) VALUES
(1, 1), (2, 1), (3, 1),
(1, 2), (4, 2),
(2, 3), (5, 3),
(3, 4), (4, 4),
(1, 5), (2, 5), (5, 5);

INSERT INTO INSCRIPTION (id_participant, id_evenement, date_inscription) VALUES
(1, 1, '2024-01-10 10:00:00'),
(2, 1, '2024-01-11 11:00:00'),
(3, 2, '2024-01-15 09:00:00'),
(4, 3, '2024-01-12 14:00:00'),
(5, 4, '2024-01-13 16:00:00');

INSERT INTO SPONSORING (id_sponsor, id_evenement, montant) VALUES
(1, 1, 5000.00),
(2, 1, 3000.00),
(3, 2, 4000.00),
(4, 3, 2000.00),
(5, 5, 5000.00);