--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    alive_cond boolean NOT NULL,
    years_lived integer,
    "desc" text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    years_lived integer,
    alive_cond boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_star_ref; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_star_ref (
    star_id integer NOT NULL,
    moon_id integer NOT NULL,
    alive_cond boolean NOT NULL,
    moon_star_ref_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.moon_star_ref OWNER TO freecodecamp;

--
-- Name: moon_star_ref_ref_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_star_ref_ref_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_star_ref_ref_id_seq OWNER TO freecodecamp;

--
-- Name: moon_star_ref_ref_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_star_ref_ref_id_seq OWNED BY public.moon_star_ref.moon_star_ref_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    years_lived integer,
    alive_cond boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    years_lived integer,
    weight_tons numeric(4,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_star_ref moon_star_ref_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_star_ref ALTER COLUMN moon_star_ref_id SET DEFAULT nextval('public.moon_star_ref_ref_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'via_lactea', true, 100, 'literal mi casa dx');
INSERT INTO public.galaxy VALUES (2, 'andromeda', true, 110, 'galaxia vecina');
INSERT INTO public.galaxy VALUES (3, 'quake', false, 3230, 'galaxia antigua que murio');
INSERT INTO public.galaxy VALUES (4, 'nube_magallanes', true, 232, 'galaxia vecina');
INSERT INTO public.galaxy VALUES (5, 'pegaso', true, 456, 'galaxia vecina');
INSERT INTO public.galaxy VALUES (6, 'ugee', false, 9723, 'galaxia antigua que colisiono');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'lalunap', 1, 23, true);
INSERT INTO public.moon VALUES (2, 'Pan', 2, 23, true);
INSERT INTO public.moon VALUES (3, 'Titan', 2, 23, true);
INSERT INTO public.moon VALUES (4, 'Dafne', 3, 23, true);
INSERT INTO public.moon VALUES (5, 'Aristoteles', 3, 23, true);
INSERT INTO public.moon VALUES (6, 'Platon', 3, 23, true);
INSERT INTO public.moon VALUES (7, 'Pluto', 4, 23, true);
INSERT INTO public.moon VALUES (8, 'Diogenes', 5, 23, true);
INSERT INTO public.moon VALUES (9, 'Zeus', 5, 23, true);
INSERT INTO public.moon VALUES (10, 'Hercules', 5, 23, true);
INSERT INTO public.moon VALUES (11, 'Hera', 6, 23, true);
INSERT INTO public.moon VALUES (12, 'Hestia', 7, 23, true);
INSERT INTO public.moon VALUES (13, 'Afrodita', 8, 23, true);
INSERT INTO public.moon VALUES (14, 'Hades', 8, 23, true);
INSERT INTO public.moon VALUES (15, 'Hermes', 7, 23, true);
INSERT INTO public.moon VALUES (16, 'Calipso', 9, 23, true);
INSERT INTO public.moon VALUES (17, 'Demeter', 10, 23, true);
INSERT INTO public.moon VALUES (18, 'Gaia', 11, 23, true);
INSERT INTO public.moon VALUES (19, 'Cronos', 12, 23, true);
INSERT INTO public.moon VALUES (20, 'Atlas', 13, 23, true);


--
-- Data for Name: moon_star_ref; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_star_ref VALUES (1, 1, true, 1, 'anomalia');
INSERT INTO public.moon_star_ref VALUES (2, 13, true, 2, 'colision de galaxias');
INSERT INTO public.moon_star_ref VALUES (6, 20, true, 4, 'agujero de gusano');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 100, true);
INSERT INTO public.planet VALUES (2, 'kepler1', 1, 100, true);
INSERT INTO public.planet VALUES (3, 'kepler1b', 1, 232, true);
INSERT INTO public.planet VALUES (4, 'kepler2', 2, 653, false);
INSERT INTO public.planet VALUES (5, 'kepler2b', 2, 234, false);
INSERT INTO public.planet VALUES (6, 'kepler2c', 2, 234, true);
INSERT INTO public.planet VALUES (7, 'kepler3', 3, 23, true);
INSERT INTO public.planet VALUES (8, 'kepler3b', 3, 41, true);
INSERT INTO public.planet VALUES (9, 'kepler3c', 3, 644, false);
INSERT INTO public.planet VALUES (10, 'kepler4', 4, 64, true);
INSERT INTO public.planet VALUES (11, 'kepler5', 5, 3457, false);
INSERT INTO public.planet VALUES (12, 'kepler6', 6, 2345, false);
INSERT INTO public.planet VALUES (13, 'kepler6b', 6, 2345, true);
INSERT INTO public.planet VALUES (14, 'kepler7', 7, 1345, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sol', 1, 50, 2.000);
INSERT INTO public.star VALUES (2, 'alpha_centauri', 1, 20, 1.000);
INSERT INTO public.star VALUES (3, 'bertegulese', 2, 100, 1.100);
INSERT INTO public.star VALUES (4, 'monse', 2, 3300, 2.200);
INSERT INTO public.star VALUES (5, 'genesis', 3, 35, 4.100);
INSERT INTO public.star VALUES (6, 'Asto', 4, 12, 2.100);
INSERT INTO public.star VALUES (7, 'Layla', 5, 79, 8.400);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_star_ref_ref_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_star_ref_ref_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_star_ref moon_star_ref_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_star_ref
    ADD CONSTRAINT moon_star_ref_name_key UNIQUE (name);


--
-- Name: moon_star_ref moon_star_ref_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_star_ref
    ADD CONSTRAINT moon_star_ref_pkey PRIMARY KEY (moon_star_ref_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon_star_ref moon_star_ref_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_star_ref
    ADD CONSTRAINT moon_star_ref_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon_star_ref moon_star_ref_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_star_ref
    ADD CONSTRAINT moon_star_ref_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

