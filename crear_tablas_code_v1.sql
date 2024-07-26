-- Crear la base de datos y entrar;
create database streaming;
use streaming;

-- Creacion de cada una de las tablas con su 'primary key';
create table USUARIOS(
id_usuario int primary key auto_increment,
nombre_usuario char(40) not null,
estado_cuenta tinyint not null,
nacionalidad char(3) not null
);
create table PELICULAS_VISTAS(
id_pelicula_visita int primary key auto_increment
);
create table VALORACIONES(
id_valoracion int primary key auto_increment,
valoracion char(20) not null
);
create table PELICULAS(
id_pelicula int primary key auto_increment,
titulo_pelicula char(60) not null,
fecha_lanzamiento date not null,
duracion time not null,
director char(40) not null
);
create table TIPOS(
id_tipo int primary key auto_increment,
tipo char(20) not null
);
create table CATEGORIAS(
id_categoria int primary key auto_increment,
categoria char(20) not null
);
create table GENEROS(
id_genero int primary key auto_increment,
genero char(20) not null
);
create table ACTORES(
id_actor int primary key auto_increment,
nombre char(40) not null,
fecha_nacimiento date not null,
nacionalidad char(3) not null,
vive tinyint not null
);

-- Asignacion de las 'foreign key' a las tablas correspondientes;
alter table PELICULAS
add id_tipo int not null,
add id_categoria int not null,
add id_genero int not null,
add id_actor int not null,
add foreign key (id_tipo) references TIPOS (id_tipo),
add foreign key (id_categoria) references CATEGORIAS (id_categoria),
add foreign key (id_genero) references GENEROS (id_genero),
add foreign key (id_actor) references ACTORES (id_actor);
alter table PELICULAS_VISTAS
add id_usuario int not null,
add id_pelicula int not null,
add id_valoracion int not null,
add foreign key (id_usuario) references USUARIOS (id_usuario),
add foreign key (id_pelicula) references PELICULAS (id_pelicula),
add foreign key (id_valoracion) references VALORACIONES (id_valoracion);
