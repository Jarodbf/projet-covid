--------------------------------------------

ALTER PROCEDURE sp_getVille()
RESULT (villeCp INTEGER, nomVille char(30))
BEGIN
    SELECT villeCp, nomVille
    FROM tbVille
END;

---------------------------------------