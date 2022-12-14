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
    name character varying(50) NOT NULL,
    designations text,
    constellation character varying(30),
    naked_eye_galaxy boolean NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(15) NOT NULL,
    families text,
    varieties text,
    stages text,
    type text NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery date,
    discovered_by text,
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
    name character varying(10) NOT NULL,
    class character varying(8),
    moons integer NOT NULL,
    size_in_km integer NOT NULL,
    namesake text,
    planet_type character varying(15),
    inhabited boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_detail; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_detail (
    planet_detail_id integer NOT NULL,
    name character varying(10) NOT NULL,
    length_of_year numeric(5,2),
    distance_from_sun_in_au numeric(3,1),
    planet_id integer NOT NULL
);


ALTER TABLE public.planet_detail OWNER TO freecodecamp;

--
-- Name: planet_detail_planet_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_detail_planet_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_detail_planet_detail_id_seq OWNER TO freecodecamp;

--
-- Name: planet_detail_planet_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_detail_planet_detail_id_seq OWNED BY public.planet_detail.planet_detail_id;


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
    designation text NOT NULL,
    constellation character varying(10),
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_detail planet_detail_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_detail ALTER COLUMN planet_detail_id SET DEFAULT nextval('public.planet_detail_planet_detail_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'M31, NGC 224, UGC 454, PGC 2557', 'Andromeda', true);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxy', 'NGC 4038/4039, PGC 37967/37969', 'Corvus', false);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'NGC 4622, PGC 42701', 'Centaurus', false);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'Evil Eye Galaxy, M64, NGC 4826, PGC 44182', 'Coma Berenices', false);
INSERT INTO public.galaxy VALUES (5, 'Bode s Galaxy', 'M81, NGC 3031, UGC 5318, PGC 28630', 'Ursa Major', true);
INSERT INTO public.galaxy VALUES (6, 'Buttlerfly Galaxy', 'NGC 4567/4568, UGC 7776/7777, PGC 42064/42069', 'Virgo', false);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel Galaxy', 'PGC 2248', 'Sculptor', false);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 'NGC 5128, ARP 153, PGC 46957', 'Centaurus', true);
INSERT INTO public.galaxy VALUES (9, 'Cigar Galaxy', 'M82, NGC 3034, UGC 5322, PGC 28655', 'Ursa Major', false);
INSERT INTO public.galaxy VALUES (10, 'Circinus', 'ESO 97-G13', 'Circinus', false);
INSERT INTO public.galaxy VALUES (11, 'Coma Pinwheel Galaxy', 'NGC 4254, PGC 39578', 'Coma Berenices', false);
INSERT INTO public.galaxy VALUES (12, 'Comet Galaxy', 'VCC 1217, IC 3418', 'Sculptor', false);
INSERT INTO public.galaxy VALUES (13, 'Cosmos Redshift 7', NULL, 'Sextans', false);
INSERT INTO public.galaxy VALUES (14, 'Eye of Sauron', 'NGC 4151, UGC 7166, PGC 38739', 'Canes Venatici', false);
INSERT INTO public.galaxy VALUES (15, 'Fireworks Galaxy', 'NGC 6946, UGC 11597, PGC 65001', 'Cygnus', false);
INSERT INTO public.galaxy VALUES (16, 'Hockey Stick Galaxy', 'UGC 7907, PGC 42863', 'Canes Venatici', false);
INSERT INTO public.galaxy VALUES (17, 'Hoag s Galaxy', 'PGC 54559', 'Serpens', false);
INSERT INTO public.galaxy VALUES (18, 'Large Magellanic Cloud', 'ESO 56-G115, PGC 17223', 'Dorado', true);
INSERT INTO public.galaxy VALUES (19, 'Lindsay-Shapley Ring', 'PGC 19481, AM 0644-741, ESO 34-11', 'Volans', false);
INSERT INTO public.galaxy VALUES (20, 'Little Sombrero Galaxy', 'NGC 7814, UGC 8, PGC 218', 'Pegasus', false);
INSERT INTO public.galaxy VALUES (21, 'Melin 1', 'PGC 42102, LEDA 42102, VPC 1091', 'Coma Berenices', false);
INSERT INTO public.galaxy VALUES (22, 'Medusa Merger', 'NGC 4194, UGC 7241, PGC 39068', 'Ursa Major', false);
INSERT INTO public.galaxy VALUES (23, 'Sculptor Dwarf Galaxy', 'PGC 3589', 'Sculptor', false);
INSERT INTO public.galaxy VALUES (24, 'Mice Galaxies', 'NGC 4676, UGC 7938/7939, PGC 43062/43065', 'Coma Berenices', false);
INSERT INTO public.galaxy VALUES (25, 'Small Magellanic Cloud', 'NGC 292, PGC 3085', 'Tucana', true);
INSERT INTO public.galaxy VALUES (26, 'Mayall s Object', 'APG 148, VV 032', 'Ursa Major', false);
INSERT INTO public.galaxy VALUES (27, 'Milky Way', NULL, NULL, true);
INSERT INTO public.galaxy VALUES (28, 'Needle Galaxy', 'NGC 4565, UGC 7772, PGC 42038', 'Coma Berenices', false);
INSERT INTO public.galaxy VALUES (29, 'Wolf-Lundmark-Melotte', 'UGCA 444, PGC 143', 'Cetus', false);
INSERT INTO public.galaxy VALUES (30, 'Pinwheel Galaxy', 'M101, NGC 5457, UGC 8981, PGC 50063', 'Ursa Major', false);
INSERT INTO public.galaxy VALUES (31, 'Sculptor Galaxy', 'NGC 253, UGCA 13, PGC 2789', 'Sculptor', true);
INSERT INTO public.galaxy VALUES (32, 'Sombrero Gaalaxy', 'M104, NGC 4594, UGC 293, PGC 42407', 'Virgo', false);
INSERT INTO public.galaxy VALUES (33, 'Southern Pinwheel Galaxy', 'M83, NGC 5236, PGC 48082', 'Hydra', false);
INSERT INTO public.galaxy VALUES (34, 'Sunflower Galaxy', 'M63, NGC 5055, PGC 46153, UGC 8334', 'Canes Venatici', false);
INSERT INTO public.galaxy VALUES (35, 'Tadpole Galaxy', 'UGC 10214, ARP 188, PGC 57129', 'Draco', false);
INSERT INTO public.galaxy VALUES (36, 'Triangulum Galaxy', 'NGC 0598, UGC 1117, PGC 5818', 'Triangulum', true);
INSERT INTO public.galaxy VALUES (37, 'Whirlpool Galaxy', 'M51A, NGC 5194, UGC 8493, PGC 47404', 'Canes Venatici', false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Elliptical', NULL, NULL, NULL, 'E');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', NULL, NULL, 'Elliptical (0-7)', 'E0');
INSERT INTO public.galaxy_types VALUES (3, 'Elliptical', NULL, NULL, 'Intermediate', 'E0-1');
INSERT INTO public.galaxy_types VALUES (4, 'Elliptical', NULL, NULL, 'Late Elliptical', 'E+');
INSERT INTO public.galaxy_types VALUES (5, 'Spiral', NULL, NULL, NULL, 'S0');
INSERT INTO public.galaxy_types VALUES (6, 'Spiral', 'Ordinary', NULL, NULL, 'SA0');
INSERT INTO public.galaxy_types VALUES (7, 'Spiral', 'Barred', NULL, NULL, 'SB0');
INSERT INTO public.galaxy_types VALUES (8, 'Spiral', 'Mixed', NULL, NULL, 'SAB0');
INSERT INTO public.galaxy_types VALUES (9, 'Spiral', NULL, 'Inner Ring', NULL, 'S(r)0');
INSERT INTO public.galaxy_types VALUES (10, 'Spiral', NULL, 'S-Shaped', NULL, 'S(s)0');
INSERT INTO public.galaxy_types VALUES (11, 'Spiral', NULL, 'Mixed', NULL, 'S(rs)0');
INSERT INTO public.galaxy_types VALUES (12, 'Spiral', NULL, NULL, 'Early', 'S0-');
INSERT INTO public.galaxy_types VALUES (13, 'Spiral', NULL, NULL, 'Intermediate', 'S0*');
INSERT INTO public.galaxy_types VALUES (14, 'Spiral', NULL, NULL, 'Late', 'S0+');
INSERT INTO public.galaxy_types VALUES (15, 'Spiral', 'Ordinary', NULL, NULL, 'SA');
INSERT INTO public.galaxy_types VALUES (16, 'Spiral', 'Barred', NULL, NULL, 'SB');
INSERT INTO public.galaxy_types VALUES (17, 'Spiral', 'Mixed', NULL, NULL, 'SAB');
INSERT INTO public.galaxy_types VALUES (18, 'Spiral', NULL, 'Inner Ring', NULL, 'S(r)');
INSERT INTO public.galaxy_types VALUES (19, 'Spiral', NULL, 'S-Shaped', NULL, 'S(s)');
INSERT INTO public.galaxy_types VALUES (20, 'Spiral', NULL, 'Mixed', NULL, 'S(rs)');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon of Earth', NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', '1877-08-11', 'Asaph Hall', 4);
INSERT INTO public.moon VALUES (3, 'phobos', '1877-08-17', 'Asaph Hall', 4);
INSERT INTO public.moon VALUES (4, 'Adrastea', '1979-07-08', 'Voyager', 5);
INSERT INTO public.moon VALUES (5, 'Aitne', '2001-12-09', 'Scott S. Sheppard, David C. Jewitt and Jan T. Kleyna', 5);
INSERT INTO public.moon VALUES (7, 'Ananke', '1951-09-28', 'Seth Barnes Nicholson', 5);
INSERT INTO public.moon VALUES (8, 'Aoede', '2003-02-08', 'Scott S. Sheppard, David C. Jewitt, Jan T. Kleyna, Yanga R. Fernandez and Henry H. Hsieh', 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', '1892-09-09', 'Edward Emerson Bernard', 5);
INSERT INTO public.moon VALUES (9, 'Arche', '2002-10-31', 'Scott S. Sheppard', 5);
INSERT INTO public.moon VALUES (10, 'Autonoe', '2001-12-10', 'Scott S. Sheppard, David C. Jewitt and Jan T. Kleyna', 5);
INSERT INTO public.moon VALUES (11, 'Callirrhoe', '1999-10-19', 'Spacewatch Program', 5);
INSERT INTO public.moon VALUES (12, 'Callisto', '1610-01-07', 'Galileu Galilei', 5);
INSERT INTO public.moon VALUES (13, 'Carme', '1938-07-30', 'Seth Barnes Nicholson', 5);
INSERT INTO public.moon VALUES (14, 'Carpo', '2003-02-26', 'Scott S. Sheppard and others', 5);
INSERT INTO public.moon VALUES (15, 'Chaldene', '2000-11-23', 'Scott S. Sheppard, David C. Jewitt, Yanger R. Fernandez and Eugene Magnier', 5);
INSERT INTO public.moon VALUES (16, 'Cyllene', '2003-02-09', 'Scott S. Sheppard and his team', 5);
INSERT INTO public.moon VALUES (17, 'Dia', '2000-12-05', 'Scott S. Sheppard, David C. Jewitt, Yanger R. Fernandez and G. Magnier', 5);
INSERT INTO public.moon VALUES (18, 'Eirene', '2003-02-06', 'Scott S. Sheppard, David C. Jewitt and Jan T. Kleyna', 5);
INSERT INTO public.moon VALUES (19, 'Elara', '1905-01-05', 'Charles Dillon Perrine', 5);
INSERT INTO public.moon VALUES (20, 'Erinome', '2000-11-23', 'Scott S. Sheppard, David C. Jewitt, Yanger R. Fernandez and Eugene Magnier', 5);
INSERT INTO public.moon VALUES (21, 'Ersa', '2018-07-17', 'Scott S. Sheppard and his team', 5);
INSERT INTO public.moon VALUES (22, 'Euanthe', '2001-12-11', 'Scott S. Sheppard, David C. Jewitt and Jan T. Kleyna', 5);
INSERT INTO public.moon VALUES (23, 'Eukelade', '2003-02-06', 'Scott S. Sheppard', 5);
INSERT INTO public.moon VALUES (24, 'Charon', '1978-06-22', 'James Christy and Robert Harrington', 9);
INSERT INTO public.moon VALUES (25, 'Hydra', '2005-05-15', 'Hal Weaver and others', 9);
INSERT INTO public.moon VALUES (26, 'Kerberos', '2011-06-28', 'Mark Showalter', 9);
INSERT INTO public.moon VALUES (27, 'Nix', '2005-05-15', 'Hal Weaver and others', 9);
INSERT INTO public.moon VALUES (28, 'Styx', '2012-06-26', 'Mark Showalter', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Primary', 0, 4880, 'Roman God of Speed', 'Terrestrial', false);
INSERT INTO public.planet VALUES (2, 'Venus', 'Primary', 0, 12104, 'Roman Goddessof Love', 'Terrestrial', false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Primary', 1, 12742, 'The Ground', 'Terrestrial', true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Primary', 2, 6780, 'Roman God of War', 'Terrestrial', false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Primary', 80, 139822, 'King of the Roman Gods', 'Gas Giant', false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Primary', 83, 116464, 'Father of Jupiter', 'Gas Giant', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Primary', 27, 50724, 'Greek God of the Sky', 'Ice Giant', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Primary', 14, 49244, 'Roman God of the Sea', 'Ice Giant', false);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 5, 2302, 'Roman God of the Underworld', 'Dwarf', false);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Dwarf', 0, 952, 'Roman Goddess of Harvests', 'Dwarf', false);
INSERT INTO public.planet VALUES (11, 'Makemake', 'Dwarf', 1, 1430, 'Rapanui God of Fertility', 'Dwarf', false);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Dwarf', 2, 1240, 'Hawaiian Goddess of Fertility', 'Dwarf', false);
INSERT INTO public.planet VALUES (13, 'Eris', 'Dwarf', 1, 2326, 'Greek Goddess of Discord and Strife', 'Dwarf', false);


--
-- Data for Name: planet_detail; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_detail VALUES (1, 'Mercury', 88.00, 0.4, 1);
INSERT INTO public.planet_detail VALUES (2, 'Venus', 255.00, 0.7, 2);
INSERT INTO public.planet_detail VALUES (3, 'Earth', 365.25, 1.0, 3);
INSERT INTO public.planet_detail VALUES (4, 'Mars', 1.88, 1.5, 4);
INSERT INTO public.planet_detail VALUES (5, 'Jupiter', 11.86, 5.2, 5);
INSERT INTO public.planet_detail VALUES (6, 'Saturn', 29.45, 9.5, 6);
INSERT INTO public.planet_detail VALUES (7, 'Uranus', 84.00, 19.8, 7);
INSERT INTO public.planet_detail VALUES (8, 'Neptune', 164.81, 30.1, 8);
INSERT INTO public.planet_detail VALUES (9, 'Pluto', 248.89, 39.0, 9);
INSERT INTO public.planet_detail VALUES (10, 'Ceres', 4.60, 2.8, 10);
INSERT INTO public.planet_detail VALUES (11, 'Makemake', NULL, 45.8, 11);
INSERT INTO public.planet_detail VALUES (12, 'Haumea', NULL, 43.0, 12);
INSERT INTO public.planet_detail VALUES (13, 'Eris', NULL, 68.0, 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2 V', NULL, 27);
INSERT INTO public.star VALUES (2, 'Sterrennacht', 'HAT-P-6', 'And', 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 'HR 15', 'And', 1);
INSERT INTO public.star VALUES (4, 'Capella', 'HR 1708', 'Aur', 27);
INSERT INTO public.star VALUES (5, 'Rigel', 'HR 1713', 'Ori', 27);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'HR 2061', 'Ori', 27);
INSERT INTO public.star VALUES (7, 'Canopus', 'HR 2326', 'Car', 27);
INSERT INTO public.star VALUES (8, 'Sirius', 'HR 2491', 'CMa', 27);
INSERT INTO public.star VALUES (9, 'Procyon', 'HR 2943', 'CMi', 27);
INSERT INTO public.star VALUES (10, 'Mirach', 'HR 337', 'And', 1);
INSERT INTO public.star VALUES (11, 'Adhil', 'HR 390', 'And', 1);
INSERT INTO public.star VALUES (12, 'Nembuis', 'HR 464', 'And', 1);
INSERT INTO public.star VALUES (13, 'Achernar', 'HR 472', 'Eri', 27);
INSERT INTO public.star VALUES (14, 'Arcturus', 'HR 5340', 'Boo', 27);
INSERT INTO public.star VALUES (15, 'Rigil Kentaurus', 'HR 5459', 'Cen', 27);
INSERT INTO public.star VALUES (16, 'Toliman', 'HR 5460', 'Cen', 27);
INSERT INTO public.star VALUES (17, 'Almach', 'HR 603', 'And', 1);
INSERT INTO public.star VALUES (18, 'Vega', 'HR 7001', 'Lyr', 27);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 37, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_detail_planet_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_detail_planet_detail_id_seq', 13, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_galaxy_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_types_id_key UNIQUE (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_detail planet_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_detail
    ADD CONSTRAINT planet_detail_pkey PRIMARY KEY (planet_detail_id);


--
-- Name: planet_detail planet_detail_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_detail
    ADD CONSTRAINT planet_detail_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_detail planet_detail_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_detail
    ADD CONSTRAINT planet_detail_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--