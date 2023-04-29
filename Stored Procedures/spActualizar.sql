CREATE PROCEDURE SPActualizar
    @id INT,
    @nombre VARCHAR(255),
    @descripcion VARCHAR(255),
    @errorCode INT OUT,
    @errorMessage VARCHAR(255) OUT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT * FROM tblExamen WHERE idExamen = @id)
    BEGIN
        SET @errorCode = 1;
        SET @errorMessage = 'No existe un registro con este id';
        RETURN;
    END

    BEGIN TRY
        UPDATE tblExamen SET nombre = @nombre, descripcion = @descripcion WHERE idExamen = @id;
        SET @errorCode = 0;
        SET @errorMessage = 'Registro actualizado satisfactoriamente';
    END TRY
    BEGIN CATCH
        SET @errorCode = ERROR_NUMBER();
        SET @errorMessage = ERROR_MESSAGE();
    END CATCH
END
GO
