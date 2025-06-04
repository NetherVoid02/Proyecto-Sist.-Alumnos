--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-05-23 14:52:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 16389)
-- Name: Alumno_materia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Alumno_materia" (
    "Id_alumno" integer,
    "Id_materia" integer,
    "Nota_final" character varying(6)
);


ALTER TABLE public."Alumno_materia" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16392)
-- Name: Materia_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Materia_plan" (
    "Id_plan" integer,
    "Id_materia" integer
);


ALTER TABLE public."Materia_plan" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16395)
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno (
    "Id_alumno" integer NOT NULL,
    "Nombre" character varying(15) NOT NULL,
    "Apellido" character varying(15) NOT NULL,
    "Dni" integer NOT NULL,
    "Cuil" integer NOT NULL,
    "Fecha_nacimiento" integer NOT NULL,
    "Hermanos" boolean,
    "Legajo" character varying(15) NOT NULL,
    "Email" character varying(30),
    "Link_docu" character varying(60),
    "Direccion " character varying(30) NOT NULL
);


ALTER TABLE public.alumno OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16398)
-- Name: alumno_Cuil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."alumno_Cuil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."alumno_Cuil_seq" OWNER TO postgres;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 220
-- Name: alumno_Cuil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."alumno_Cuil_seq" OWNED BY public.alumno."Cuil";


--
-- TOC entry 221 (class 1259 OID 16399)
-- Name: alumno_Dni_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."alumno_Dni_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."alumno_Dni_seq" OWNER TO postgres;

--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 221
-- Name: alumno_Dni_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."alumno_Dni_seq" OWNED BY public.alumno."Dni";


--
-- TOC entry 222 (class 1259 OID 16400)
-- Name: alumno_Fecha_nacimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."alumno_Fecha_nacimiento_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."alumno_Fecha_nacimiento_seq" OWNER TO postgres;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 222
-- Name: alumno_Fecha_nacimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."alumno_Fecha_nacimiento_seq" OWNED BY public.alumno."Fecha_nacimiento";


--
-- TOC entry 223 (class 1259 OID 16401)
-- Name: alumno_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."alumno_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."alumno_Id_seq" OWNER TO postgres;

--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 223
-- Name: alumno_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."alumno_Id_seq" OWNED BY public.alumno."Id_alumno";


--
-- TOC entry 224 (class 1259 OID 16402)
-- Name: alumno_curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno_curso (
    "Id_alumno" integer,
    "Id_curso" integer,
    "Anio" character varying(10)
);


ALTER TABLE public.alumno_curso OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16405)
-- Name: alumno_tutor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno_tutor (
    "Id_alumno" integer NOT NULL,
    "Id_tutor" integer NOT NULL
);


ALTER TABLE public.alumno_tutor OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16408)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    "Id_curso" integer NOT NULL,
    "Nombre_curso" character varying(15) NOT NULL,
    "Id_plan" integer NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16411)
-- Name: curso_Id_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."curso_Id_curso_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."curso_Id_curso_seq" OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 227
-- Name: curso_Id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."curso_Id_curso_seq" OWNED BY public.curso."Id_curso";


--
-- TOC entry 228 (class 1259 OID 16412)
-- Name: materia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materia (
    "Id_materia" integer NOT NULL,
    "Nombre_materia" character varying(22) NOT NULL
);


ALTER TABLE public.materia OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16415)
-- Name: materia_Id_materia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."materia_Id_materia_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."materia_Id_materia_seq" OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 229
-- Name: materia_Id_materia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."materia_Id_materia_seq" OWNED BY public.materia."Id_materia";


--
-- TOC entry 230 (class 1259 OID 16416)
-- Name: plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan (
    "Id_plan" integer NOT NULL,
    "Nombre_plan" character varying(15) NOT NULL,
    "Descripcion" character varying(100) NOT NULL
);


ALTER TABLE public.plan OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16419)
-- Name: plan_Id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."plan_Id_plan_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."plan_Id_plan_seq" OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 231
-- Name: plan_Id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."plan_Id_plan_seq" OWNED BY public.plan."Id_plan";


--
-- TOC entry 232 (class 1259 OID 16420)
-- Name: tutor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tutor (
    "Id_tutor" integer NOT NULL,
    "Nombre" character varying(15) NOT NULL,
    "Apellido" character varying(15) NOT NULL,
    "Dni" integer NOT NULL,
    "Cuil" integer NOT NULL,
    "Telefono" integer NOT NULL,
    "Email" character varying(30),
    "Direccion" character varying(30)
);


