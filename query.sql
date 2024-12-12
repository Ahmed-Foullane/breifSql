-- 1. Afficher tous les membres du BDE avec leur rôle et leur date d'adhésion
SELECT nom, prenom, role, date_adhesion 
FROM MEMBRE_BDE 
ORDER BY date_adhesion;

-- 2. Lister tous les événements prévus après une date donnée
SELECT * 
FROM EVENEMENT 
WHERE date_heure > '2024-02-01 00:00:00' 
ORDER BY date_heure;

-- 3. Afficher les informations des événements ayant un budget supérieur à 5000 MAD
SELECT * 
FROM EVENEMENT 
WHERE budget > 5000 
ORDER BY budget DESC;

-- 4. Lister les participants inscrits à un événement spécifique
SELECT p.nom, p.prenom, p.email, i.date_inscription 
FROM PARTICIPANT p 
JOIN INSCRIPTION i ON p.id_participant = i.id_participant 
WHERE i.id_evenement = 1;

-- 5. Afficher les sponsors qui ont contribué à des événements ayant un budget supérieur à 3500 MAD
SELECT DISTINCT s.nom_entreprise, s.nom_contact, e.nom as nom_evenement, e.budget 
FROM SPONSOR s 
JOIN SPONSORING sp ON s.id_sponsor = sp.id_sponsor 
JOIN EVENEMENT e ON sp.id_evenement = e.id_evenement 
WHERE e.budget > 3500;

-- 6. Compter le nombre total d'événements organisés par le BDE
SELECT COUNT(*) as nombre_evenements 
FROM EVENEMENT;

-- 7. Calculer la moyenne du budget des événements organisés
SELECT AVG(budget) as moyenne_budget 
FROM EVENEMENT;

-- 8. Afficher le nom et la date des événements sponsorisés par un sponsor donné
SELECT e.nom, e.date_heure, s.montant 
FROM EVENEMENT e 
JOIN SPONSORING s ON e.id_evenement = s.id_evenement 
WHERE s.id_sponsor = 1;

-- 9. Lister les événements qui se déroulent dans un lieu donné
SELECT * 
FROM EVENEMENT 
WHERE lieu LIKE '%Campus%';

-- 10. Afficher les 5 derniers événements organisés par le BDE
SELECT * 
FROM EVENEMENT 
ORDER BY date_heure DESC 
LIMIT 5;

-- 11. Lister les membres du BDE qui ont rejoint avant une date donnée
SELECT * 
FROM MEMBRE_BDE 
WHERE date_adhesion < '2023-10-01';

-- 12. Compter le nombre total de participants à un événement donné
SELECT e.nom, COUNT(i.id_participant) as nombre_participants 
FROM EVENEMENT e 
LEFT JOIN INSCRIPTION i ON e.id_evenement = i.id_evenement 
WHERE e.id_evenement = 1 
GROUP BY e.id_evenement, e.nom;

-- 13. Afficher les noms des sponsors ayant contribué à plus d'un événement
SELECT s.nom_entreprise, COUNT(sp.id_evenement) as nombre_evenements 
FROM SPONSOR s 
JOIN SPONSORING sp ON s.id_sponsor = sp.id_sponsor 
GROUP BY s.id_sponsor, s.nom_entreprise 
HAVING COUNT(sp.id_evenement) > 1;
