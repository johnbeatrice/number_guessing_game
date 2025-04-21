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
-- Name: player_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player_info (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.player_info OWNER TO freecodecamp;

--
-- Name: player_info_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_info_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_info_player_id_seq OWNER TO freecodecamp;

--
-- Name: player_info_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_info_player_id_seq OWNED BY public.player_info.player_id;


--
-- Name: player_info player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player_info ALTER COLUMN player_id SET DEFAULT nextval('public.player_info_player_id_seq'::regclass);


--
-- Data for Name: player_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player_info VALUES (6, 'jesus', 1, 1);
INSERT INTO public.player_info VALUES (8, 'user_1745275800921', 2, 701);
INSERT INTO public.player_info VALUES (7, 'user_1745275800922', 5, 91);
INSERT INTO public.player_info VALUES (10, 'user_1745275892253', 2, 366);
INSERT INTO public.player_info VALUES (9, 'user_1745275892254', 5, 246);
INSERT INTO public.player_info VALUES (12, 'user_1745275938970', 2, 602);
INSERT INTO public.player_info VALUES (11, 'user_1745275938971', 5, 226);
INSERT INTO public.player_info VALUES (5, 'john', 5, 1);
INSERT INTO public.player_info VALUES (14, 'user_1745276260756', 2, 505);
INSERT INTO public.player_info VALUES (13, 'user_1745276260757', 5, 200);
INSERT INTO public.player_info VALUES (16, 'user_1745276380523', 2, 488);
INSERT INTO public.player_info VALUES (15, 'user_1745276380524', 5, 313);
INSERT INTO public.player_info VALUES (18, 'user_1745276584398', 2, 575);
INSERT INTO public.player_info VALUES (17, 'user_1745276584399', 5, 97);


--
-- Name: player_info_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_info_player_id_seq', 18, true);


--
-- Name: player_info player_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player_info
    ADD CONSTRAINT player_info_pkey PRIMARY KEY (player_id);


--
-- Name: player_info player_info_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player_info
    ADD CONSTRAINT player_info_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

