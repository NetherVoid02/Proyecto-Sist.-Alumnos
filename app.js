const express = require('express');
const app = express();
const path = require('path');

// ✅ Agregar estos middlewares para poder leer el cuerpo de las peticiones
app.use(express.json()); // Para peticiones con JSON (como fetch)
app.use(express.urlencoded({ extended: true })); // Para formularios HTML clásicos

// Archivos estáticos
app.use('/assets', express.static('assets'));
app.use('/views', express.static('views'));

// Ruta para servir index.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Rutas de la app
const alumnosRouter = require('./routes/alumnos');
app.use('/alumnos', alumnosRouter);

const materiasRouter = require('./routes/materias');
app.use('/materias', materiasRouter);

const cursosRouter = require('./routes/cursos');
app.use('/cursos', cursosRouter);

const planesRouter = require('./routes/planes');
app.use('/planes', planesRouter);

const tutoresRouter = require('./routes/tutores');
app.use('/tutores', tutoresRouter);

// Inicio del servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor escuchando en puerto ${PORT}`);
});
