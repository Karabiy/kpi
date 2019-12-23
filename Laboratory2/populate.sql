    --
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2019-12-23 10:09:28

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

--
-- TOC entry 2910 (class 0 OID 16904)
-- Dependencies: 202
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."group" VALUES ('KM-62', 2016);
INSERT INTO public."group" VALUES ('KM-61', 2016);
INSERT INTO public."group" VALUES ('KM-63', 2016);


--
-- TOC entry 2911 (class 0 OID 16909)
-- Dependencies: 203
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subject VALUES ('Calculus');
INSERT INTO public.subject VALUES ('Python');
INSERT INTO public.subject VALUES ('DB');


--
-- TOC entry 2915 (class 0 OID 16930)
-- Dependencies: 207
-- Data for Name: groups_have_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2917 (class 0 OID 16958)
-- Dependencies: 209
-- Data for Name: laboratory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.laboratory VALUES ('Integral', 'Calculus', 'Learn how to solve integrals', 1);
INSERT INTO public.laboratory VALUES ('Loop', 'Calculus', 'Learn how loop works', 3);
INSERT INTO public.laboratory VALUES ('Postgres', 'Calculus', 'Learn how to postgres', 2);


--
-- TOC entry 2916 (class 0 OID 16945)
-- Dependencies: 208
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student VALUES ('KM6202', 2016, 'KM-62', 'Richmound Tizard', 'rtizard1@arstechnica.com', '+64 958 599 9496');
INSERT INTO public.student VALUES ('KM6203', 2016, 'KM-62', 'Torrie Chinge', 'tchinge2@gov.uk', '+7 362 480 7692');
INSERT INTO public.student VALUES ('KM6204', 2016, 'KM-62', 'Becca Parell', 'bparell3@yandex.ru', '+63 910 768 4564');


--
-- TOC entry 2923 (class 0 OID 17046)
-- Dependencies: 215
-- Data for Name: implementation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.implementation VALUES (1, 'KM6202', 2016, 'Integral', 8, 'Work content', 'Success', 'operator sequence', 13);
INSERT INTO public.implementation VALUES (1, 'KM6203', 2016, 'Integral', 2, 'Work content', 'Input validation failed', 'operator sequence', 22);
INSERT INTO public.implementation VALUES (2, 'KM6203', 2016, 'Integral', 4, 'Work content', 'Input validation failed', 'operator sequence', 26);


--
-- TOC entry 2914 (class 0 OID 16924)
-- Dependencies: 206
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.label VALUES (1, 'Integrals');
INSERT INTO public.label VALUES (2, 'Integrals');
INSERT INTO public.label VALUES (3, 'Integrals');


--
-- TOC entry 2912 (class 0 OID 16914)
-- Dependencies: 204
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.test VALUES ('Put string instead of integer as first param', 'input data', 'expected result', 'Input validation failed');
INSERT INTO public.test VALUES ('Put string instead of integer as second param', 'input data', 'expected result', 'Input validation failed');
INSERT INTO public.test VALUES ('Test correct answer', 'input data', 'expected result', 'Answer is incorrect');


--
-- TOC entry 2920 (class 0 OID 16997)
-- Dependencies: 212
-- Data for Name: laboratory_have_tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.laboratory_have_tests VALUES ('Put string instead of integer as first param', 'Integral');
INSERT INTO public.laboratory_have_tests VALUES ('Put string instead of integer as second param', 'Integral');
INSERT INTO public.laboratory_have_tests VALUES ('Test correct answer', 'Integral');


--
-- TOC entry 2918 (class 0 OID 16971)
-- Dependencies: 210
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.material VALUES ('Integral material', 'KPI FAM 1999', 1, 'Material about integral');
INSERT INTO public.material VALUES ('Riman integral material', 'KPI FAM 1999', 1, 'Material about Riman integral');
INSERT INTO public.material VALUES ('Lebesgue integral material', 'KPI FAM 1999', 1, 'Material about Lebesgue integral');


--
-- TOC entry 2919 (class 0 OID 16984)
-- Dependencies: 211
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.resource VALUES ('Definite Integrals MIT lection', 'MIT', 1, 'The following content is provided under a Creative Commons license. Your support will help MIT OpenCourseWare continue to offer high quality educational resources for free. To make a donation or to view additional materials from hundreds of MIT courses, visit MIT OpenCourseWare at ocw.mit.edu.', 0);
INSERT INTO public.resource VALUES ('Oxford integral lection', 'Oxford', 1, 'In these lectures we define a simple integral and study its properties; prove the Mean Value Theorem for Integrals and the Fundamental Theorem of Calculus. This gives us the tools to justify term-by-term differentiation of power series and deduce the elementary properties of the trigonometric functions.', 0);
INSERT INTO public.resource VALUES ('Wikipedia article about integrals', 'Wiki', 1, 'In mathematics, an integral assigns numbers to functions in a way that can describe displacement, area, volume, and other concepts that arise by combining infinitesimal data. Integration is one of the two main operations of calculus, with its inverse operation, differentiation, being the other. Given a function f of a real variable x and an interval [a, b] of the real line, the definite integral', 0);


--
-- TOC entry 2921 (class 0 OID 17015)
-- Dependencies: 213
-- Data for Name: subjects_have_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subjects_have_materials VALUES ('Calculus', 'Integral material', 'KPI FAM 1999');
INSERT INTO public.subjects_have_materials VALUES ('Calculus', 'Riman integral material', 'KPI FAM 1999');
INSERT INTO public.subjects_have_materials VALUES ('Calculus', 'Lebesgue integral material', 'KPI FAM 1999');


--
-- TOC entry 2922 (class 0 OID 17033)
-- Dependencies: 214
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.task VALUES (2, 'Integral', 'Solve integral');
INSERT INTO public.task VALUES (3, 'Integral', 'Solve Riman integral');
INSERT INTO public.task VALUES (4, 'Integral', 'Solve Lebesgue integral');


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 205
-- Name: label_label_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.label_label_number_seq', 1, false);


-- Completed on 2019-12-23 10:09:29

--
-- PostgreSQL database dump complete
--


    