ALTER TABLE public.tutor OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16423)
-- Name: tutor_Id_tutor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tutor_Id_tutor_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."tutor_Id_tutor_seq" OWNER TO postgres;

--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 233
-- Name: tutor_Id_tutor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tutor_Id_tutor_seq" OWNED BY public.tutor."Id_tutor";


--
-- TOC entry 4680 (class 2604 OID 16424)
-- Name: alumno Dni; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno ALTER COLUMN "Dni" SET DEFAULT nextval('public."alumno_Dni_seq"'::regclass);


--
-- TOC entry 4681 (class 2604 OID 16425)
-- Name: alumno Cuil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno ALTER COLUMN "Cuil" SET DEFAULT nextval('public."alumno_Cuil_seq"'::regclass);


--
-- TOC entry 4682 (class 2604 OID 16426)
-- Name: alumno Fecha_nacimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno ALTER COLUMN "Fecha_nacimiento" SET DEFAULT nextval('public."alumno_Fecha_nacimiento_seq"'::regclass);


--
-- TOC entry 4683 (class 2604 OID 16427)
-- Name: curso Id_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN "Id_curso" SET DEFAULT nextval('public."curso_Id_curso_seq"'::regclass);


--
-- TOC entry 4684 (class 2604 OID 16428)
-- Name: materia Id_materia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia ALTER COLUMN "Id_materia" SET DEFAULT nextval('public."materia_Id_materia_seq"'::regclass);


--
-- TOC entry 4685 (class 2604 OID 16429)
-- Name: plan Id_plan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan ALTER COLUMN "Id_plan" SET DEFAULT nextval('public."plan_Id_plan_seq"'::regclass);


--
-- TOC entry 4853 (class 0 OID 16389)
-- Dependencies: 217
-- Data for Name: Alumno_materia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Alumno_materia" ("Id_alumno", "Id_materia", "Nota_final") FROM stdin;
\.


--
-- TOC entry 4854 (class 0 OID 16392)
-- Dependencies: 218
-- Data for Name: Materia_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Materia_plan" ("Id_plan", "Id_materia") FROM stdin;
\.


--
-- TOC entry 4855 (class 0 OID 16395)
-- Dependencies: 219
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumno ("Id_alumno", "Nombre", "Apellido", "Dni", "Cuil", "Fecha_nacimiento", "Hermanos", "Legajo", "Email", "Link_docu", "Direccion ") FROM stdin;
1	julio	pepe	43868473	622	2001	t	21	pipo@gmail.com	linksdlsjdlj	calle 3
2	sd	sdsdsd	43434	323	2323	f	43	ifgijifgjig	434dfd	valle 3
\.


--
-- TOC entry 4860 (class 0 OID 16402)
-- Dependencies: 224
-- Data for Name: alumno_curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumno_curso ("Id_alumno", "Id_curso", "Anio") FROM stdin;
\.


--
-- TOC entry 4861 (class 0 OID 16405)
-- Dependencies: 225
-- Data for Name: alumno_tutor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumno_tutor ("Id_alumno", "Id_tutor") FROM stdin;
1	1
1	2
\.


--
-- TOC entry 4862 (class 0 OID 16408)
-- Dependencies: 226
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso ("Id_curso", "Nombre_curso", "Id_plan") FROM stdin;
\.


--
-- TOC entry 4864 (class 0 OID 16412)
-- Dependencies: 228
-- Data for Name: materia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materia ("Id_materia", "Nombre_materia") FROM stdin;
\.


--
-- TOC entry 4866 (class 0 OID 16416)
-- Dependencies: 230
-- Data for Name: plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan ("Id_plan", "Nombre_plan", "Descripcion") FROM stdin;
\.


--
-- TOC entry 4868 (class 0 OID 16420)
-- Dependencies: 232
-- Data for Name: tutor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tutor ("Id_tutor", "Nombre", "Apellido", "Dni", "Cuil", "Telefono", "Email", "Direccion") FROM stdin;
1	dfs	dfdf	323	232	2323	fghdfghdf	gdfsg
2	kkk	llll	6767	5675	657567	hgjghj	hgjgh
\.


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 220
-- Name: alumno_Cuil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."alumno_Cuil_seq"', 1, false);


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 221
-- Name: alumno_Dni_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."alumno_Dni_seq"', 1, false);


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 222
-- Name: alumno_Fecha_nacimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."alumno_Fecha_nacimiento_seq"', 1, false);


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 223
-- Name: alumno_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."alumno_Id_seq"', 1, false);


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 227
-- Name: curso_Id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."curso_Id_curso_seq"', 1, false);


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 229
-- Name: materia_Id_materia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."materia_Id_materia_seq"', 1, false);


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 231
-- Name: plan_Id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."plan_Id_plan_seq"', 1, false);


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 233
-- Name: tutor_Id_tutor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tutor_Id_tutor_seq"', 1, false);


