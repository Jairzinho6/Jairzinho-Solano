USE BdiExamen;
GO

CREATE TABLE tblExamen(
	idExamen INT NOT NULL,
	nombre VARCHAR(255) NULL,
	descripcion VARCHAR(255) NULL,
	);

GO

ALTER TABLE tblExamen ADD CONSTRAINT PK_tblExamen PRIMARY KEY (idExamen);
GO

