    --
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2019-12-23 10:04:24

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
-- TOC entry 202 (class 1259 OID 16904)
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
    group_name character varying(10) NOT NULL,
    group_year integer NOT NULL
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16930)
-- Name: groups_have_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups_have_subjects (
    subject_name character varying(100) NOT NULL,
    group_name character varying(10) NOT NULL,
    group_year integer NOT NULL
);


ALTER TABLE public.groups_have_subjects OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17046)
-- Name: implementation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.implementation (
    attempt integer NOT NULL,
    record_book character varying(6) NOT NULL,
    group_year integer NOT NULL,
    laboratory_theme character varying(500) NOT NULL,
    mark integer,
    implementation_content text NOT NULL,
    test_output text,
    operator_sequence text,
    plagiary integer
);


ALTER TABLE public.implementation OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16924)
-- Name: label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.label (
    label_number integer NOT NULL,
    label_name character varying(100)
);


ALTER TABLE public.label OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16922)
-- Name: label_label_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.label_label_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_label_number_seq OWNER TO postgres;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 205
-- Name: label_label_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.label_label_number_seq OWNED BY public.label.label_number;


--
-- TOC entry 209 (class 1259 OID 16958)
-- Name: laboratory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratory (
    laboratory_theme character varying(500) NOT NULL,
    subject_name character varying(100) NOT NULL,
    laboratory_goal character varying(500),
    laboratory_number integer NOT NULL
);


ALTER TABLE public.laboratory OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16997)
-- Name: laboratory_have_tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratory_have_tests (
    test_name character varying(500) NOT NULL,
    laboratory_theme character varying(500) NOT NULL
);


ALTER TABLE public.laboratory_have_tests OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16971)
-- Name: material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material (
    material_name character varying(500) NOT NULL,
    material_author character varying(500) NOT NULL,
    label_number integer,
    material_content text
);


ALTER TABLE public.material OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16984)
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource (
    resource_name character varying(500) NOT NULL,
    resource_source character varying(500) NOT NULL,
    label_number integer,
    resource_content text,
    rating integer NOT NULL
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16945)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    record_book character varying(6) NOT NULL,
    group_year integer NOT NULL,
    group_name character varying(10) NOT NULL,
    student_name character varying(500) NOT NULL,
    student_email character varying(200) NOT NULL,
    student_phone character varying(50)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16909)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    subject_name character varying(100) NOT NULL
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17015)
-- Name: subjects_have_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects_have_materials (
    subject_name character varying(100) NOT NULL,
    material_name character varying(500) NOT NULL,
    material_author character varying(500) NOT NULL
);


ALTER TABLE public.subjects_have_materials OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17033)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    variant integer NOT NULL,
    laboratory_theme character varying(500) NOT NULL,
    laboratory_task text NOT NULL
);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16914)
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    test_name character varying(500) NOT NULL,
    input_data text NOT NULL,
    expected_result text NOT NULL,
    output_data text
);


ALTER TABLE public.test OWNER TO postgres;

--
-- TOC entry 2744 (class 2604 OID 16927)
-- Name: label label_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.label ALTER COLUMN label_number SET DEFAULT nextval('public.label_label_number_seq'::regclass);


--
-- TOC entry 2746 (class 2606 OID 16908)
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (group_name, group_year);


--
-- TOC entry 2754 (class 2606 OID 16934)
-- Name: groups_have_subjects groups_have_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_have_subjects
    ADD CONSTRAINT groups_have_subjects_pkey PRIMARY KEY (subject_name, group_name, group_year);


--
-- TOC entry 2770 (class 2606 OID 17053)
-- Name: implementation implementation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.implementation
    ADD CONSTRAINT implementation_pkey PRIMARY KEY (attempt, record_book, group_year, laboratory_theme);


--
-- TOC entry 2752 (class 2606 OID 16929)
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (label_number);


--
-- TOC entry 2764 (class 2606 OID 17004)
-- Name: laboratory_have_tests laboratory_have_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_have_tests
    ADD CONSTRAINT laboratory_have_tests_pkey PRIMARY KEY (test_name, laboratory_theme);


--
-- TOC entry 2758 (class 2606 OID 16965)
-- Name: laboratory laboratory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory
    ADD CONSTRAINT laboratory_pkey PRIMARY KEY (laboratory_theme);


--
-- TOC entry 2760 (class 2606 OID 16978)
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (material_name, material_author);


