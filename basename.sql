--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO django;

--
-- Name: climb_crag; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.climb_crag (
    id uuid NOT NULL,
    name character varying(45) NOT NULL,
    description text NOT NULL,
    latitude character varying(45),
    longitude character varying(45),
    city character varying(45) NOT NULL,
    province character varying(25) NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    mod_date timestamp with time zone NOT NULL,
    owner_id uuid
);


ALTER TABLE public.climb_crag OWNER TO django;

--
-- Name: climb_route; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.climb_route (
    id uuid NOT NULL,
    name character varying(45) NOT NULL,
    description text NOT NULL,
    grade character varying(10) NOT NULL,
    rating character varying(1) NOT NULL,
    height integer,
    nanchor integer,
    anchor_type character varying(15) NOT NULL,
    lowering_station character varying(20) NOT NULL,
    pith integer,
    feature text NOT NULL,
    photo character varying(100) NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    mod_date timestamp with time zone NOT NULL,
    owner_id uuid,
    sector_id_id uuid NOT NULL
);


ALTER TABLE public.climb_route OWNER TO django;

--
-- Name: climb_sector; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.climb_sector (
    id uuid NOT NULL,
    name character varying(45) NOT NULL,
    description text NOT NULL,
    parking_coordinates character varying(45) NOT NULL,
    latitude character varying(45),
    longitude character varying(45),
    orientation character varying(2) NOT NULL,
    picture character varying(100),
    approach text NOT NULL,
    rope integer,
    warning boolean NOT NULL,
    warning_text text NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    mod_date timestamp with time zone NOT NULL,
    rock_type character varying(45) NOT NULL,
    crag_id_id uuid NOT NULL,
    owner_id uuid
);


ALTER TABLE public.climb_sector OWNER TO django;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id uuid NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.users_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    id uuid NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254),
    email_confirmed boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    location character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    avatar character varying(4000)
);


ALTER TABLE public.users_user OWNER TO django;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO django;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO django;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO django;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO django;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add User	6	add_user
22	Can change User	6	change_user
23	Can delete User	6	delete_user
24	Can view User	6	view_user
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add crag	8	add_crag
30	Can change crag	8	change_crag
31	Can delete crag	8	delete_crag
32	Can view crag	8	view_crag
33	Can add route	9	add_route
34	Can change route	9	change_route
35	Can delete route	9	delete_route
36	Can view route	9	view_route
37	Can add sector	10	add_sector
38	Can change sector	10	change_sector
39	Can delete sector	10	delete_sector
40	Can view sector	10	view_sector
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: climb_crag; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.climb_crag (id, name, description, latitude, longitude, city, province, pub_date, mod_date, owner_id) FROM stdin;
c3f86c4b-3922-48d5-bdfc-90f2f49ae754	Alange	Tal vez, Alange sea la escuela más interesante de Extremadura. Con más de 140 vías, en su mayoría de sexto grado, es una escuela donde encontraremos vías de hasta 30 metros y alguna de 2 largos.	38.787386	-6.266282	Alange	Badajoz	2019-11-19 17:19:12.30098+00	2019-11-19 17:19:12.300991+00	e6c53b30-bde3-4c92-913e-add01b2f9823
dcef235f-173c-42fc-922b-65d4cf5019b0	Alafacar	Esta escuela está situada en la Sierra de Alfaguara junto al pueblo de Alfacar, que a su vez está al lado de Granada, con más de 300 vías para todos los gustos. Podemos encontrar desde terceros...	37.267606	-3.530621	Alfacar	Granada	2019-11-21 09:08:02.09446+00	2019-11-21 09:08:02.094472+00	e6c53b30-bde3-4c92-913e-add01b2f9823
e4208013-af63-4402-a706-6c30ef9df6d0	Cerro del Hierro	Lugar muy particulares para la practica de la escalada. Una roca calcárea de especial e incomparable morfología hará que el escalador disfrute de su actiidad en u entorno único.	37.955710	-5.624549	San Nicolás del Puerto	Sevilla	2019-11-21 09:23:23.899311+00	2019-11-21 09:23:23.899325+00	e6c53b30-bde3-4c92-913e-add01b2f9823
3e3667c5-1d46-4fc9-82ba-5ae2d214371c	Chulilla	Chulilla es una de las mejores zonas de escalada de España, conocida por su impresionante cañón de roca caliza formado por el río Turia. Encontraremos cientos de vías de escalada deportiva.	39.654048	-0.892441	Chulilla	Valencia	2019-11-21 10:24:31.921008+00	2019-11-21 10:24:31.921018+00	e6c53b30-bde3-4c92-913e-add01b2f9823
ac0bb732-edf6-49fc-bb94-5c542bead894	Jucar	Los sectores más tradicionales y concurridos de la escuela y los que albergan un mayor número de rutas. Aquí es donde se inició todo, y aquí es donde se sigue desarrollando la actividad.	40.030001	-2.019269	Cuenca	Cuenca	2019-11-21 10:48:23.506607+00	2019-11-21 10:48:23.506623+00	e6c53b30-bde3-4c92-913e-add01b2f9823
ed6d734d-d265-400d-864b-2df5150dda45	La Hermida	En la zona vamos a encontrar todo tipo de escalada en una caliza de extraordinaria calidad. Existen multitud de sectores como Rumenes, El Infierno o Urdón.	43.252442	-4.601604	La Hermida	Asturias	2019-11-21 11:09:42.74708+00	2019-11-21 11:09:42.7471+00	e6c53b30-bde3-4c92-913e-add01b2f9823
\.


