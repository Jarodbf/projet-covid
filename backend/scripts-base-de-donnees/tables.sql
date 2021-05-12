CREATE TABLE tbPersonne (
    idPersonne INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    nomPersonne VARCHAR(30) not NULL,
    prenomPersonne VARCHAR(30) not NULL,
    naissanceDate DATE not NULL,
    constraint pk_tbPersonne primary KEY (idPersonne)
);
----------------------------
CREATE TABLE tbVille (
    idVille INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    nomVille VARCHAR(30) not NULL,
	cpVille INTEGER NOT NULL,
    constraint pk_tbVille primary KEY (idVille)
);
----------------------------
CREATE TABLE tbTest (
    idPersonne INTEGER NOT NULL,
    testDate DATE not NULL,
    expiration DATE not NULL,
    resultaTest BIT NULL,
    idVille INTEGER NOT NULL,
    visitDate DATE not NULL,
    CONSTRAINT fk_tbTest_tbPersonne FOREIGN key (idPersonne) REFERENCES tbPersonne (idPersonne),
    CONSTRAINT fk_tbTest_tbVille FOREIGN key (idVille) REFERENCES tbVille (idVille)
);
--------------------------------------------------------------------------------------------------