--
-- TOC entry 2762 (class 2606 OID 16991)
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (resource_name, resource_source);


--
-- TOC entry 2756 (class 2606 OID 16952)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (record_book, group_year);


--
-- TOC entry 2748 (class 2606 OID 16913)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (subject_name);


--
-- TOC entry 2766 (class 2606 OID 17022)
-- Name: subjects_have_materials subjects_have_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_have_materials
    ADD CONSTRAINT subjects_have_materials_pkey PRIMARY KEY (subject_name, material_name, material_author);


--
-- TOC entry 2768 (class 2606 OID 17040)
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (variant, laboratory_theme);


--
-- TOC entry 2750 (class 2606 OID 16921)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (test_name);


--
-- TOC entry 2771 (class 2606 OID 16935)
-- Name: groups_have_subjects groups_have_subjects_group_name_group_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_have_subjects
    ADD CONSTRAINT groups_have_subjects_group_name_group_year_fkey FOREIGN KEY (group_name, group_year) REFERENCES public."group"(group_name, group_year);


--
-- TOC entry 2772 (class 2606 OID 16940)
-- Name: groups_have_subjects groups_have_subjects_subject_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_have_subjects
    ADD CONSTRAINT groups_have_subjects_subject_name_fkey FOREIGN KEY (subject_name) REFERENCES public.subject(subject_name);


--
-- TOC entry 2783 (class 2606 OID 17059)
-- Name: implementation implementation_laboratory_theme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.implementation
    ADD CONSTRAINT implementation_laboratory_theme_fkey FOREIGN KEY (laboratory_theme) REFERENCES public.laboratory(laboratory_theme);


--
-- TOC entry 2782 (class 2606 OID 17054)
-- Name: implementation implementation_record_book_group_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.implementation
    ADD CONSTRAINT implementation_record_book_group_year_fkey FOREIGN KEY (record_book, group_year) REFERENCES public.student(record_book, group_year);


--
-- TOC entry 2778 (class 2606 OID 17010)
-- Name: laboratory_have_tests laboratory_have_tests_laboratory_theme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_have_tests
    ADD CONSTRAINT laboratory_have_tests_laboratory_theme_fkey FOREIGN KEY (laboratory_theme) REFERENCES public.laboratory(laboratory_theme);


--
-- TOC entry 2777 (class 2606 OID 17005)
-- Name: laboratory_have_tests laboratory_have_tests_test_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory_have_tests
    ADD CONSTRAINT laboratory_have_tests_test_name_fkey FOREIGN KEY (test_name) REFERENCES public.test(test_name);


--
-- TOC entry 2774 (class 2606 OID 16966)
-- Name: laboratory laboratory_subject_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory
    ADD CONSTRAINT laboratory_subject_name_fkey FOREIGN KEY (subject_name) REFERENCES public.subject(subject_name);


--
-- TOC entry 2775 (class 2606 OID 16979)
-- Name: material material_label_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_label_number_fkey FOREIGN KEY (label_number) REFERENCES public.label(label_number);


--
-- TOC entry 2776 (class 2606 OID 16992)
-- Name: resource resource_label_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_label_number_fkey FOREIGN KEY (label_number) REFERENCES public.label(label_number);


--
-- TOC entry 2773 (class 2606 OID 16953)
-- Name: student student_group_name_group_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_group_name_group_year_fkey FOREIGN KEY (group_name, group_year) REFERENCES public."group"(group_name, group_year);


--
-- TOC entry 2779 (class 2606 OID 17023)
-- Name: subjects_have_materials subjects_have_materials_material_name_material_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_have_materials
    ADD CONSTRAINT subjects_have_materials_material_name_material_author_fkey FOREIGN KEY (material_name, material_author) REFERENCES public.material(material_name, material_author);


--
-- TOC entry 2780 (class 2606 OID 17028)
-- Name: subjects_have_materials subjects_have_materials_subject_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_have_materials
    ADD CONSTRAINT subjects_have_materials_subject_name_fkey FOREIGN KEY (subject_name) REFERENCES public.subject(subject_name);


--
-- TOC entry 2781 (class 2606 OID 17041)
-- Name: task task_laboratory_theme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_laboratory_theme_fkey FOREIGN KEY (laboratory_theme) REFERENCES public.laboratory(laboratory_theme);


-- Completed on 2019-12-23 10:04:24

--
-- PostgreSQL database dump complete
--


    
