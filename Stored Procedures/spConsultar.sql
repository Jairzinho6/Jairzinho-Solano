CREATE PROCEDURE SPConsultar
    @nombre VARCHAR(255) = NULL,
    @descripcion VARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT idExamen, nombre, descripcion
    FROM tblExamen
    WHERE (@nombre IS NULL OR nombre = @nombre)
      AND (@descripcion IS NULL OR descripcion = @descripcion);
END
GO