--
-- TOC entry 4687 (class 2606 OID 16431)
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY ("Id_alumno");


--
-- TOC entry 4689 (class 2606 OID 16433)
-- Name: alumno_tutor alumno_tutor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno_tutor
    ADD CONSTRAINT alumno_tutor_pkey PRIMARY KEY ("Id_alumno", "Id_tutor") INCLUDE ("Id_alumno", "Id_tutor");


--
-- TOC entry 4691 (class 2606 OID 16435)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY ("Id_curso");


--
-- TOC entry 4694 (class 2606 OID 16437)
-- Name: materia materia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia
    ADD CONSTRAINT materia_pkey PRIMARY KEY ("Id_materia");


--
-- TOC entry 4696 (class 2606 OID 16439)
-- Name: plan plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_pkey PRIMARY KEY ("Id_plan");


--
-- TOC entry 4698 (class 2606 OID 16441)
-- Name: tutor tutor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutor
    ADD CONSTRAINT tutor_pkey PRIMARY KEY ("Id_tutor");


--
-- TOC entry 4692 (class 1259 OID 16442)
-- Name: fki_id_plan; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_plan ON public.curso USING btree ("Id_plan");


--
-- TOC entry 4699 (class 2606 OID 16443)
-- Name: Alumno_materia Alumno_materia_Id_alumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alumno_materia"
    ADD CONSTRAINT "Alumno_materia_Id_alumno_fkey" FOREIGN KEY ("Id_alumno") REFERENCES public.alumno("Id_alumno");


--
-- TOC entry 4700 (class 2606 OID 16448)
-- Name: Alumno_materia Alumno_materia_Id_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alumno_materia"
    ADD CONSTRAINT "Alumno_materia_Id_materia_fkey" FOREIGN KEY ("Id_materia") REFERENCES public.materia("Id_materia");


--
-- TOC entry 4701 (class 2606 OID 16453)
-- Name: Materia_plan Materia_plan_Id_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materia_plan"
    ADD CONSTRAINT "Materia_plan_Id_materia_fkey" FOREIGN KEY ("Id_materia") REFERENCES public.materia("Id_materia") NOT VALID;


--
-- TOC entry 4702 (class 2606 OID 16458)
-- Name: Materia_plan Materia_plan_Id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Materia_plan"
    ADD CONSTRAINT "Materia_plan_Id_plan_fkey" FOREIGN KEY ("Id_plan") REFERENCES public.plan("Id_plan");


--
-- TOC entry 4703 (class 2606 OID 16463)
-- Name: alumno_curso alumno_curso_Id_alumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno_curso
    ADD CONSTRAINT "alumno_curso_Id_alumno_fkey" FOREIGN KEY ("Id_alumno") REFERENCES public.alumno("Id_alumno");


--
-- TOC entry 4704 (class 2606 OID 16468)
-- Name: alumno_curso alumno_curso_Id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno_curso
    ADD CONSTRAINT "alumno_curso_Id_curso_fkey" FOREIGN KEY ("Id_curso") REFERENCES public.curso("Id_curso");


--
-- TOC entry 4705 (class 2606 OID 16473)
-- Name: alumno_tutor alumno_tutor_Id_alumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno_tutor
    ADD CONSTRAINT "alumno_tutor_Id_alumno_fkey" FOREIGN KEY ("Id_alumno") REFERENCES public.alumno("Id_alumno") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4706 (class 2606 OID 16478)
-- Name: alumno_tutor alumno_tutor_Id_tutor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno_tutor
    ADD CONSTRAINT "alumno_tutor_Id_tutor_fkey" FOREIGN KEY ("Id_tutor") REFERENCES public.tutor("Id_tutor") NOT VALID;


--
-- TOC entry 4707 (class 2606 OID 16483)
-- Name: curso curso_Id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT "curso_Id_plan_fkey" FOREIGN KEY ("Id_plan") REFERENCES public.plan("Id_plan") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2025-05-23 14:52:22

--
-- PostgreSQL database dump complete
--

