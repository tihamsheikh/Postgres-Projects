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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100),
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    has_life boolean,
    is_active boolean NOT NULL,
    diameter_in_light_years integer
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
    name character varying(100),
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    has_life boolean,
    is_active boolean,
    diameter_in_kilometer integer,
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
    name character varying(100),
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    has_life boolean,
    is_active boolean,
    diameter_in_kilometer integer,
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
-- Name: satelite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satelite (
    satelite_id integer NOT NULL,
    name character varying(100) NOT NULL,
    position_in_long_lat double precision,
    is_active boolean NOT NULL
);


ALTER TABLE public.satelite OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satelite_satelite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satelite_satelite_id_seq OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satelite_satelite_id_seq OWNED BY public.satelite.satelite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100),
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    has_life boolean,
    is_active boolean,
    diameter_in_kilometer integer,
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satelite satelite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite ALTER COLUMN satelite_id SET DEFAULT nextval('public.satelite_satelite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13610, 0, 'Barred spiral galaxy containing our Solar System', true, true, 105700);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10010, 2537000, 'Nearest major spiral galaxy to the Milky Way', false, true, 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 2730000, 'Third-largest member of the Local Group of galaxies', false, true, 60000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1101, 163000, 'Satellite dwarf galaxy of the Milky Way', false, true, 14000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 6500, 200000, 'Dwarf irregular galaxy near the Milky Way', false, true, 7000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 13250, 29350000, 'Peculiar galaxy with a bright nucleus and large central bulge', false, true, 50000);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 400, 23160000, 'Interacting grand-design spiral galaxy in Canes Venatici', false, true, 76000);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel', 21000, 20870000, 'Face-on spiral galaxy in the constellation Ursa Major', false, true, 170000);
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 13270, 13050000, 'Prominent lenticular galaxy with an active galactic nucleus', false, true, 60000);
INSERT INTO public.galaxy VALUES (10, 'Messier 87', 13240, 53490000, 'Supergiant elliptical galaxy famous for its supermassive black hole', false, true, 132000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4510, 384400, 'Earths sole natural satellite and fifth-largest moon in the Solar System', false, true, 3474, 62);
INSERT INTO public.moon VALUES (2, 'Phobos', 4503, 77790000, 'Larger and innermost of the two natural satellites of Mars', false, true, 22, 63);
INSERT INTO public.moon VALUES (3, 'Deimos', 4503, 77790000, 'Smaller and outermost of the two natural satellites of Mars', false, true, 12, 63);
INSERT INTO public.moon VALUES (4, 'Io', 4503, 628300000, 'Innermost Galilean moon of Jupiter and most geologically active body in the Solar System', false, true, 3643, 64);
INSERT INTO public.moon VALUES (5, 'Europa', 4503, 628300000, 'Smallest Galilean moon of Jupiter with a smooth icy crust and subsurface ocean', false, true, 3121, 64);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4503, 628300000, 'Largest and most massive moon in the Solar System, orbiting Jupiter', false, true, 5268, 64);
INSERT INTO public.moon VALUES (7, 'Callisto', 4503, 628300000, 'Second-largest moon of Jupiter with an ancient heavily cratered surface', false, true, 4820, 64);
INSERT INTO public.moon VALUES (8, 'Amalthea', 4503, 628300000, 'Irregularly shaped reddish inner moon of Jupiter', false, true, 167, 64);
INSERT INTO public.moon VALUES (9, 'Himalia', 4503, 628300000, 'Largest irregular satellite of Jupiter', false, true, 139, 64);
INSERT INTO public.moon VALUES (10, 'Titan', 4503, 1275000000, 'Largest moon of Saturn and the only moon known to have a dense atmosphere', false, true, 5149, 65);
INSERT INTO public.moon VALUES (11, 'Enceladus', 4503, 1275000000, 'Sixth-largest moon of Saturn famous for its icy water geysers', false, true, 504, 65);
INSERT INTO public.moon VALUES (12, 'Rhea', 4503, 1275000000, 'Second-largest moon of Saturn composed mostly of water ice', false, true, 1527, 65);
INSERT INTO public.moon VALUES (13, 'Iapetus', 4503, 1275000000, 'Third-largest moon of Saturn famous for its dramatic two-tone coloration', false, true, 1469, 65);
INSERT INTO public.moon VALUES (14, 'Dione', 4503, 1275000000, 'Fourth-largest moon of Saturn with bright ice cliffs', false, true, 1122, 65);
INSERT INTO public.moon VALUES (15, 'Tethys', 4503, 1275000000, 'Mid-sized icy moon of Saturn featuring the massive Odysseus crater', false, true, 1062, 65);
INSERT INTO public.moon VALUES (16, 'Mimas', 4503, 1275000000, 'Innermost major moon of Saturn dominated by the giant Herschel crater', false, true, 396, 65);
INSERT INTO public.moon VALUES (17, 'Hyperion', 4503, 1275000000, 'Irregularly shaped sponge-like moon of Saturn with chaotic rotation', false, true, 270, 65);
INSERT INTO public.moon VALUES (18, 'Phoebe', 4503, 1275000000, 'Most massive irregular satellite of Saturn orbiting in a retrograde direction', false, true, 213, 65);
INSERT INTO public.moon VALUES (19, 'Titania', 4503, 2724000000, 'Largest of the moons of Uranus and eighth-largest moon in the Solar System', false, true, 1576, 66);
INSERT INTO public.moon VALUES (20, 'Oberon', 4503, 2724000000, 'Outermost major moon of Uranus with a dark heavily cratered surface', false, true, 1522, 66);
INSERT INTO public.moon VALUES (21, 'Umbriel', 4503, 2724000000, 'Darkest of the large moons of Uranus', false, true, 1169, 66);
INSERT INTO public.moon VALUES (22, 'Ariel', 4503, 2724000000, 'Brightest and possibly youngest surface among the large moons of Uranus', false, true, 1157, 66);
INSERT INTO public.moon VALUES (23, 'Miranda', 4503, 2724000000, 'Smallest and innermost of Uranus five round satellites with extreme cliffs', false, true, 471, 66);
INSERT INTO public.moon VALUES (24, 'Triton', 4503, 4351000000, 'Largest natural satellite of Neptune and only large moon with a retrograde orbit', false, true, 2706, 67);
INSERT INTO public.moon VALUES (25, 'Proteus', 4503, 4351000000, 'Second-largest Neptunian moon and largest inner satellite of Neptune', false, true, 420, 67);
INSERT INTO public.moon VALUES (26, 'Nereid', 4503, 4351000000, 'Third-largest moon of Neptune with one of the most eccentric orbits known', false, true, 357, 67);
INSERT INTO public.moon VALUES (27, 'Charon', 4500, 5906000000, 'Largest of the five known natural satellites of the dwarf planet Pluto', false, true, 1212, 68);
INSERT INTO public.moon VALUES (28, 'Nix', 4500, 5906000000, 'Small inner natural satellite of Pluto discovered in 2005', false, true, 49, 68);
INSERT INTO public.moon VALUES (29, 'Hydra', 4500, 5906000000, 'Outermost known natural satellite of Pluto', false, true, 51, 68);
INSERT INTO public.moon VALUES (30, 'Dysnomia', 4500, 14400000000, 'Only known moon of the dwarf planet Eris', false, true, 700, 70);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (61, 'Mercury', 4503, 77000000, 'Smallest and innermost planet in the Solar System', false, true, 4879, 31);
INSERT INTO public.planet VALUES (62, 'Venus', 4503, 41400000, 'Second planet from the Sun with a dense toxic atmosphere', false, true, 12104, 31);
INSERT INTO public.planet VALUES (63, 'Earth', 4543, 0, 'Third planet from the Sun and the only astronomical object known to harbor life', true, true, 12742, 31);
INSERT INTO public.planet VALUES (64, 'Mars', 4603, 78300000, 'Fourth planet from the Sun, known as the Red Planet', false, true, 6779, 31);
INSERT INTO public.planet VALUES (65, 'Jupiter', 4603, 628700000, 'Largest planet in the Solar System, a gas giant with a Great Red Spot', false, true, 139820, 31);
INSERT INTO public.planet VALUES (66, 'Saturn', 4503, 1275000000, 'Sixth planet from the Sun, famous for its prominent ring system', false, true, 116460, 31);
INSERT INTO public.planet VALUES (67, 'Uranus', 4503, 2724000000, 'Seventh planet from the Sun, an ice giant tilted on its side', false, true, 50724, 31);
INSERT INTO public.planet VALUES (68, 'Neptune', 4503, 4351000000, 'Eighth and farthest known Solar planet from the Sun', false, true, 49244, 31);
INSERT INTO public.planet VALUES (69, 'Pluto', 4500, 5906000000, 'Dwarf planet in the Kuiper belt, formerly considered the ninth planet', false, true, 2376, 31);
INSERT INTO public.planet VALUES (70, 'Ceres', 4573, 413000000, 'Dwarf planet in the asteroid belt between Mars and Jupiter', false, true, 946, 31);
INSERT INTO public.planet VALUES (71, 'Eris', 4500, 14400000000, 'Most massive and second-largest known dwarf planet in the Solar System', false, true, 2326, 31);
INSERT INTO public.planet VALUES (72, 'Haumea', 4500, 6452000000, 'Oval-shaped dwarf planet located beyond Neptunes orbit', false, true, 1632, 31);
INSERT INTO public.planet VALUES (73, 'Makemake', 4500, 6850000000, 'Second-brightest Kuiper belt object after Pluto', false, true, 1430, 31);
INSERT INTO public.planet VALUES (74, 'Proxima Centauri b', 4850, 40110000000000, 'Super-Earth exoplanet orbiting in the habitable zone of Proxima Centauri', false, true, 13000, 32);
INSERT INTO public.planet VALUES (75, 'Proxima Centauri c', 4850, 40110000000000, 'Super-Earth or mini-Neptune exoplanet orbiting Proxima Centauri', false, true, 25000, 32);
INSERT INTO public.planet VALUES (76, 'Proxima Centauri d', 4850, 40110000000000, 'Sub-Earth exoplanet orbiting very close to Proxima Centauri', false, true, 10300, 32);
INSERT INTO public.planet VALUES (77, 'Alpha Centauri Bb', 5300, 41340000000000, 'Proposed rocky exoplanet orbiting Alpha Centauri B', false, false, 14000, 34);
INSERT INTO public.planet VALUES (78, 'Barnards Star b', 10000, 56380000000000, 'Cold super-Earth candidate orbiting Barnards Star', false, true, 17500, 35);
INSERT INTO public.planet VALUES (79, 'Epsilon Eridani b', 800, 99340000000000, 'Jupiter-like gas giant orbiting the young star Epsilon Eridani', false, true, 135000, 37);
INSERT INTO public.planet VALUES (80, 'Tau Ceti e', 5800, 112670000000000, 'Super-Earth candidate orbiting near the inner edge of Tau Cetis habitable zone', false, true, 22000, 39);
INSERT INTO public.planet VALUES (81, 'Tau Ceti f', 5800, 112670000000000, 'Super-Earth candidate orbiting near the outer edge of Tau Cetis habitable zone', false, true, 23000, 39);
INSERT INTO public.planet VALUES (82, 'Tau Ceti g', 5800, 112670000000000, 'Innermost rocky exoplanet candidate orbiting Tau Ceti', false, true, 14500, 39);
INSERT INTO public.planet VALUES (83, 'Tau Ceti h', 5800, 112670000000000, 'Super-Earth exoplanet orbiting closer to Tau Ceti than Tau Ceti e', false, true, 15200, 39);
INSERT INTO public.planet VALUES (84, 'Fomalhaut b', 440, 237700000000000, 'Debris cloud or exoplanet candidate orbiting within Fomalhauts dust ring', false, false, 140000, 42);
INSERT INTO public.planet VALUES (85, 'Pollux b', 724, 319500000000000, 'Gas giant exoplanet orbiting the orange giant star Pollux', false, true, 160000, 43);
INSERT INTO public.planet VALUES (86, 'Aldebaran b', 6400, 617800000000000, 'Massive gas giant candidate orbiting the orange giant star Aldebaran', false, true, 155000, 46);
INSERT INTO public.planet VALUES (87, 'Vega b', 455, 236900000000000, 'Hot Neptune candidate orbiting very close to the bright star Vega', false, true, 52000, 41);
INSERT INTO public.planet VALUES (88, 'Altair b', 1200, 158200000000000, 'Hypothetical gas giant orbiting the rapidly spinning star Altair', false, true, 128000, 40);
INSERT INTO public.planet VALUES (89, 'Mirach b', 200, 1863000000000000, 'Substellar companion or giant planet orbiting the red giant Mirach', false, true, 145000, 54);
INSERT INTO public.planet VALUES (90, 'Almach b', 6, 3311000000000000, 'Gas giant exoplanet orbiting in the Almach multiple star system', false, true, 138000, 55);


