CREATE PROCEDURE SPEliminar
    @id INT,
    @errorCode INT OUTPUT,
    @errorMessage VARCHAR(255) OUTPUT
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
        DELETE FROM tblExamen WHERE idExamen = @id;
        SET @errorCode = 0;
        SET @errorMessage = 'Registro eliminado satisfactoriamente';
    END TRY
    BEGIN CATCH
        SET @errorCode = ERROR_NUMBER();
        SET @errorMessage = ERROR_MESSAGE();
    END CATCH
END
GO
