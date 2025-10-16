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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.users (user_id, username, games_played, best_game) FROM stdin;
1		0	\N
2	user_1760571304884	0	\N
3	user_1760571304883	0	\N
4	user_1760571781150	0	\N
5	user_1760571781149	0	\N
6	user_1760571800664	0	\N
7	user_1760571800663	0	\N
8	632	1	367
9	325	0	\N
24	user_1760572769354	2	111
10	169	1	492
11	213	0	\N
12	942	0	\N
13	281	1	432
14	60	1	755
23	user_1760572769355	5	42
16	user_1760572078853	2	179
36	user_1760574540162	2	558
15	user_1760572078854	5	337
26	user_1760572934801	2	203
48	user_1760576295180	2	77
35	user_1760574540163	5	165
25	user_1760572934802	5	118
18	user_1760572270178	2	14
17	user_1760572270179	5	31
47	user_1760576295181	5	25
28	user_1760572943751	2	135
20	user_1760572391179	2	143
60	user_1760577263394	2	472
27	user_1760572943752	5	72
19	user_1760572391180	5	37
38	user_1760574667720	2	625
37	user_1760574667721	5	31
30	user_1760573160247	2	441
22	user_1760572761506	2	425
59	user_1760577263395	5	101
50	user_1760576620800	2	367
21	user_1760572761507	5	119
29	user_1760573160248	5	523
49	user_1760576620801	5	176
40	user_1760575111147	2	24
39	user_1760575111148	5	96
32	user_1760573546568	2	690
31	user_1760573546569	5	440
42	user_1760575194076	2	102
34	user_1760573919772	2	610
52	user_1760576885755	2	418
41	user_1760575194077	5	406
33	user_1760573919773	5	73
51	user_1760576885756	5	218
44	user_1760575421041	2	319
54	user_1760576962508	2	519
43	user_1760575421042	5	116
53	user_1760576962509	5	127
46	user_1760576064263	2	350
45	user_1760576064264	5	131
56	user_1760577121521	2	510
55	user_1760577121522	5	335
58	user_1760577163695	2	319
57	user_1760577163696	5	231
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 60, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