--
-- Data for Name: climb_route; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.climb_route (id, name, description, grade, rating, height, nanchor, anchor_type, lowering_station, pith, feature, photo, pub_date, mod_date, owner_id, sector_id_id) FROM stdin;
46581433-78c9-44cb-b207-b29bb20b862a	Pablok		6a	3	15	7			\N			2019-11-19 17:25:07.830508+00	2019-11-19 17:25:07.830519+00	e6c53b30-bde3-4c92-913e-add01b2f9823	cef71371-8d17-4d06-91e9-7d920f3dfb2c
234cea28-8fcf-4958-b508-7a2e51df89aa	Métele que se mueve		6a+	1	20	6			\N			2019-11-19 17:36:06.637895+00	2019-11-19 17:36:06.637906+00	e6c53b30-bde3-4c92-913e-add01b2f9823	cef71371-8d17-4d06-91e9-7d920f3dfb2c
7961e18f-13d1-4d21-a33a-90b6cea744f4	Verdi		6b+	2	20	6			\N			2019-11-19 17:36:37.462373+00	2019-11-19 17:36:37.462383+00	\N	cef71371-8d17-4d06-91e9-7d920f3dfb2c
8c624892-cdd0-451b-a318-274707f0e9c2	Saricuecano		6a	2	20	5			\N			2019-11-21 09:10:35.980946+00	2019-11-21 09:10:35.981+00	e6c53b30-bde3-4c92-913e-add01b2f9823	85216068-1431-4ec9-aa8e-e8cd5953c2ee
c547d2ff-8146-4c9a-bd50-4771890c7508	El duro		6a+	3	25	9			\N			2019-11-21 09:10:54.382798+00	2019-11-21 09:10:54.382813+00	\N	85216068-1431-4ec9-aa8e-e8cd5953c2ee
b94ca7b3-6cea-42ce-a8ae-d09955f21c1d	La peseta		6c	4	25	7			\N			2019-11-21 09:11:17.945528+00	2019-11-21 09:11:17.945553+00	\N	85216068-1431-4ec9-aa8e-e8cd5953c2ee
31dc071d-42b2-4d2d-9328-15ad4755ccef	Búho		6b	4	20	5			\N			2019-11-21 09:14:11.826984+00	2019-11-21 09:14:11.826999+00	\N	979db781-5304-4faa-82b1-ff2ce0350b9b
9b75fe64-dd20-41d6-9c4d-d9e203c04e70	La Raimunda		6c	4	35	9			\N			2019-11-21 09:14:35.380302+00	2019-11-21 09:14:35.380322+00	\N	979db781-5304-4faa-82b1-ff2ce0350b9b
39d5fa41-43e5-4497-9f84-026bb33e9e6e	El crusaito		6b	5	30	9			\N			2019-11-21 09:14:58.516966+00	2019-11-21 09:14:58.516984+00	\N	979db781-5304-4faa-82b1-ff2ce0350b9b
4089cff0-97a8-49e8-a424-2b94c592154e	Mari Pili		6b	2	20	8			\N			2019-11-21 09:30:24.932121+00	2019-11-21 09:30:24.932135+00	\N	380b29bc-206e-4b89-a474-affae5b776d9
2179e85e-734e-45c6-a474-5a10b2a2d9b0	Directa al paro		6a	2	15	6			\N			2019-11-21 09:30:47.607661+00	2019-11-21 09:30:47.607711+00	\N	380b29bc-206e-4b89-a474-affae5b776d9
f4327e29-5af4-4d11-b09f-8f2832f60f28	Chaparron en el Espolón		7a	4	25	\N			\N			2019-11-21 09:31:23.215678+00	2019-11-21 09:31:23.2157+00	\N	380b29bc-206e-4b89-a474-affae5b776d9
b5e86d3e-c62a-4816-a1d3-e9a052e4f313	Kaos Cósmico		6a	5	45	12			\N			2019-11-21 10:26:57.117396+00	2019-11-21 10:26:57.117432+00	\N	32ea74d1-593c-48f3-bc55-52c14ecb5e87
704d7512-75ea-4017-b5e4-61ce315e6f30	El club de la ducha		7b	4	30	12			\N			2019-11-21 10:27:22.743561+00	2019-11-21 10:27:22.743572+00	\N	32ea74d1-593c-48f3-bc55-52c14ecb5e87
9b234eb0-ecf3-4643-800f-5c5c937e91c2	Maquillaje mental		6b+	5	32	13			\N			2019-11-21 10:27:44.503147+00	2019-11-21 10:27:44.50316+00	\N	32ea74d1-593c-48f3-bc55-52c14ecb5e87
7d244071-2b72-4043-ac13-b1f471c219d9	El ratoncito Pérez		6c	1	30	6			\N			2019-11-21 10:53:52.67239+00	2019-11-21 10:53:52.6724+00	\N	907a06ca-8add-4380-b007-e09f34a138bc
72f1f1cc-d12d-401a-96f0-fe04293fd965	Mi pequeña bolchevique		7b	3	20	7			\N			2019-11-21 10:54:08.473688+00	2019-11-21 10:54:08.473703+00	\N	907a06ca-8add-4380-b007-e09f34a138bc
4a5c4357-1c62-4979-9a81-762732e7c845	Gandalf el Gris		6c+	3	25	6			\N			2019-11-21 10:54:24.791277+00	2019-11-21 10:54:24.791293+00	\N	907a06ca-8add-4380-b007-e09f34a138bc
cfd590c3-7083-4aae-8e65-eb026e8db6af	El regurjito		6a+	1	25	6			\N			2019-11-21 10:56:25.034909+00	2019-11-21 10:56:25.034919+00	\N	838ab903-499c-4a11-bf62-79f7b209d130
50056dd9-d4f7-4d9d-a52d-5a7c639a75b9	Perro sarnoso		6b+	3	25	9			\N			2019-11-21 10:56:42.508323+00	2019-11-21 10:56:42.508337+00	\N	838ab903-499c-4a11-bf62-79f7b209d130
34f68192-c051-4857-bf7d-8db559b6c636	El tiempo incierto		7b	4	30	12			\N			2019-11-21 10:57:08.821326+00	2019-11-21 10:57:08.821345+00	\N	838ab903-499c-4a11-bf62-79f7b209d130
5fdb2b8e-05f0-433d-bb1e-7de318b52e1a	San Cuenco		7c	3	30	13			\N			2019-11-21 10:57:31.410805+00	2019-11-21 10:57:31.410817+00	\N	838ab903-499c-4a11-bf62-79f7b209d130
bfdd4b80-c60e-4f50-ac21-ddd9f77b0f1f	La Perla Negra		7b+	5	30	9			\N			2019-11-21 11:12:49.54842+00	2019-11-21 11:12:49.548459+00	\N	3f8d64ba-2232-4e6d-9c94-68d70cb28e35
4bc7943a-3b49-4495-b1d4-2990bb6337cf	Viñarock		7a+	4	30	13			\N			2019-11-21 11:13:12.427787+00	2019-11-21 11:13:12.427797+00	\N	3f8d64ba-2232-4e6d-9c94-68d70cb28e35
773c4548-ab5a-41be-af6e-43029124fc3d	Tubular Hell		7b+	5	32	13			\N			2019-11-21 11:13:41.388897+00	2019-11-21 11:13:41.388923+00	\N	3f8d64ba-2232-4e6d-9c94-68d70cb28e35
939b5099-937b-4d38-b495-25e244e39a01	Mirada felina		8a	5	30	12			\N			2019-11-21 11:17:45.081957+00	2019-11-21 11:17:45.082001+00	\N	af8978a9-1868-4163-b27d-fbafa1d9f296
b1ad8aea-b75a-4224-a824-81f632cc4d2c	Plataforma		7c	5	45	13			\N			2019-11-21 11:18:03.540045+00	2019-11-21 11:18:03.540092+00	\N	af8978a9-1868-4163-b27d-fbafa1d9f296
8d8efdba-94ec-45e0-baa3-886c306605cb	Mar Negro		7b+	4	30	12			\N			2019-11-21 11:18:26.045601+00	2019-11-21 11:18:26.045618+00	\N	af8978a9-1868-4163-b27d-fbafa1d9f296
\.


