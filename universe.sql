--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    number_of_asteroids integer NOT NULL,
    total_mass numeric(15,2),
    is_active boolean NOT NULL
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    number_of_stars integer
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    orbital_period_days numeric(10,2),
    distance_from_planet integer,
    surface_type text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_star numeric(15,2),
    number_of_moons integer,
    age_in_millions_of_years integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    temperature_kelvin integer,
    is_active boolean NOT NULL,
    has_planets boolean NOT NULL,
    mass_solar_units numeric(10,2)
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
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


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
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 'Main Belt', 1, 1900000, 3.00, true);
INSERT INTO public.asteroid_belt VALUES (2, 'Kuiper Belt', 1, 100000, 0.10, true);
INSERT INTO public.asteroid_belt VALUES (3, 'Oort Cloud', 1, 2000000000, 3.00, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, true, false, 250000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000.00, false, false, 1000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 3000000.00, false, false, 40000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 11000, 23000000.00, false, false, 100000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 13250, 29000000.00, false, false, 800000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 13240, 53000000.00, false, true, 1200000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, true, false, 27.32, 384400, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, false, 0.32, 9376, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, false, 1.26, 23463, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true, true, 1.77, 421700, 'Volcanic');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121, true, true, 3.55, 670900, 'Icy');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true, true, 7.15, 1070400, 'Icy');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820, true, false, 16.69, 1882700, 'Icy');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5149, true, true, 15.95, 1221870, 'Icy');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1527, true, false, 4.52, 527108, 'Icy');
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1469, true, false, 79.33, 3560820, 'Icy');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1123, true, false, 2.74, 377396, 'Icy');
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 1062, true, false, 1.89, 294619, 'Icy');
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 504, true, true, 1.37, 237948, 'Icy');
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 396, true, false, 0.94, 185539, 'Icy');
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1577, true, false, 8.71, 435910, 'Icy');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1522, true, false, 13.46, 583520, 'Icy');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, true, false, 4.14, 266000, 'Icy');
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1157, true, false, 2.52, 191020, 'Icy');
INSERT INTO public.moon VALUES (19, 'Triton', 8, 2706, true, true, 5.88, 354759, 'Icy');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 420, false, false, 1.12, 117647, 'Rocky');
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 340, false, false, 360.14, 5513818, 'Icy');
INSERT INTO public.moon VALUES (22, 'Larissa', 8, 194, false, false, 0.55, 73548, 'Rocky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, true, 57.90, 0, 4600);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true, 108.20, 0, 4600);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 149.60, 1, 4600);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true, 227.90, 2, 4600);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, false, 778.50, 79, 4600);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, false, 1432.00, 82, 4600);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, true, 2867.00, 27, 4600);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, true, 4515.00, 14, 4600);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Terrestrial', false, true, 7.50, 0, 4850);
INSERT INTO public.planet VALUES (10, 'Proxima c', 4, 'Super Earth', false, true, 48.00, 0, 4850);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 1, 'Terrestrial', false, true, 64.00, 0, 4000);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 1, 'Gas Giant', false, false, 7.00, 0, 4500);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 4600, 5778, true, true, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 242, 9940, true, false, 2.02);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 8000, 3500, true, false, 11.60);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M-type', 4850, 3042, true, true, 0.12);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A-type', 455, 9602, true, false, 2.14);
INSERT INTO public.star VALUES (6, 'Alpha Andromedae', 2, 'B-type', 60, 13800, true, true, 3.80);


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


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
-- Name: asteroid_belt asteroid_belt_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

