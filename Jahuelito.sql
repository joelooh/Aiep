create database Jahuelito;
use Jahuelito;

create table autor(
id_autor int unsigned not null auto_increment,
nombre_autor varchar(50) not null,
primary key(id_autor)
);

insert into autor (id_autor, nombre_autor) values (null,"Maria Jose Ferrada");
insert into autor values(null,"Rowling, J. K.");
insert into autor values(null,"Jose Maria Maza");
insert into autor values(null,"Rius");
insert into autor values(null,"Isabel Allende");
insert into autor values(null,"Nicholas Allan");
insert into autor values(null,"Marcela Paz ");
insert into autor values(null,"Nadia Fink");
insert into autor values(null,"Equipo Editorial Larousse");

create table editorial(
id_editorial int unsigned not null auto_increment,
nombre_editorial varchar(100) not null,
primary key(id_editorial)
);

insert into editorial (id_editorial, nombre_editorial) values (null,"Maime Mujer");
insert into editorial values(null,"Planeta Lector");
insert into editorial values(null,"Planeta Junior");
insert into editorial values(null,"Lumen");
insert into editorial values(null,"Sudamericana");
insert into editorial values(null,"ekaré");
insert into editorial values(null,"Plaza & Janés; Sudamericana");
insert into editorial values(null,"Ediciones Sm");
insert into editorial values(null,"Salamandra");
insert into editorial values(null,"Larousse");

create table estado (
id_estado tinyint unsigned not null auto_increment,
descripción_estado tinytext not null,
primary key(id_estado)
);

insert into estado (id_estado, descripción_estado) values (null,"Bueno");
insert into estado values(null,"Malo");
insert into estado values(null,"Cambiar");


create table categoria(
id_categoria int unsigned auto_increment,
descripcion_categoria varchar(100),
primary key(id_categoria)
);

insert into categoria (id_categoria, descripcion_categoria) values (null,"Infantil");
insert into categoria values(null,"Ficción");
insert into categoria values(null,"Novela");
insert into categoria values(null,"Educativo");

create table libro(
id_libro int unsigned not null auto_increment,
nombre_libro varchar(100) not null,
id_autor int unsigned not null,
id_editorial int unsigned not null,
id_estado tinyint unsigned not null,
id_categoria int unsigned not null,
Prestamo varchar(2) not null,
primary key(id_libro),
foreign key(id_autor) references autor(id_autor),
foreign key(id_editorial) references editorial(id_editorial),
foreign key(id_estado) references estado(id_estado),
foreign key(id_categoria) references categoria(id_categoria)
);


insert into libro values(null,"Violeta Parra Para Niñas y Niños", 8, 1,1,1,"no" );
insert into libro values(null,"Papelucho Perdido", 7, 8,1,1,"no");
insert into libro values(null,"Papelucho, soy Dix-Leso?", 7, 8,1,1,"no");
insert into libro values(null,"Los Derechos de los Niños", 1, 2,1,1,"no");
insert into libro values(null,"Harry Potter y la Piedra Filosofal", 2, 9,2,2,"no");
insert into libro values(null,"Somos Polvo de Estrellas. Para Niños y Niñas", 3, 3,3,1,"no");
insert into libro values(null,"Atlas Para Niñas y Niños", 4, 4,3,1,"no");
insert into libro values(null,"El cuaderno de Maya", 5, 7,3,3,"no");
insert into libro values(null,"¡Qué animales!", 6, 6,1,1,"no");
insert into libro values(null,"La casa de los espíritus", 5, 5,3,3,"no");

create table estudiante(
id_estudiante int unsigned not null auto_increment,
rut_estudiante varchar(15) not null,
nombre_estudiante varchar (30) not null,
apellido_estudiante varchar(30)not null,
curso varchar (15) not null, 
primary key (id_estudiante)
);

insert into estudiante values (null,"19098661-3", "Diego", "Irarrazabal","octavo" );
insert into estudiante values (null,"20098661-3", "Diego", "Irarrazabal","Octavo");
insert into estudiante values (null,"21098661-k", "Juan", "Piña","Septimo");
insert into estudiante values (null,"20098661-1", "Ricardo", "Roco","Sexto");
insert into estudiante values (null,"21098661-2", "Daniela", "Lopez","Tercero");
insert into estudiante values (null,"22098661-3", "Naya", "Leiva","primero");
insert into estudiante values (null,"20021661-4", "Fernanda", "Delfín","Primero");
insert into estudiante values (null,"22033761-5", "larissa", "Lara","octavo");
insert into estudiante values (null,"21098679-6", "Estela", "Jara","octavo");
insert into estudiante values (null,"21036571-7", "Fabio", "Castillo","Sexto");


create table trabajador(
id_trabajador int unsigned not null auto_increment,
nombre_trabajador varchar(30) not null,
rut_trabajador varchar(15) not null,
apellido_trabajador varchar(30) not null,
primary key(id_trabajador)
);

insert into trabajador values (null,"18098661-3", "Carla", "Irarral" );
insert into trabajador values (null,"16098661-3", "Diego", "Rau");
insert into trabajador values (null,"16098661-3", "Liza", "Ravoltrich");
insert into trabajador values (null,"19098661-3", "Ana", "Lin");
insert into trabajador values (null,"14098661-3", "Valentina", "Sepulveda");


create table prestamo(
cod_prestamo int unsigned not null auto_increment,
fecha_prestamo date,
fecha_devolucion date, 
id_estudiante int unsigned,
id_trabajador int unsigned,
id_libro int unsigned not null,
primary key(cod_prestamo),
foreign key(id_estudiante) references estudiante(id_estudiante),
foreign key(id_trabajador) references trabajador(id_trabajador),
foreign key(id_libro) references libro(id_libro)
);

insert into prestamo values (null,"2021-10-08", "2021-10-22",3,null,11);
insert into prestamo values (null,"2021-10-11", "2021-10-25",null,1,4);
insert into prestamo values (null,"2021-10-20", "2021-11-22",10,null,5);

/*consultas*/
insert into estudiante values (null,"21036911-k", "Filipi", "Tapia","Segundo");
insert into libro values(null,"Diccionario Escolar Educativo", 9, 10,1,4,"si");

insert into prestamo values (null,"2021-10-20", "2021-11-22",1,null,6);

delete from prestamo where cod_prestamo=1;

select count(Prestamo) from libro where Prestamo="si";
select count(Prestamo) from libro where Prestamo="no";

update prestamo SET fecha_prestamo="2021-10-25", fecha_devolucion= "2021-11-08" where cod_prestamo =2;

select id_libro,nombre_libro,Prestamo,count(Prestamo) from libro where Prestamo="si";

update libro SET id_estado =3 where id_libro =1;


delete from trabajador where id_trabajador=4;