--
-- Data for Name: climb_sector; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.climb_sector (id, name, description, parking_coordinates, latitude, longitude, orientation, picture, approach, rope, warning, warning_text, pub_date, mod_date, rock_type, crag_id_id, owner_id) FROM stdin;
cef71371-8d17-4d06-91e9-7d920f3dfb2c	Aparcamiento	Sector de sombra por la mañana en verano y prácticamente sombra todo el día en invierno	38.787386, -6.266282	38.787386	-6.266282	S	media/Screenshot_from_2019-11-19_18-23-16.png	Recorrer 50m desde el aparcamiento hasta avistar un camino de pendiente.	40	t	Prohibido escalar desde el 1 de enero hasta el 30 de junio	2019-11-19 17:24:42.457832+00	2019-11-19 17:24:42.457845+00	Caliza	c3f86c4b-3922-48d5-bdfc-90f2f49ae754	e6c53b30-bde3-4c92-913e-add01b2f9823
85216068-1431-4ec9-aa8e-e8cd5953c2ee	La Moneda	Es el primero de los sectores, Actualmene en expansión, ha estado abandonado durante años. La escalada es explosiva sobre placa desplomada.	37.257376, -3.552495	37.256727	-3.551294	E	media/Screenshot_from_2019-11-21_10-09-35.png		40	f		2019-11-21 09:10:12.462033+00	2019-11-21 09:10:12.462106+00	Granito	dcef235f-173c-42fc-922b-65d4cf5019b0	\N
979db781-5304-4faa-82b1-ff2ce0350b9b	La Solana	Vías largas de escalada variada y técnica. Corre aire en el sector en invierno pero es ideal para el verano incluso con calor.	37.261415, -3.545428	37.261371	-3.542367	N	media/Screenshot_from_2019-11-21_10-12-53.png		35	f		2019-11-21 09:13:16.633539+00	2019-11-21 09:13:16.633551+00	Pizarra	dcef235f-173c-42fc-922b-65d4cf5019b0	e6c53b30-bde3-4c92-913e-add01b2f9823
380b29bc-206e-4b89-a474-affae5b776d9	Las Marujas	Sector las marujas con 9 vías desde 6a hasta 7a	37.954817, -5.625119	37.945624	-5.612945	N	media/Screenshot_from_2019-11-21_10-25-02.png		50	f		2019-11-21 09:29:54.084087+00	2019-11-21 09:29:54.084099+00	Caliza	e4208013-af63-4402-a706-6c30ef9df6d0	e6c53b30-bde3-4c92-913e-add01b2f9823
32ea74d1-593c-48f3-bc55-52c14ecb5e87	Peñeta	Sector mas comercial de Chulilla	39.656512, -0.893236	39.655455	-0.895714	NE	media/Screenshot_from_2019-11-21_11-24-46.png		60	f		2019-11-21 10:26:28.522141+00	2019-11-21 10:26:28.522153+00	Caliza	3e3667c5-1d46-4fc9-82ba-5ae2d214371c	e6c53b30-bde3-4c92-913e-add01b2f9823
907a06ca-8add-4380-b007-e09f34a138bc	Bolo	Placas técnicas sobre una roca excepcional y agarres entre pequeños y muy pequeños por lo general. Alturas de no mucho más de 20 m en el lado izquierdo, y más largas desde A la vanguardia del tercer mundo hacia la derecha. Líneas atractivas y exigentes donde hará falta algo más que fuerza para triunfar. Vías para escalar con temperaturas frescas.	40.019863, -2.038759	40.020149	-2.025018	E	media/Screenshot_from_2019-11-21_11-49-25.png		48	t	Aparcar bien el coche para dejar pasar los tractores.	2019-11-21 10:50:05.273487+00	2019-11-21 10:50:05.273497+00	Granito	ac0bb732-edf6-49fc-bb94-5c542bead894	e6c53b30-bde3-4c92-913e-add01b2f9823
838ab903-499c-4a11-bf62-79f7b209d130	Colmenas	Sector popular, aunque no por ello acostumbra a masificarse, debido probablemente a que si hace mucho calor, aquí no hay quien escale, y a que el tipo de escalada es muy exigente para los dedos. Sus vías discurren por placas naranjas, y un puñado de ellas surca algunos de los mejores muros de Cuenca. Roca anaranjada con franjas grises y recorridos que alcanzan los 25 m, habitualmente de placas y muros desplomados de resistencia.	40.029235, -2.017645	40.034402	-2.020642	SE	media/Screenshot_from_2019-11-21_11-55-24.png		60	f		2019-11-21 10:55:40.876754+00	2019-11-21 10:55:40.876768+00	Caliza	ac0bb732-edf6-49fc-bb94-5c542bead894	e6c53b30-bde3-4c92-913e-add01b2f9823
3f8d64ba-2232-4e6d-9c94-68d70cb28e35	Rumenes	Una buena opción se ubica cerca del pueblo de Rumenes, lo complicado de este enclave es encontrar la entrada al parking, ya que se encuentra resguardado entre árboles y no se divisa fácilmente desde la carretera. Si llegamos desde la Hermida, tras haber pasado el Mirador del Salmón y el de Urdón, a 1 km aproximadamente antes de llegar al parking del sector de escalada de Rumenes, aparece un puente romano muy estrecho a mano derecha.	43.253903, -4.597295	43.255580	-4.598762	SE	media/Screenshot_from_2019-11-21_12-11-51.png		80	f		2019-11-21 11:12:27.466645+00	2019-11-21 11:12:27.466655+00	Caliza	ed6d734d-d265-400d-864b-2df5150dda45	\N
af8978a9-1868-4163-b27d-fbafa1d9f296	Cicera	Desde hace 20 años la pared del río Cicera es uno de los principales escenarios de la escalada deportiva en Cantabria y  la escuela es una de las joyas de la guía nueva	43.251213, -4.619086	43.249916	-4.619461	N	media/Screenshot_from_2019-11-21_12-15-33.png		80	f		2019-11-21 11:17:19.605885+00	2019-11-21 11:17:19.605896+00	Granito	ed6d734d-d265-400d-864b-2df5150dda45	e6c53b30-bde3-4c92-913e-add01b2f9823
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-11-19 17:19:12.301614+00	c3f86c4b-3922-48d5-bdfc-90f2f49ae754	Alange	1	[{"added": {}}]	8	e6c53b30-bde3-4c92-913e-add01b2f9823
2	2019-11-19 17:24:42.458425+00	cef71371-8d17-4d06-91e9-7d920f3dfb2c	Aparcamiento	1	[{"added": {}}]	10	e6c53b30-bde3-4c92-913e-add01b2f9823
3	2019-11-19 17:25:07.831307+00	46581433-78c9-44cb-b207-b29bb20b862a	Pablok	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
4	2019-11-19 17:36:06.638328+00	234cea28-8fcf-4958-b508-7a2e51df89aa	Métele que se mueve	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
5	2019-11-19 17:36:37.462863+00	7961e18f-13d1-4d21-a33a-90b6cea744f4	Verdi	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
6	2019-11-21 09:08:02.094885+00	dcef235f-173c-42fc-922b-65d4cf5019b0	Alafacar	1	[{"added": {}}]	8	e6c53b30-bde3-4c92-913e-add01b2f9823
7	2019-11-21 09:10:12.464425+00	85216068-1431-4ec9-aa8e-e8cd5953c2ee	La Moneda	1	[{"added": {}}]	10	e6c53b30-bde3-4c92-913e-add01b2f9823
8	2019-11-21 09:10:36.007539+00	8c624892-cdd0-451b-a318-274707f0e9c2	Saricuecano	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
9	2019-11-21 09:10:54.383273+00	c547d2ff-8146-4c9a-bd50-4771890c7508	El duro	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
10	2019-11-21 09:11:17.946513+00	b94ca7b3-6cea-42ce-a8ae-d09955f21c1d	La peseta	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
11	2019-11-21 09:13:16.634139+00	979db781-5304-4faa-82b1-ff2ce0350b9b	La Solana	1	[{"added": {}}]	10	e6c53b30-bde3-4c92-913e-add01b2f9823
12	2019-11-21 09:14:11.82758+00	31dc071d-42b2-4d2d-9328-15ad4755ccef	Búho	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
13	2019-11-21 09:14:35.380937+00	9b75fe64-dd20-41d6-9c4d-d9e203c04e70	La Raimunda	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
14	2019-11-21 09:14:58.517499+00	39d5fa41-43e5-4497-9f84-026bb33e9e6e	El crusaito	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
15	2019-11-21 09:23:23.899758+00	e4208013-af63-4402-a706-6c30ef9df6d0	Cerro del Hierro	1	[{"added": {}}]	8	e6c53b30-bde3-4c92-913e-add01b2f9823
16	2019-11-21 09:29:54.084572+00	380b29bc-206e-4b89-a474-affae5b776d9	Las Marujas	1	[{"added": {}}]	10	e6c53b30-bde3-4c92-913e-add01b2f9823
17	2019-11-21 09:30:24.932698+00	4089cff0-97a8-49e8-a424-2b94c592154e	Mari Pili	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
18	2019-11-21 09:30:47.609803+00	2179e85e-734e-45c6-a474-5a10b2a2d9b0	Directa al paro	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
19	2019-11-21 09:31:23.216358+00	f4327e29-5af4-4d11-b09f-8f2832f60f28	Chaparron en el Espolón	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
20	2019-11-21 10:24:31.921545+00	3e3667c5-1d46-4fc9-82ba-5ae2d214371c	Chulilla	1	[{"added": {}}]	8	e6c53b30-bde3-4c92-913e-add01b2f9823
21	2019-11-21 10:26:28.522592+00	32ea74d1-593c-48f3-bc55-52c14ecb5e87	Peñeta	1	[{"added": {}}]	10	e6c53b30-bde3-4c92-913e-add01b2f9823
22	2019-11-21 10:26:57.119686+00	b5e86d3e-c62a-4816-a1d3-e9a052e4f313	Kaos Cósmico	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
23	2019-11-21 10:27:22.74392+00	704d7512-75ea-4017-b5e4-61ce315e6f30	El club de la ducha	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
24	2019-11-21 10:27:44.503584+00	9b234eb0-ecf3-4643-800f-5c5c937e91c2	Maquillaje mental	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
25	2019-11-21 10:35:01.117616+00	574ea746-6d98-4044-84c9-cb2ce79d2ca6	test@test.com	3		6	e6c53b30-bde3-4c92-913e-add01b2f9823
26	2019-11-21 10:48:23.507243+00	ac0bb732-edf6-49fc-bb94-5c542bead894	Jucar	1	[{"added": {}}]	8	e6c53b30-bde3-4c92-913e-add01b2f9823
27	2019-11-21 10:50:05.273876+00	907a06ca-8add-4380-b007-e09f34a138bc	Bolo	1	[{"added": {}}]	10	e6c53b30-bde3-4c92-913e-add01b2f9823
28	2019-11-21 10:53:52.67286+00	7d244071-2b72-4043-ac13-b1f471c219d9	El ratoncito Pérez	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
29	2019-11-21 10:54:08.474287+00	72f1f1cc-d12d-401a-96f0-fe04293fd965	Mi pequeña bolchevique	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
30	2019-11-21 10:54:24.791922+00	4a5c4357-1c62-4979-9a81-762732e7c845	Gandalf el Gris	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
31	2019-11-21 10:55:40.877414+00	838ab903-499c-4a11-bf62-79f7b209d130	Colmenas	1	[{"added": {}}]	10	e6c53b30-bde3-4c92-913e-add01b2f9823
32	2019-11-21 10:56:25.035275+00	cfd590c3-7083-4aae-8e65-eb026e8db6af	El regurjito	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
33	2019-11-21 10:56:42.508802+00	50056dd9-d4f7-4d9d-a52d-5a7c639a75b9	Perro sarnoso	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
34	2019-11-21 10:57:08.822047+00	34f68192-c051-4857-bf7d-8db559b6c636	El tiempo incierto	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
35	2019-11-21 10:57:31.41135+00	5fdb2b8e-05f0-433d-bb1e-7de318b52e1a	San Cuenco	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
36	2019-11-21 11:09:42.747885+00	ed6d734d-d265-400d-864b-2df5150dda45	La Hermida	1	[{"added": {}}]	8	e6c53b30-bde3-4c92-913e-add01b2f9823
37	2019-11-21 11:12:27.467034+00	3f8d64ba-2232-4e6d-9c94-68d70cb28e35	Rumenes	1	[{"added": {}}]	10	e6c53b30-bde3-4c92-913e-add01b2f9823
38	2019-11-21 11:12:49.549449+00	bfdd4b80-c60e-4f50-ac21-ddd9f77b0f1f	La Perla Negra	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
39	2019-11-21 11:13:12.428142+00	4bc7943a-3b49-4495-b1d4-2990bb6337cf	Viñarock	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
40	2019-11-21 11:13:41.38959+00	773c4548-ab5a-41be-af6e-43029124fc3d	Tubular Hell	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
41	2019-11-21 11:17:19.606353+00	af8978a9-1868-4163-b27d-fbafa1d9f296	Cicera	1	[{"added": {}}]	10	e6c53b30-bde3-4c92-913e-add01b2f9823
42	2019-11-21 11:17:45.083769+00	939b5099-937b-4d38-b495-25e244e39a01	Mirada felina	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
43	2019-11-21 11:18:03.54196+00	b1ad8aea-b75a-4224-a824-81f632cc4d2c	Plataforma	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
44	2019-11-21 11:18:26.046136+00	8d8efdba-94ec-45e0-baa3-886c306605cb	Mar Negro	1	[{"added": {}}]	9	e6c53b30-bde3-4c92-913e-add01b2f9823
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 44, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	authtoken	token
8	climb	crag
9	climb	route
10	climb	sector
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-11-19 16:29:08.384572+00
2	contenttypes	0002_remove_content_type_name	2019-11-19 16:29:08.397914+00
3	auth	0001_initial	2019-11-19 16:29:08.433254+00
4	auth	0002_alter_permission_name_max_length	2019-11-19 16:29:08.498964+00
5	auth	0003_alter_user_email_max_length	2019-11-19 16:29:08.505018+00
6	auth	0004_alter_user_username_opts	2019-11-19 16:29:08.510686+00
7	auth	0005_alter_user_last_login_null	2019-11-19 16:29:08.515208+00
8	auth	0006_require_contenttypes_0002	2019-11-19 16:29:08.516784+00
9	auth	0007_alter_validators_add_error_messages	2019-11-19 16:29:08.521115+00
10	auth	0008_alter_user_username_max_length	2019-11-19 16:29:08.526118+00
11	auth	0009_alter_user_last_name_max_length	2019-11-19 16:29:08.530791+00
12	auth	0010_alter_group_name_max_length	2019-11-19 16:29:08.535368+00
13	auth	0011_update_proxy_permissions	2019-11-19 16:29:08.543052+00
14	users	0001_initial	2019-11-19 16:29:08.590255+00
15	admin	0001_initial	2019-11-19 16:29:08.713647+00
16	admin	0002_logentry_remove_auto_add	2019-11-19 16:29:08.769316+00
17	admin	0003_logentry_add_action_flag_choices	2019-11-19 16:29:08.785016+00
18	authtoken	0001_initial	2019-11-19 16:29:08.809901+00
19	authtoken	0002_auto_20160226_1747	2019-11-19 16:29:08.855447+00
20	sessions	0001_initial	2019-11-19 16:29:08.868831+00
21	users	0002_auto_20191119_1651	2019-11-19 16:51:08.837138+00
22	climb	0001_initial	2019-11-19 17:01:04.635116+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
yafgmdyj73b4rb4fd71gop7m7bht8fan	MjY3MmJhNGNlOTRhMTA0MjM0YWEyNjEwNDRhMmI1N2FjYWM4ZDk2YTp7Il9hdXRoX3VzZXJfaWQiOiJlNmM1M2IzMC1iZGUzLTRjOTItOTEzZS1hZGQwMWIyZjk4MjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImNiZmIzNDVlNDhjYmFiNmVjMzYzNWI5MmMzMjdiNzEzNzIzYzk3NWUifQ==	2019-12-03 16:29:44.896531+00
jpebhw7stb1g9hmxz5n0w24mim9y43q2	MjY3MmJhNGNlOTRhMTA0MjM0YWEyNjEwNDRhMmI1N2FjYWM4ZDk2YTp7Il9hdXRoX3VzZXJfaWQiOiJlNmM1M2IzMC1iZGUzLTRjOTItOTEzZS1hZGQwMWIyZjk4MjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImNiZmIzNDVlNDhjYmFiNmVjMzYzNWI5MmMzMjdiNzEzNzIzYzk3NWUifQ==	2019-12-03 17:03:22.300213+00
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_user (password, last_login, is_superuser, id, first_name, last_name, email, email_confirmed, is_staff, is_active, date_joined, location, company_name, avatar) FROM stdin;
pbkdf2_sha256$150000$2WVbuGSZ3Ccy$LyAAqUw3znMHGhNGUDASjaV8LJ5f0671OCQRxeLYEB0=	2019-11-19 17:03:22.29867+00	t	e6c53b30-bde3-4c92-913e-add01b2f9823	Antonio	Galindo	admin@test.com	f	t	t	2019-11-19 16:29:21.082509+00	Sevilla		
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: climb_crag_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.climb_crag
    ADD CONSTRAINT climb_crag_pkey PRIMARY KEY (id);


