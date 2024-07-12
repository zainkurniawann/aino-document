--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-09 09:11:02

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
-- TOC entry 867 (class 1247 OID 16795)
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender AS ENUM (
    'Laki-laki',
    'Perempuan'
);


ALTER TYPE public.gender OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16706)
-- Name: application_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.application_order_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16741)
-- Name: application_ms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_ms (
    application_id bigint NOT NULL,
    application_uuid character varying(128) NOT NULL,
    application_code character varying(20) NOT NULL,
    application_title character varying(100) NOT NULL,
    application_description text,
    application_order integer DEFAULT nextval('public.application_order_seq'::regclass),
    application_show boolean DEFAULT true NOT NULL,
    created_by character varying(100) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated_by character varying(100) DEFAULT ''::character varying,
    updated_at timestamp(0) without time zone,
    deleted_by character varying(100) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.application_ms OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16753)
-- Name: application_role_ms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_role_ms (
    application_role_id bigint NOT NULL,
    application_role_uuid character varying(128) NOT NULL,
    application_id bigint NOT NULL,
    role_id bigint NOT NULL,
    created_by character varying(100) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated_by character varying(100) DEFAULT ''::character varying,
    updated_at timestamp(0) without time zone,
    deleted_by character varying(100) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.application_role_ms OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16705)
-- Name: division_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.division_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.division_order_seq OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16729)
-- Name: division_ms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.division_ms (
    division_id bigint NOT NULL,
    division_uuid character varying(128) NOT NULL,
    division_code character varying(10) NOT NULL,
    division_title character varying(100) NOT NULL,
    division_order integer DEFAULT nextval('public.division_order_seq'::regclass),
    division_show boolean DEFAULT true NOT NULL,
    created_by character varying(100) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated_by character varying(100) DEFAULT ''::character varying,
    updated_at timestamp(0) without time zone,
    deleted_by character varying(100) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.division_ms OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16799)
-- Name: personal_data_ms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_data_ms (
    personal_id bigint NOT NULL,
    personal_uuid character varying(128) NOT NULL,
    user_id bigint NOT NULL,
    division_id bigint NOT NULL,
    personal_name character varying(128) NOT NULL,
    personal_birthday date NOT NULL,
    personal_gender public.gender NOT NULL,
    personal_phone character varying(20) NOT NULL,
    personal_address text NOT NULL
);


ALTER TABLE public.personal_data_ms OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16704)
-- Name: role_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_order_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16717)
-- Name: role_ms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_ms (
    role_id bigint NOT NULL,
    role_uuid character varying(128) NOT NULL,
    role_code character varying(10) NOT NULL,
    role_title character varying(100) NOT NULL,
    role_order integer DEFAULT nextval('public.role_order_seq'::regclass),
    role_show boolean DEFAULT true NOT NULL,
    created_by character varying(100) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated_by character varying(100) DEFAULT ''::character varying,
    updated_at timestamp(0) without time zone,
    deleted_by character varying(100) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.role_ms OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16771)
-- Name: user_application_role_ms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_application_role_ms (
    user_application_role_uuid character varying(128) NOT NULL,
    user_id bigint NOT NULL,
    application_role_id bigint NOT NULL,
    division_id bigint NOT NULL,
    created_by character varying(100) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated_by character varying(100) DEFAULT ''::character varying,
    updated_at timestamp(0) without time zone,
    deleted_by character varying(100) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.user_application_role_ms OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16707)
-- Name: user_ms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_ms (
    user_id bigint NOT NULL,
    user_uuid character varying(128) NOT NULL,
    user_email character varying(100) NOT NULL,
    user_password character varying NOT NULL,
    user_name character varying(200) NOT NULL,
    created_by character varying(100) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(0) without time zone,
    updated_by character varying(100) DEFAULT ''::character varying,
    deleted_by character varying(100) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.user_ms OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 16741)
-- Dependencies: 221
-- Data for Name: application_ms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_ms (application_id, application_uuid, application_code, application_title, application_description, application_order, application_show, created_by, created_at, updated_by, updated_at, deleted_by, deleted_at) FROM stdin;
1698385309747713	a1b2c3d4-e5f6-7890-abcd-ef1234567890	APP001	Sample Application	This is a sample application description.	3	t	Super Admin	2024-07-05 10:04:13		\N		\N
\.


--
-- TOC entry 4912 (class 0 OID 16753)
-- Dependencies: 222
-- Data for Name: application_role_ms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_role_ms (application_role_id, application_role_uuid, application_id, role_id, created_by, created_at, updated_by, updated_at, deleted_by, deleted_at) FROM stdin;
12132343531	d943b5e4-86ba-49de-b9c0-b026de1f3f04	1698385309747713	20199990	Super Admin	2024-07-05 10:08:46		\N		\N
\.


--
-- TOC entry 4910 (class 0 OID 16729)
-- Dependencies: 220
-- Data for Name: division_ms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.division_ms (division_id, division_uuid, division_code, division_title, division_order, division_show, created_by, created_at, updated_by, updated_at, deleted_by, deleted_at) FROM stdin;
1800000	dc9076e9-2fda-4019-bd2c-900a8284b9c8	HC	Human Captial	2	t	Super Admin	2024-07-04 16:27:53		\N		\N
\.


