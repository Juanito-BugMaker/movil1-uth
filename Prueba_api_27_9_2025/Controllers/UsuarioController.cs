using Microsoft.AspNetCore.Mvc;
using Prueba.Contexts;
using Prueba.Models;
using System.Data.Common;

namespace Prueba.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsuarioController : ControllerBase
    {
        private readonly ConexionSQLServer _conexion;

        public UsuarioController(ConexionSQLServer conexion)
        {
            _conexion = conexion;
        }

        [HttpGet]
        public async Task<IActionResult> GetUsuarios()
        {
            var usuarios = new List<Usuarios>();

            using (var connection = _conexion.GetConnection())
            {
                await connection.OpenAsync();
                using (var command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT Id, Nombre FROM Usuario";

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            usuarios.Add(new Usuarios
                            {
                                Id = reader.GetInt32(0),
                                Nombre = reader.GetString(1)
                            });
                        }
                    }
                }
            }

            return Ok(usuarios);
        }

        [HttpPost]
        public async Task<IActionResult> CrearUsuario([FromBody] Usuarios usuario)
        {
            using (var connection = _conexion.GetConnection())
            {
                await connection.OpenAsync();
                using (var command = connection.CreateCommand())
                {
                    command.CommandText = "INSERT INTO Usuario (Id,Nombre) VALUES (@id,@nombre)";

                    var paramNombre = command.CreateParameter();
                    paramNombre.ParameterName = "@nombre";
                    paramNombre.Value = usuario.Nombre;
                    command.Parameters.Add(paramNombre);

                    var paramId = command.CreateParameter();
                    paramId.ParameterName = "@id";
                    paramId.Value = usuario.Id;
                    command.Parameters.Add(paramId);

                    await command.ExecuteNonQueryAsync();
                }
            }

            return Ok("Usuario creado correctamente");
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> ActualizarUsuario(int id, [FromBody] Usuarios usuario)
        {
            using (var connection = _conexion.GetConnection())
            {
                await connection.OpenAsync();
                using (var command = connection.CreateCommand())
                {
                    command.CommandText = "UPDATE Usuario SET Nombre = @nombre WHERE Id = @id";

                    var paramNombre = command.CreateParameter();
                    paramNombre.ParameterName = "@nombre";
                    paramNombre.Value = usuario.Nombre;
                    command.Parameters.Add(paramNombre);

                    var paramId = command.CreateParameter();
                    paramId.ParameterName = "@id";
                    paramId.Value = id;
                    command.Parameters.Add(paramId);

                    int filasAfectadas = await command.ExecuteNonQueryAsync();

                    if (filasAfectadas == 0)
                        return NotFound($"No se encontró un usuario con Id {id}");
                }
            }

            return Ok("Usuario actualizado correctamente");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> EliminarUsuario(int id)
        {
            using (var connection = _conexion.GetConnection())
            {
                await connection.OpenAsync();
                using (var command = connection.CreateCommand())
                {
                    command.CommandText = "DELETE FROM Usuario WHERE Id = @id";

                    var paramId = command.CreateParameter();
                    paramId.ParameterName = "@id";
                    paramId.Value = id;
                    command.Parameters.Add(paramId);

                    int filasAfectadas = await command.ExecuteNonQueryAsync();

                    if (filasAfectadas == 0)
                        return NotFound($"No se encontró un usuario con Id {id}");
                }
            }

            return Ok("Usuario eliminado correctamente");
        }


    }
}