--
-- Name: climb_route_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.climb_route
    ADD CONSTRAINT climb_route_pkey PRIMARY KEY (id);


--
-- Name: climb_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.climb_sector
    ADD CONSTRAINT climb_sector_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: climb_crag_owner_id_9f7574ac; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX climb_crag_owner_id_9f7574ac ON public.climb_crag USING btree (owner_id);


--
-- Name: climb_route_owner_id_3efd4756; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX climb_route_owner_id_3efd4756 ON public.climb_route USING btree (owner_id);


--
-- Name: climb_route_sector_id_id_2fb714cf; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX climb_route_sector_id_id_2fb714cf ON public.climb_route USING btree (sector_id_id);


--
-- Name: climb_sector_crag_id_id_309d0f8c; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX climb_sector_crag_id_id_309d0f8c ON public.climb_sector USING btree (crag_id_id);


--
-- Name: climb_sector_owner_id_6ea945fe; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX climb_sector_owner_id_6ea945fe ON public.climb_sector USING btree (owner_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: climb_crag_owner_id_9f7574ac_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.climb_crag
    ADD CONSTRAINT climb_crag_owner_id_9f7574ac_fk_users_user_id FOREIGN KEY (owner_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: climb_route_owner_id_3efd4756_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.climb_route
    ADD CONSTRAINT climb_route_owner_id_3efd4756_fk_users_user_id FOREIGN KEY (owner_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: climb_route_sector_id_id_2fb714cf_fk_climb_sector_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.climb_route
    ADD CONSTRAINT climb_route_sector_id_id_2fb714cf_fk_climb_sector_id FOREIGN KEY (sector_id_id) REFERENCES public.climb_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: climb_sector_crag_id_id_309d0f8c_fk_climb_crag_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.climb_sector
    ADD CONSTRAINT climb_sector_crag_id_id_309d0f8c_fk_climb_crag_id FOREIGN KEY (crag_id_id) REFERENCES public.climb_crag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: climb_sector_owner_id_6ea945fe_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.climb_sector
    ADD CONSTRAINT climb_sector_owner_id_6ea945fe_fk_users_user_id FOREIGN KEY (owner_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

