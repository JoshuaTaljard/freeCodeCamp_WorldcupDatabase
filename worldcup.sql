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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (65, 2018, 4, 2, 'Final', 239, 240);
INSERT INTO public.games VALUES (66, 2018, 2, 0, 'Third Place', 241, 242);
INSERT INTO public.games VALUES (67, 2018, 2, 1, 'Semi-Final', 240, 242);
INSERT INTO public.games VALUES (68, 2018, 1, 0, 'Semi-Final', 239, 241);
INSERT INTO public.games VALUES (69, 2018, 3, 2, 'Quarter-Final', 240, 243);
INSERT INTO public.games VALUES (70, 2018, 2, 0, 'Quarter-Final', 242, 244);
INSERT INTO public.games VALUES (71, 2018, 2, 1, 'Quarter-Final', 241, 245);
INSERT INTO public.games VALUES (72, 2018, 2, 0, 'Quarter-Final', 239, 246);
INSERT INTO public.games VALUES (73, 2018, 2, 1, 'Eighth-Final', 242, 247);
INSERT INTO public.games VALUES (74, 2018, 1, 0, 'Eighth-Final', 244, 248);
INSERT INTO public.games VALUES (75, 2018, 3, 2, 'Eighth-Final', 241, 249);
INSERT INTO public.games VALUES (76, 2018, 2, 0, 'Eighth-Final', 245, 250);
INSERT INTO public.games VALUES (77, 2018, 2, 1, 'Eighth-Final', 240, 251);
INSERT INTO public.games VALUES (78, 2018, 2, 1, 'Eighth-Final', 243, 252);
INSERT INTO public.games VALUES (79, 2018, 2, 1, 'Eighth-Final', 246, 253);
INSERT INTO public.games VALUES (80, 2018, 4, 3, 'Eighth-Final', 239, 254);
INSERT INTO public.games VALUES (81, 2014, 1, 0, 'Final', 255, 254);
INSERT INTO public.games VALUES (82, 2014, 3, 0, 'Third Place', 256, 245);
INSERT INTO public.games VALUES (83, 2014, 1, 0, 'Semi-Final', 254, 256);
INSERT INTO public.games VALUES (84, 2014, 7, 1, 'Semi-Final', 255, 245);
INSERT INTO public.games VALUES (85, 2014, 1, 0, 'Quarter-Final', 256, 257);
INSERT INTO public.games VALUES (86, 2014, 1, 0, 'Quarter-Final', 254, 241);
INSERT INTO public.games VALUES (87, 2014, 2, 1, 'Quarter-Final', 245, 247);
INSERT INTO public.games VALUES (88, 2014, 1, 0, 'Quarter-Final', 255, 239);
INSERT INTO public.games VALUES (89, 2014, 2, 1, 'Eighth-Final', 245, 258);
INSERT INTO public.games VALUES (90, 2014, 2, 0, 'Eighth-Final', 247, 246);
INSERT INTO public.games VALUES (91, 2014, 2, 0, 'Eighth-Final', 239, 259);
INSERT INTO public.games VALUES (92, 2014, 2, 1, 'Eighth-Final', 255, 260);
INSERT INTO public.games VALUES (93, 2014, 2, 1, 'Eighth-Final', 256, 250);
INSERT INTO public.games VALUES (94, 2014, 2, 1, 'Eighth-Final', 257, 261);
INSERT INTO public.games VALUES (95, 2014, 1, 0, 'Eighth-Final', 254, 248);
INSERT INTO public.games VALUES (96, 2014, 2, 1, 'Eighth-Final', 241, 262);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (239, 'France');
INSERT INTO public.teams VALUES (240, 'Croatia');
INSERT INTO public.teams VALUES (241, 'Belgium');
INSERT INTO public.teams VALUES (242, 'England');
INSERT INTO public.teams VALUES (243, 'Russia');
INSERT INTO public.teams VALUES (244, 'Sweden');
INSERT INTO public.teams VALUES (245, 'Brazil');
INSERT INTO public.teams VALUES (246, 'Uruguay');
INSERT INTO public.teams VALUES (247, 'Colombia');
INSERT INTO public.teams VALUES (248, 'Switzerland');
INSERT INTO public.teams VALUES (249, 'Japan');
INSERT INTO public.teams VALUES (250, 'Mexico');
INSERT INTO public.teams VALUES (251, 'Denmark');
INSERT INTO public.teams VALUES (252, 'Spain');
INSERT INTO public.teams VALUES (253, 'Portugal');
INSERT INTO public.teams VALUES (254, 'Argentina');
INSERT INTO public.teams VALUES (255, 'Germany');
INSERT INTO public.teams VALUES (256, 'Netherlands');
INSERT INTO public.teams VALUES (257, 'Costa Rica');
INSERT INTO public.teams VALUES (258, 'Chile');
INSERT INTO public.teams VALUES (259, 'Nigeria');
INSERT INTO public.teams VALUES (260, 'Algeria');
INSERT INTO public.teams VALUES (261, 'Greece');
INSERT INTO public.teams VALUES (262, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 96, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 262, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--
