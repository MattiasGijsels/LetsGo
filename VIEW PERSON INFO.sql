CREATE VIEW PersonInfo AS
SELECT
    p.person_ID,
    c.countryName AS country,
    pc.postalCode,
    pc.municipality
FROM
    Person p
JOIN
    country c ON p.person_ID = c.ID
LEFT JOIN
    postalCode pc ON c.ID = pc.idCountry;

SELECT * FROM PersonInfo;