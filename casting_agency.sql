SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

DROP TABLE IF EXISTS public.actor_in_movie;
CREATE TABLE public.actor_in_movie (
    actor_id integer NOT NULL,
    movie_id integer NOT NULL
);


DROP TABLE IF EXISTS public.actors;
CREATE TABLE public.actors (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    full_name character varying(512) NOT NULL,
    date_of_birth date NOT NULL
);


DROP SEQUENCE IF EXISTS public.actors_id_seq;
CREATE SEQUENCE public.actors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.actors_id_seq OWNED BY public.actors.id;

DROP TABLE IF EXISTS public.alembic_version;
CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);

DROP TABLE IF EXISTS public.movies;
CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying(256) NOT NULL,
    release_year integer NOT NULL,
    duration integer NOT NULL,
    imdb_rating double precision NOT NULL
);

DROP SEQUENCE IF EXISTS public.movies_id_seq;
CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ONLY public.actors ALTER COLUMN id SET DEFAULT nextval('public.actors_id_seq'::regclass);
ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);
SELECT pg_catalog.setval('public.movies_id_seq', 1, false);

ALTER TABLE ONLY public.actor_in_movie
    ADD CONSTRAINT actor_in_movie_pkey PRIMARY KEY (actor_id, movie_id);

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.actor_in_movie
    ADD CONSTRAINT actor_in_movie_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(id);

ALTER TABLE ONLY public.actor_in_movie
    ADD CONSTRAINT actor_in_movie_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);

INSERT INTO public.actors(name, full_name, date_of_birth)
VALUES
    ('Tom Hanks', 'Thomas Jeffrey Hanks', 'July 9, 1956'),
    ('Meryl Streep', 'Mary Louise Streep', 'June 22, 1949'),
    ('Leonardo DiCaprio', 'Leonardo Wilhelm DiCaprio', 'November 11, 1974'),
    ('Jennifer Lawrence', 'Jennifer Shrader Lawrence', 'August 15, 1990'),
    ('Brad Pitt', 'William Bradley Pitt', 'December 18, 1963'),
    ('Natalie Portman', 'Natalie Hershlag', 'June 9, 1981'),
    ('Denzel Washington', 'Denzel Hayes Washington Jr.', 'December 28, 1954'),
    ('Emma Stone', 'Emily Jean Stone', 'November 6, 1988'),
    ('Johnny Depp', 'John Christopher Depp II', 'June 9, 1963'),
    ('Charlize Theron', 'Charlize Theron', 'August 7, 1975');

INSERT INTO public.movies(title, release_year, duration, imdb_rating)
VALUES
    ('Inception', 2010, 148, 8.8),
    ('The Dark Knight', 2008, 152, 9.0),
    ('Pulp Fiction', 1994, 154, 8.9),
    ('Fight Club', 1999, 139, 8.8),
    ('The Shawshank Redemption', 1994, 142, 9.3),
    ('The Godfather', 1972, 175, 9.2),
    ('The Matrix', 1999, 136, 8.7),
    ('Interstellar', 2014, 169, 8.6),
    ('Forrest Gump', 1994, 142, 8.8),
    ('The Lord of the Rings: The Return of the King', 2003, 201, 8.9);

INSERT INTO public.actor_in_movie(actor_id, movie_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 4),
    (9, 5),
    (1, 5),
    (2, 6),
    (3, 6),
    (4, 7),
    (5, 7),
    (6, 8);


