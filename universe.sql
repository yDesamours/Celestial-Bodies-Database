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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(30) NOT NULL,
    diameter numeric(5,1),
    distance_from_sun_in_ua numeric(6,1),
    asteroid_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_star_in_billion numeric(6,2),
    shape character varying(30),
    radius_in_ly integer,
    age_in_billion_of_years numeric(4,1),
    description text,
    escape_velocity_in_km_s integer,
    number_of_planet_in_billion numeric(5,1)
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
    radius_in_km integer,
    weight_in_km_10_pow_22 numeric(4,1),
    has_life boolean,
    has_water boolean,
    has_oxygen boolean,
    distance_from_his_planet_in_10_pow_3_km numeric(6,1),
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_from_the_earth numeric(4,1),
    distance_from_earth_in_ly integer,
    has_life boolean,
    has_oxygen boolean,
    has_water boolean,
    type character varying(20),
    distance_from_his_sun_in_million_km integer,
    description text,
    weight_from_earth numeric(5,1),
    star_id integer NOT NULL,
    revolution_in_days integer
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
    age_in_billion_of_years numeric(4,2),
    radius_from_the_sun numeric(4,1),
    type character varying(20),
    distance_from_earth_in_ly integer,
    weight_from_the_sun numeric(4,1),
    description text,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Ceres', 946.0, 2.8, 1);
INSERT INTO public.asteroid VALUES ('Vesta', 525.4, 2.4, 2);
INSERT INTO public.asteroid VALUES ('Pallas', 512.0, 2.8, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 200.00, 'barred spiral', 150000, NULL, NULL, NULL, 100.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 1000.00, 'spiral', 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cartwheel Galaxy', NULL, 'lenticular ring', 150000, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', NULL, 'spiral', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Hoag Object', NULL, 'ring', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', NULL, 'intermediate spiral', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 7.4, false, false, NULL, NULL, 5);
INSERT INTO public.moon VALUES (2, 'Titan', 2575, 13.5, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (3, 'Mimas', 413, 0.0, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (4, 'Encelade', 252, 0.0, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (6, 'Japet', 735, 0.2, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (5, 'Tethys', 531, 0.1, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (7, 'Dione', 561, 0.1, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (8, 'Rhea', 764, 0.2, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (9, 'Europe', 1561, 4.8, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (10, 'Ganymede', 2634, 14.8, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Io', 1822, 8.9, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Callisto', 2410, 10.7, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 788, 0.4, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (14, 'Umbriel', 585, 0.1, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (15, 'Oberon', 761, 0.3, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (16, 'Ariel', 579, 0.1, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (17, 'Triton', 1353, 2.1, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (18, 'Ierene', 4, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Philophrosyne', 1, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Fenrir', 2, NULL, NULL, NULL, NULL, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Taphao Thong', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 835.8, 39, NULL);
INSERT INTO public.planet VALUES (2, 'Taphao Kaew', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, 2594);
INSERT INTO public.planet VALUES (3, 'Mercury', 0.4, NULL, false, false, false, 'Terrestrial', 46, NULL, 0.1, 1, 88);
INSERT INTO public.planet VALUES (4, 'Venus', 1.0, NULL, false, false, false, 'Terrestrial', 107, NULL, 0.8, 1, 224);
INSERT INTO public.planet VALUES (6, 'March', 0.5, NULL, false, false, false, 'Terrestrial', 206, NULL, 0.1, 1, 686);
INSERT INTO public.planet VALUES (7, 'Jupiter', 11.0, NULL, false, false, false, 'Gas Giant', 779, NULL, 318.0, 1, 4380);
INSERT INTO public.planet VALUES (8, 'Saturn', 9.0, NULL, false, false, false, 'Gas Giant', 1400, NULL, 95.0, 1, 10950);
INSERT INTO public.planet VALUES (9, 'Uranus', 14.5, NULL, false, false, false, 'Gas', 2735, NULL, 3.9, 1, 30660);
INSERT INTO public.planet VALUES (10, 'Neptune', 3.8, NULL, false, false, false, 'Gas', 4459, NULL, 17.0, 1, 59860);
INSERT INTO public.planet VALUES (5, 'Earth', 1.0, NULL, true, true, true, 'Terrestrial', 150, NULL, 1.0, 1, 365);
INSERT INTO public.planet VALUES (11, 'Amateru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO public.planet VALUES (12, 'Hypatie', NULL, NULL, NULL, NULL, NULL, NULL, 191, NULL, 2802.0, 42, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Soleil', 4.60, 1.0, 'yellow dwarft', 1, 1.0, NULL, 1);
INSERT INTO public.star VALUES (34, 'Siruis A', 0.25, 1.7, 'white star', NULL, 2.1, NULL, 1);
INSERT INTO public.star VALUES (35, 'Sirius B', NULL, NULL, 'white dwarft', NULL, 1.0, NULL, 1);
INSERT INTO public.star VALUES (36, 'Canopus', NULL, 71.4, NULL, NULL, 6.9, NULL, 1);
INSERT INTO public.star VALUES (37, 'Arcturus', NULL, 25.0, 'Red Giant', NULL, 1.1, NULL, 1);
INSERT INTO public.star VALUES (38, 'Rigel A', NULL, 78.9, 'White Giant', NULL, 17.0, NULL, 1);
INSERT INTO public.star VALUES (39, 'Chalawan', NULL, 1.2, 'Yellow Dwarft', NULL, 1.1, NULL, 1);
INSERT INTO public.star VALUES (40, 'Ain', NULL, 12.7, NULL, 155, 2.7, NULL, 1);
INSERT INTO public.star VALUES (42, 'Iota Draconis', NULL, NULL, 'Red Giant', 103, NULL, NULL, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 42, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

