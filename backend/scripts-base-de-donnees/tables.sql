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
    idTest INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    idPersonne INTEGER NOT NULL,
    testEffect DATE NOT NULL,
    testExpiration DATE NOT NULL,
    resultaTest BIT NOT NULL,
    CONSTRAINT fk_tbTest_tbPersonne FOREIGN key (idPersonne) REFERENCES tbPersonne (idPersonne),
);
--------------------------------------------------------------------------------------------------
CREATE TABLE tbVisite (
    idVisite INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    idPersonne INTEGER NOT NULL,
    idVille INTEGER NOT NULL,
    dateVisite DATE not NULL,
    CONSTRAINT fk_tbVisite_tbPersonne FOREIGN key (idPersonne) REFERENCES tbPersonne (idPersonne),
    CONSTRAINT fk_tbVisite_tbVille FOREIGN key (idVille) REFERENCES tbVille (idVille)
);
