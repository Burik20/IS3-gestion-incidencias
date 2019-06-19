--script para generar una tabla de clientes--
create table clientes 
	(
dni double precision not null,
	apellido character varying (30), 
	
ciudad character varying (30),

	constraint dni primary key (dni)
);