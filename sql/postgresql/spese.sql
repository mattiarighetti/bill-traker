--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: mmr_spese; Type: TABLE; Schema: public; Owner: www-data
--

CREATE TABLE mmr_spese (
    spesa_id integer NOT NULL,
    descrizione character varying(100),
    data date,
    user_id integer,
    tipo_id integer,
    totale numeric(5,2)
);


ALTER TABLE mmr_spese OWNER TO "www-data";

--
-- Data for Name: mmr_spese; Type: TABLE DATA; Schema: public; Owner: www-data
--

COPY mmr_spese (spesa_id, descrizione, data, user_id, tipo_id, totale) FROM stdin;
2	\N	2015-09-08	675	2	19.10
4	Carrefour Express	2015-09-16	675	4	5.03
1	\N	2015-09-01	675	1	28.27
3	\N	2015-09-13	675	1	20.00
11	\N	2015-09-24	675	1	20.25
15	\N	2015-10-16	675	1	61.16
17	\N	2015-10-21	675	1	27.30
19	Amazon Prime Now	2015-11-07	675	4	28.87
20	Shopping Club	2015-10-23	675	4	7.80
21	A2A 03/11/2015	2015-11-13	675	3	32.00
22	\N	2015-11-08	675	1	26.98
24	\N	2015-11-16	675	1	39.99
27	\N	2015-12-02	675	1	47.49
28	Amazon Prime Now (Invoice AEU-INV-IT-2015-1211501)	2015-11-21	675	4	22.42
29	Amazon Prime Now (Invoice AEU-INV-IT-2015-1378086)	2015-12-05	675	4	22.52
5	\N	2015-09-15	677	1	15.41
6	\N	2015-09-16	677	1	16.77
7	\N	2015-09-20	677	1	23.85
8	\N	2015-09-14	677	1	22.73
9	\N	2015-09-05	677	1	15.20
10	\N	2015-09-21	677	2	35.50
13	\N	2015-09-29	677	1	24.99
14	\N	2015-10-08	677	1	40.78
16	\N	2015-10-17	677	2	42.90
18	\N	2015-10-31	677	1	29.70
23	\N	2015-11-15	677	2	66.30
25	\N	2015-11-27	677	1	51.69
26	diffusore rinascente	2015-11-18	677	5	15.92
31	Amazon Prime Now	2015-12-12	675	5	25.09
32	Spesa SIGMA	2015-12-17	675	4	5.96
34	\N	2016-01-11	675	1	45.55
35	Pizza	2016-01-13	675	5	14.00
37	Spesa IperCoop C.C. Piazzale Lodi	2016-01-31	675	2	16.60
38	\N	2016-01-26	675	2	39.40
39	20 capsule e un descaling kit	2016-01-26	675	2	16.60
42	\N	2016-02-22	675	1	40.10
45	Fortissio, Ristretto, Darkhan, Kazaar, Tanim de Chiapas	2016-03-06	675	2	20.70
48	Amazon Prime Now	2016-03-07	675	5	24.09
51	\N	2016-03-30	675	1	40.40
52	\N	2016-03-23	675	1	27.70
56	\N	2016-05-02	675	1	43.70
57	Amazon Prime Now	2016-04-26	675	5	20.06
58	Amazon Prime Now	2016-04-04	675	5	28.06
60	\N	2016-04-30	675	1	27.70
63	\N	2016-05-17	675	1	27.55
64	\N	2016-05-17	675	2	38.80
68	\N	2016-06-07	675	1	28.91
30	pizza per pensionati	2015-12-12	677	5	19.70
33	\N	2016-01-08	677	3	33.00
36	\N	2016-01-29	677	1	21.91
40	\N	2016-02-09	677	1	35.04
41	\N	2016-02-15	677	1	21.91
43	Cena greca	2016-02-24	677	5	25.50
44	\N	2016-02-29	677	1	43.09
47	Deliveroo	2016-03-12	677	5	27.50
49	\N	2016-03-15	677	1	29.19
50	\N	2016-03-15	677	3	35.00
53	\N	2016-04-13	677	2	34.70
54	\N	2016-04-18	677	1	22.41
55	\N	2016-04-28	677	1	19.26
61	\N	2016-05-07	677	1	23.93
62	\N	2016-05-11	677	1	30.03
65	\N	2016-05-18	677	1	8.77
66	\N	2016-05-20	677	3	38.00
67	\N	2016-05-23	677	5	13.00
46	\N	2016-03-11	677	1	15.42
69	\N	2016-06-13	675	1	28.77
59	Mariu kebabberia gastronomica	2016-05-04	675	4	22.40
70	Amazon Prime Now (Acqua)	2016-06-17	675	4	23.37
71	Amazon Prime Now	2016-05-23	675	4	19.83
72	\N	2016-06-17	677	2	58.50
73	\N	2016-05-31	677	1	59.22
74	\N	2016-06-12	677	1	15.40
75	JustEat - Pizzeria Toscana	2016-06-01	675	5	12.00
76	\N	2016-06-26	677	5	12.00
\.


--
-- Name: mmr_spese_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY mmr_spese
    ADD CONSTRAINT mmr_spese_pkey PRIMARY KEY (spesa_id);


--
-- PostgreSQL database dump complete
--

