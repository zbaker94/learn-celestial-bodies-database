--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    size numeric NOT NULL,
    type text NOT NULL,
    is_active boolean DEFAULT true
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
    name character varying(255) NOT NULL,
    orbital_period integer NOT NULL,
    distance_from_planet numeric NOT NULL,
    has_atmosphere boolean DEFAULT false,
    planet_id integer NOT NULL
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
-- Name: object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.object (
    object_id integer NOT NULL,
    name character varying(255) NOT NULL,
    category text NOT NULL,
    weight numeric NOT NULL,
    is_dynamic boolean DEFAULT false,
    star_id integer NOT NULL
);


ALTER TABLE public.object OWNER TO freecodecamp;

--
-- Name: object_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_object_id_seq OWNER TO freecodecamp;

--
-- Name: object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.object_object_id_seq OWNED BY public.object.object_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass integer NOT NULL,
    radius numeric NOT NULL,
    composition text NOT NULL,
    star_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    luminosity numeric NOT NULL,
    is_visible boolean DEFAULT true,
    galaxy_id integer NOT NULL
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
-- Name: object object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object ALTER COLUMN object_id SET DEFAULT nextval('public.object_object_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 50000, 'Lenticular', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 80000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 60000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 70000, 'Ring', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27, 384400, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0, 9377, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 23460, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 2, 421700, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 670900, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 7, 1070400, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 17, 1882700, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 16, 1221870, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1, 238020, true, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', 1, 129900, false, 7);
INSERT INTO public.moon VALUES (11, 'Ariel', 3, 191020, true, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 4, 265620, false, 7);
INSERT INTO public.moon VALUES (13, 'Triton', 6, 354760, true, 8);
INSERT INTO public.moon VALUES (14, 'Nereid', 360, 5510000, false, 8);
INSERT INTO public.moon VALUES (15, 'Charon', 6, 19600, false, 9);
INSERT INTO public.moon VALUES (16, 'Hydra', 6, 64780, false, 9);
INSERT INTO public.moon VALUES (17, 'Kerberos', 6, 57700, false, 9);
INSERT INTO public.moon VALUES (18, 'Nyx', 6, 48600, false, 9);
INSERT INTO public.moon VALUES (19, 'Europa Moon Alpha', 12, 670000, true, 10);
INSERT INTO public.moon VALUES (20, 'Europa Moon Beta', 14, 680000, true, 10);


--
-- Data for Name: object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.object VALUES (1, 'Asteroid B612', 'Asteroid', 5000.75, false, 1);
INSERT INTO public.object VALUES (2, 'Comet Halley', 'Comet', 4500.50, true, 2);
INSERT INTO public.object VALUES (3, 'Nebula Orion', 'Nebula', 12000.80, false, 3);
INSERT INTO public.object VALUES (4, 'Black Hole X1', 'Black Hole', 80000.99, false, 4);
INSERT INTO public.object VALUES (5, 'Exoplanet Kepler', 'Exoplanet', 20000.25, true, 5);
INSERT INTO public.object VALUES (6, 'Galaxy Cluster Virgo', 'Cluster', 350000.00, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 330, 2439.7, 'Rocky', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4868, 6051.8, 'Rocky', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 5972, 6371, 'Rocky', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 641, 3389.5, 'Rocky', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898000, 69911, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 568300, 58232, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 86800, 25362, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 102400, 24622, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 122000, 25000, 'Super Earth', 2);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 130000, 23000, 'Gas Giant', 3);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 46000, 16000, 'Rocky', 4);
INSERT INTO public.planet VALUES (12, 'TOI-700 d', 65000, 18000, 'Rocky', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4500, 1.0, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4700, 0.0017, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 300, 25.4, true, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 10, 126000, true, 3);
INSERT INTO public.star VALUES (5, 'Rigel', 8, 120000, true, 4);
INSERT INTO public.star VALUES (6, 'Vega', 455, 40.12, true, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: object_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.object_object_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: object object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_name_key UNIQUE (name);


--
-- Name: object object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (object_id);


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
-- Name: object object_origin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_origin_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

