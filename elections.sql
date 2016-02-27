--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: elections; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE elections (
    id integer NOT NULL,
    name character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: elections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE elections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: elections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE elections_id_seq OWNED BY elections.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY elections ALTER COLUMN id SET DEFAULT nextval('elections_id_seq'::regclass);


--
-- Data for Name: elections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY elections (id, name, code, created_at, updated_at) FROM stdin;
1	2006 General	06GENR	2016-02-26 22:30:04.964879	2016-02-26 22:30:04.964879
2	2006 Primary	06PRIM	2016-02-26 22:30:29.36005	2016-02-26 22:30:29.36005
3	2006 Regular	06REGL	2016-02-26 22:30:56.839052	2016-02-26 22:30:56.839052
4	2006 Special	06SPEL	2016-02-26 22:31:30.513303	2016-02-26 22:31:30.513303
5	2007 Regular	07REGL	2016-02-26 22:32:00.049258	2016-02-26 22:32:00.049258
7	2008 General	08GENR	2016-02-26 22:33:13.145218	2016-02-26 22:33:13.145218
8	2008 Primary	08PRIM	2016-02-26 22:33:31.878464	2016-02-26 22:33:31.878464
9	2008 Regular	08REGL	2016-02-26 22:34:11.074852	2016-02-26 22:34:11.074852
10	2009 Regular	09REGL	2016-02-26 22:34:38.446009	2016-02-26 22:34:38.446009
11	2009 Special	09SPEL	2016-02-26 22:34:54.588798	2016-02-26 22:34:54.588798
12	2010 General	10GENR	2016-02-26 22:35:31.320406	2016-02-26 22:35:31.320406
13	2010 Primary	10PRIM	2016-02-26 22:35:43.886442	2016-02-26 22:35:43.886442
14	2010 Regular	10REGL	2016-02-26 22:36:15.316553	2016-02-26 22:36:15.316553
15	2011 Regular	11REGL	2016-02-26 22:36:56.758447	2016-02-26 22:36:56.758447
16	2011 Special	11SPEL	2016-02-26 22:37:11.267938	2016-02-26 22:37:11.267938
18	2012 Primary	12PRIM	2016-02-26 22:37:56.843233	2016-02-26 22:37:56.843233
19	2012 Regular	12REGL	2016-02-26 22:38:10.232707	2016-02-26 22:38:10.232707
17	2012 General	12GENR	2016-02-26 22:37:35.799102	2016-02-26 22:38:22.803289
6	2007 Special	07SPEL	2016-02-26 22:32:31.988108	2016-02-26 22:38:33.473086
20	2013 Regular	13REGL	2016-02-26 22:39:07.61058	2016-02-26 22:39:07.61058
21	2014 General	14GENR	2016-02-26 22:39:40.195661	2016-02-26 22:39:40.195661
22	2014 Primary	14PRIM	2016-02-26 22:39:51.085254	2016-02-26 22:39:51.085254
23	2014 Regular	14REGL	2016-02-26 22:40:12.011912	2016-02-26 22:40:12.011912
24	2015 MSB 1	15MSB1	2016-02-26 22:41:26.72351	2016-02-26 22:41:26.72351
25	2015 MSB 2	15MSB2	2016-02-26 22:41:43.364446	2016-02-26 22:41:43.364446
26	2015 MSB 6	15MSB6	2016-02-26 22:41:57.902393	2016-02-26 22:41:57.902393
27	2015 MSB General	15MSBG	2016-02-26 22:42:14.79339	2016-02-26 22:42:14.79339
28	2015 Regular	15REGL	2016-02-26 22:42:27.044825	2016-02-26 22:42:27.044825
29	2015 Special	15SPEL	2016-02-26 22:42:40.555819	2016-02-26 22:42:40.555819
30	2007 Statewide Special	07SPEC	2016-02-27 00:10:38.453261	2016-02-27 00:10:38.453261
31	2008 Special	08SPEL	2016-02-27 00:12:38.090285	2016-02-27 00:12:38.090285
32	2012 Special	12SPEL	2016-02-27 00:14:33.884156	2016-02-27 00:14:33.884156
33	2010 Special	10SPEL	2016-02-27 00:16:09.366343	2016-02-27 00:16:09.366343
\.


--
-- Name: elections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('elections_id_seq', 33, true);


--
-- Name: elections_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY elections
    ADD CONSTRAINT elections_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

