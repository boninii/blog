-- Criação do banco de dados 
create database blog;

-- Selecionar banco de dados 
use blog;

-- Criação da tabela usuario
create table usuario (
	id int not null auto_increment,
    nome varchar(50) not null,
    email varchar(255) not null,
    senha varchar(60) not null,
    data_criacao datetime not null default current_timestamp,
    ativo tinyint not null default '0',
    adm tinyint not null default '0',
    primary key (id)
);

-- Criação da tabela post
create table post (
    id int not null auto_increment,
    titulo varchar(255) not null,
    texto text not null,
    usuario_id int not null,
    data_criacao datetime not null default current_timestamp,
    data_postagem datetime not null,
    primary key (id),
    key fk_post_usuario_idx (usuario_id),
    constraint fk_post_usuario foreign key (usuario_id) references usuario (id)
);

-- Criação da tabela avaliação
create table avaliacao (
    id int not null auto_increment,
    nota int not null,
    comentario varchar(255) not null,
    usuario_id int not null,
    post_id int not null,
    data_criacao datetime not null default current_timestamp,
    primary key (id),
    constraint fk_avaliacao_usuario foreign key (usuario_id) references usuario (id),
    constraint fk_avaliacao_post foreign key (post_id) references post (id)
);

SELECT * FROM usuario;

/* insert into post (titulo, texto, usuario_id) values ("Curinga", "Curinga, ganhar, tatu, bola", 2);*/

