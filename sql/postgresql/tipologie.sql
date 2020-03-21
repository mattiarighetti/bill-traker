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
-- Name: mmr_tipologie; Type: TABLE; Schema: public; Owner: www-data
--

CREATE TABLE mmr_tipologie (
    tipo_id integer NOT NULL,
    descrizione character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE mmr_tipologie OWNER TO "www-data";

--
-- Data for Name: mmr_tipologie; Type: TABLE DATA; Schema: public; Owner: www-data
--

COPY mmr_tipologie (tipo_id, descrizione) FROM stdin;
1	Spesa Esselunga
2	Nespresso
3	Bollette
4	Spesa generica
5	Altro
\.


--
-- Name: mmr_tipologie_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data
--

ALTER TABLE ONLY mmr_tipologie
    ADD CONSTRAINT mmr_tipologie_pkey PRIMARY KEY (tipo_id);


--
-- PostgreSQL database dump complete
--