--
-- TOC entry 4914 (class 0 OID 16799)
-- Dependencies: 224
-- Data for Name: personal_data_ms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_data_ms (personal_id, personal_uuid, user_id, division_id, personal_name, personal_birthday, personal_gender, personal_phone, personal_address) FROM stdin;
1	0657bb20-f0c7-4258-afd0-8c8b210485d3	1760000	1800000	jov	2024-07-08	Perempuan	21678394	ngemplak
\.


--
-- TOC entry 4909 (class 0 OID 16717)
-- Dependencies: 219
-- Data for Name: role_ms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_ms (role_id, role_uuid, role_code, role_title, role_order, role_show, created_by, created_at, updated_by, updated_at, deleted_by, deleted_at) FROM stdin;
20199990	dc9076e9-2fda-40dc9076e9-2fda-4019-bd2c-900a8284b9c419-bd2c-900a8284b9c5	A	Super Admin	3	t	Admin	2024-07-04 16:27:43		\N		\N
20199991	dc9076e9-2fda-4019-bd2c-900a8284b9c6	A	Super Admin	4	t	Super Admin	2024-07-04 16:27:43		\N		\N
\.


--
-- TOC entry 4913 (class 0 OID 16771)
-- Dependencies: 223
-- Data for Name: user_application_role_ms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_application_role_ms (user_application_role_uuid, user_id, application_role_id, division_id, created_by, created_at, updated_by, updated_at, deleted_by, deleted_at) FROM stdin;
2b7969fd-2ff9-4fdf-82fb-2d0c2ab9e977	1760000	12132343531	1800000	Golang	2024-07-08 12:00:36		\N		\N
\.


--
-- TOC entry 4908 (class 0 OID 16707)
-- Dependencies: 218
-- Data for Name: user_ms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_ms (user_id, user_uuid, user_email, user_password, user_name, created_by, created_at, updated_at, updated_by, deleted_by, deleted_at) FROM stdin;
1760000	dc9076e9-2fda-4019-bd2c-900a8284b9c6	nathan@gmail.com	JDJhJDEwJDVhSEh2enNKd0g4cHowTWh4OHdnME9FNTNmVFdHaEZ1alhpR1cuYkhtUWNlSFpQYUs4MTVl	Nathan N	Admin	2024-07-05 11:01:06	\N			\N
\.


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 217
-- Name: application_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_order_seq', 4, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 216
-- Name: division_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.division_order_seq', 2, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 215
-- Name: role_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_order_seq', 4, true);


--
-- TOC entry 4748 (class 2606 OID 16752)
-- Name: application_ms application_ms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_ms
    ADD CONSTRAINT application_ms_pkey PRIMARY KEY (application_id);


--
-- TOC entry 4750 (class 2606 OID 16760)
-- Name: application_role_ms application_role_ms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_role_ms
    ADD CONSTRAINT application_role_ms_pkey PRIMARY KEY (application_role_id);


--
-- TOC entry 4746 (class 2606 OID 16740)
-- Name: division_ms division_ms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.division_ms
    ADD CONSTRAINT division_ms_pkey PRIMARY KEY (division_id);


--
-- TOC entry 4754 (class 2606 OID 16805)
-- Name: personal_data_ms personal_data_ms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_data_ms
    ADD CONSTRAINT personal_data_ms_pkey PRIMARY KEY (personal_id);


--
-- TOC entry 4744 (class 2606 OID 16728)
-- Name: role_ms role_ms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_ms
    ADD CONSTRAINT role_ms_pkey PRIMARY KEY (role_id);


--
-- TOC entry 4752 (class 2606 OID 16778)
-- Name: user_application_role_ms user_application_role_ms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_application_role_ms
    ADD CONSTRAINT user_application_role_ms_pkey PRIMARY KEY (user_id, application_role_id, division_id);


--
-- TOC entry 4742 (class 2606 OID 16716)
-- Name: user_ms user_ms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_ms
    ADD CONSTRAINT user_ms_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4755 (class 2606 OID 16761)
-- Name: application_role_ms application_role_ms_application_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_role_ms
    ADD CONSTRAINT application_role_ms_application_id_fkey FOREIGN KEY (application_id) REFERENCES public.application_ms(application_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4756 (class 2606 OID 16766)
-- Name: application_role_ms application_role_ms_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_role_ms
    ADD CONSTRAINT application_role_ms_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role_ms(role_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4760 (class 2606 OID 16811)
-- Name: personal_data_ms personal_data_ms_division_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_data_ms
    ADD CONSTRAINT personal_data_ms_division_id_fkey FOREIGN KEY (division_id) REFERENCES public.division_ms(division_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4761 (class 2606 OID 16806)
-- Name: personal_data_ms personal_data_ms_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_data_ms
    ADD CONSTRAINT personal_data_ms_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_ms(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4757 (class 2606 OID 16784)
-- Name: user_application_role_ms user_application_role_ms_application_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_application_role_ms
    ADD CONSTRAINT user_application_role_ms_application_role_id_fkey FOREIGN KEY (application_role_id) REFERENCES public.application_role_ms(application_role_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4758 (class 2606 OID 16789)
-- Name: user_application_role_ms user_application_role_ms_division_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_application_role_ms
    ADD CONSTRAINT user_application_role_ms_division_id_fkey FOREIGN KEY (division_id) REFERENCES public.division_ms(division_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4759 (class 2606 OID 16779)
-- Name: user_application_role_ms user_application_role_ms_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_application_role_ms
    ADD CONSTRAINT user_application_role_ms_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_ms(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-07-09 09:11:02

--
-- PostgreSQL database dump complete
--