--
-- Data for Name: satelite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satelite VALUES (1, 'Hubble Space Telescope', 28.47, true);
INSERT INTO public.satelite VALUES (2, 'James Webb Space Telescope', -45.12, true);
INSERT INTO public.satelite VALUES (3, 'International Space Station', 51.64, true);
INSERT INTO public.satelite VALUES (4, 'Voyager 1', -12.34, true);
INSERT INTO public.satelite VALUES (5, 'Voyager 2', 34.56, true);
INSERT INTO public.satelite VALUES (6, 'Sputnik 1', 65.1, false);
INSERT INTO public.satelite VALUES (7, 'Cassini', -23.89, false);
INSERT INTO public.satelite VALUES (8, 'Kepler Space Telescope', 44.32, false);
INSERT INTO public.satelite VALUES (9, 'Chandra X-ray Observatory', 19.75, true);
INSERT INTO public.satelite VALUES (10, 'Galileo', -8.45, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (31, 'Sun', 4600, 0.0000158, 'G-type main-sequence star at the center of our Solar System', true, true, 1392700, 1);
INSERT INTO public.star VALUES (32, 'Proxima Centauri', 4850, 4.24, 'Closest known star to the Sun, a small red dwarf', false, true, 214550, 1);
INSERT INTO public.star VALUES (33, 'Alpha Centauri A', 5300, 4.37, 'Primary component of the closest star system to Earth', false, true, 1702000, 1);
INSERT INTO public.star VALUES (34, 'Alpha Centauri B', 5300, 4.37, 'Orange-red secondary star in the Alpha Centauri system', false, true, 1200000, 1);
INSERT INTO public.star VALUES (35, 'Barnards Star', 10000, 5.96, 'Very old red dwarf with the highest known proper motion', false, true, 272900, 1);
INSERT INTO public.star VALUES (36, 'Sirius', 242, 8.60, 'Brightest star in Earths night sky', false, true, 2380000, 1);
INSERT INTO public.star VALUES (37, 'Epsilon Eridani', 800, 10.50, 'Young K-type main-sequence star with a debris disk', false, true, 1023000, 1);
INSERT INTO public.star VALUES (38, 'Procyon', 1700, 11.46, 'Bright binary star system in Canis Minor', false, true, 2850000, 1);
INSERT INTO public.star VALUES (39, 'Tau Ceti', 5800, 11.91, 'Sun-like star in the constellation Cetus', false, true, 1104000, 1);
INSERT INTO public.star VALUES (40, 'Altair', 1200, 16.73, 'Rapidly rotating white main-sequence star in Aquila', false, true, 2500000, 1);
INSERT INTO public.star VALUES (41, 'Vega', 455, 25.04, 'Brightest star in the northern constellation of Lyra', false, true, 3280000, 1);
INSERT INTO public.star VALUES (42, 'Fomalhaut', 440, 25.13, 'Bright young star surrounded by a prominent dust ring', false, true, 2560000, 1);
INSERT INTO public.star VALUES (43, 'Pollux', 724, 33.78, 'Orange-hued giant star and brightest in Gemini', false, true, 12250000, 1);
INSERT INTO public.star VALUES (44, 'Arcturus', 7100, 36.70, 'Red giant star in the northern hemisphere of Earths sky', false, true, 35300000, 1);
INSERT INTO public.star VALUES (45, 'Capella', 590, 42.92, 'Brightest star in Auriga, actually a quadruple star system', false, true, 16700000, 1);
INSERT INTO public.star VALUES (46, 'Aldebaran', 6400, 65.30, 'Orange giant star located in the zodiac constellation Taurus', false, true, 61400000, 1);
INSERT INTO public.star VALUES (47, 'Regulus', 1000, 79.30, 'Brightest object in the constellation Leo', false, true, 4300000, 1);
INSERT INTO public.star VALUES (48, 'Spica', 12, 250.00, 'Blue giant spectroscopic binary star in Virgo', false, true, 10400000, 1);
INSERT INTO public.star VALUES (49, 'Antares', 11, 550.00, 'Distinctly reddish red supergiant in Scorpius', false, true, 946000000, 1);
INSERT INTO public.star VALUES (50, 'Betelgeuse', 10, 642.50, 'Massive red supergiant nearing the end of its life cycle', false, true, 1234000000, 1);
INSERT INTO public.star VALUES (51, 'Rigel', 8, 860.00, 'Blue supergiant and brightest star in Orion', false, true, 109781000, 1);
INSERT INTO public.star VALUES (52, 'Deneb', 10, 2615.00, 'Extremely luminous blue-white supergiant in Cygnus', false, true, 282000000, 1);
INSERT INTO public.star VALUES (53, 'Alpheratz', 60, 97.00, 'Brightest star in the Andromeda constellation', false, true, 3760000, 2);
INSERT INTO public.star VALUES (54, 'Mirach', 200, 197.00, 'Prominent red giant star used to locate the Andromeda Galaxy', false, true, 139000000, 2);
INSERT INTO public.star VALUES (55, 'Almach', 6, 350.00, 'Colorful multiple star system in Andromeda', false, true, 111000000, 2);
INSERT INTO public.star VALUES (56, 'M31-V1', 50, 2537000.00, 'Famous Cepheid variable star discovered by Edwin Hubble', false, true, 55000000, 2);
INSERT INTO public.star VALUES (57, 'M33-X7', 3, 2700000.00, 'Massive blue star orbiting a stellar-mass black hole', false, true, 27800000, 3);
INSERT INTO public.star VALUES (58, 'Var 83', 4, 3000000.00, 'Luminous blue variable star in the Triangulum Galaxy', false, true, 140000000, 3);
INSERT INTO public.star VALUES (59, 'SN 1987A Progenitor', 10, 168000.00, 'Former blue supergiant star before exploding as a supernova', false, false, 60000000, 4);
INSERT INTO public.star VALUES (60, 'R136a1', 1, 163000.00, 'One of the most massive and luminous known stars', false, true, 59000000, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 90, true);


--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satelite_satelite_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 60, true);


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
-- Name: satelite satelite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_pkey PRIMARY KEY (satelite_id);


--
-- Name: satelite satelite_position_in_long_lat_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_position_in_long_lat_key UNIQUE (position_in_long_lat);


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

