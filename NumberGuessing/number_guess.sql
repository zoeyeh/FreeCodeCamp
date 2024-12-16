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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    user_id integer,
    number_of_guesses integer,
    secret_number integer
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
-- Name: username_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.username_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.username_user_id_seq OWNER TO freecodecamp;

--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer DEFAULT nextval('public.username_user_id_seq'::regclass) NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 930, 929);
INSERT INTO public.games VALUES (2, 1, 986, 985);
INSERT INTO public.games VALUES (3, 2, 407, 406);
INSERT INTO public.games VALUES (4, 2, 45, 44);
INSERT INTO public.games VALUES (5, 1, 514, 511);
INSERT INTO public.games VALUES (6, 1, 680, 678);
INSERT INTO public.games VALUES (7, 1, 920, 919);
INSERT INTO public.games VALUES (8, 3, 547, 546);
INSERT INTO public.games VALUES (9, 3, 341, 340);
INSERT INTO public.games VALUES (10, 4, 730, 729);
INSERT INTO public.games VALUES (11, 4, 566, 565);
INSERT INTO public.games VALUES (12, 3, 223, 220);
INSERT INTO public.games VALUES (13, 3, 407, 405);
INSERT INTO public.games VALUES (14, 3, 187, 186);
INSERT INTO public.games VALUES (15, 5, 723, 722);
INSERT INTO public.games VALUES (16, 5, 601, 600);
INSERT INTO public.games VALUES (17, 6, 821, 820);
INSERT INTO public.games VALUES (18, 6, 717, 716);
INSERT INTO public.games VALUES (19, 5, 996, 993);
INSERT INTO public.games VALUES (20, 5, 151, 149);
INSERT INTO public.games VALUES (21, 5, 46, 45);
INSERT INTO public.games VALUES (22, 8, 574, 573);
INSERT INTO public.games VALUES (23, 8, 570, 569);
INSERT INTO public.games VALUES (24, 9, 563, 562);
INSERT INTO public.games VALUES (25, 9, 81, 80);
INSERT INTO public.games VALUES (26, 8, 607, 604);
INSERT INTO public.games VALUES (27, 8, 659, 657);
INSERT INTO public.games VALUES (28, 8, 512, 511);
INSERT INTO public.games VALUES (29, 7, 11, 506);
INSERT INTO public.games VALUES (30, 10, 967, 966);
INSERT INTO public.games VALUES (31, 10, 896, 895);
INSERT INTO public.games VALUES (32, 11, 906, 905);
INSERT INTO public.games VALUES (33, 11, 518, 517);
INSERT INTO public.games VALUES (34, 10, 616, 613);
INSERT INTO public.games VALUES (35, 10, 766, 764);
INSERT INTO public.games VALUES (36, 10, 442, 441);
INSERT INTO public.games VALUES (37, 7, 10, 828);
INSERT INTO public.games VALUES (38, 12, 194, 193);
INSERT INTO public.games VALUES (39, 12, 435, 434);
INSERT INTO public.games VALUES (40, 13, 718, 717);
INSERT INTO public.games VALUES (41, 13, 414, 413);
INSERT INTO public.games VALUES (42, 12, 15, 12);
INSERT INTO public.games VALUES (43, 12, 987, 985);
INSERT INTO public.games VALUES (44, 12, 526, 525);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1734383251575');
INSERT INTO public.players VALUES (2, 'user_1734383251574');
INSERT INTO public.players VALUES (3, 'user_1734383320988');
INSERT INTO public.players VALUES (4, 'user_1734383320987');
INSERT INTO public.players VALUES (5, 'user_1734383343903');
INSERT INTO public.players VALUES (6, 'user_1734383343902');
INSERT INTO public.players VALUES (7, 'Zoey');
INSERT INTO public.players VALUES (8, 'user_1734383416948');
INSERT INTO public.players VALUES (9, 'user_1734383416947');
INSERT INTO public.players VALUES (10, 'user_1734383520814');
INSERT INTO public.players VALUES (11, 'user_1734383520813');
INSERT INTO public.players VALUES (12, 'user_1734383580259');
INSERT INTO public.players VALUES (13, 'user_1734383580258');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 44, true);


--
-- Name: username_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.username_user_id_seq', 13, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT username_pkey PRIMARY KEY (user_id);


--
-- Name: players username_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT username_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

