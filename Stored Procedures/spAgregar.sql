CREATE PROCEDURE SPAgregar
    @id INT,
    @nombre VARCHAR(255),
    @descripcion VARCHAR(255),
    @errorCode INT OUTPUT,
    @errorMessage VARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT * FROM tblExamen WHERE idExamen = @id)
    BEGIN
        SET @errorCode = 1;
        SET @errorMessage = 'Ya existe un registro con este id';
        RETURN;
    END

    BEGIN TRY
        INSERT INTO tblExamen (idExamen, nombre, descripcion) VALUES (@id, @nombre, @descripcion);
        SET @errorCode = 0;
        SET @errorMessage = 'Registro insertado satisfactoriamente';
    END TRY
    BEGIN CATCH
        SET @errorCode = ERROR_NUMBER();
        SET @errorMessage = ERROR_MESSAGE();
    END CATCH
END
GO
