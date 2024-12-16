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

INSERT INTO public.games VALUES (1, 5, 723, 722);
INSERT INTO public.games VALUES (2, 6, 223, 220);
INSERT INTO public.games VALUES (3, 6, 714, 712);
INSERT INTO public.games VALUES (4, 6, 952, 951);
INSERT INTO public.games VALUES (5, 4, 5, 725);
INSERT INTO public.games VALUES (6, 7, 839, 838);
INSERT INTO public.games VALUES (7, 7, 733, 732);
INSERT INTO public.games VALUES (8, 8, 345, 344);
INSERT INTO public.games VALUES (9, 8, 372, 371);
INSERT INTO public.games VALUES (10, 7, 50, 47);
INSERT INTO public.games VALUES (11, 7, 942, 940);
INSERT INTO public.games VALUES (12, 7, 888, 887);
INSERT INTO public.games VALUES (13, 9, 725, 724);
INSERT INTO public.games VALUES (14, 9, 411, 410);
INSERT INTO public.games VALUES (15, 10, 907, 906);
INSERT INTO public.games VALUES (16, 10, 919, 918);
INSERT INTO public.games VALUES (17, 9, 465, 462);
INSERT INTO public.games VALUES (18, 9, 515, 513);
INSERT INTO public.games VALUES (19, 9, 402, 401);
INSERT INTO public.games VALUES (20, 11, 22, 21);
INSERT INTO public.games VALUES (21, 11, 774, 773);
INSERT INTO public.games VALUES (22, 12, 684, 683);
INSERT INTO public.games VALUES (23, 12, 562, 561);
INSERT INTO public.games VALUES (24, 11, 208, 205);
INSERT INTO public.games VALUES (25, 11, 406, 404);
INSERT INTO public.games VALUES (26, 11, 557, 556);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'zoey');
INSERT INTO public.players VALUES (2, 'user_1734379883595');
INSERT INTO public.players VALUES (3, 'user_1734379883594');
INSERT INTO public.players VALUES (4, 'Zoey');
INSERT INTO public.players VALUES (5, 'user_1734380266569');
INSERT INTO public.players VALUES (6, 'user_1734380266570');
INSERT INTO public.players VALUES (7, 'user_1734380632261');
INSERT INTO public.players VALUES (8, 'user_1734380632260');
INSERT INTO public.players VALUES (9, 'user_1734380658879');
INSERT INTO public.players VALUES (10, 'user_1734380658878');
INSERT INTO public.players VALUES (11, 'user_1734380894502');
INSERT INTO public.players VALUES (12, 'user_1734380894501');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 26, true);


--
-- Name: username_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.username_user_id_seq', 12, true);


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

