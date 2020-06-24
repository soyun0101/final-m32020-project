--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
1	8	5	1300
2	10	1	1000
3	11	1	1000
4	12	1	1000
5	13	1	1000
6	14	1	1000
7	15	1	1000
8	16	1	1000
9	17	1	1000
10	18	1	1000
11	19	1	1000
12	20	1	1000
13	21	1	1000
14	22	1	1000
15	23	1	1000
16	24	1	1000
17	25	1	1000
18	26	1	1000
19	27	1	1000
20	28	1	1000
21	29	1	1000
22	30	1	1000
23	31	1	1000
24	32	1	1000
25	39	2	1200
26	40	2	1200
27	41	2	1200
28	42	2	1200
29	43	2	1200
30	44	2	1200
31	55	2	1200
32	56	2	1200
33	57	1	1000
34	58	1	1000
35	59	1	1000
36	60	1	1000
37	61	5	1300
38	62	4	1000
39	63	4	1000
40	64	3	1200
41	65	3	1200
42	66	2	1200
43	67	2	1200
44	68	2	1200
45	69	2	1200
46	70	1	1000
47	71	1	1000
48	72	1	1000
49	73	2	1200
50	74	1	1000
51	75	2	1200
52	76	2	1200
53	77	1	1000
54	78	1	1000
55	79	2	1200
56	80	1	1000
57	81	2	1200
58	82	2	1200
59	83	1	1000
60	84	2	1200
61	85	1	1000
62	86	2	1200
63	87	2	1200
64	88	2	1200
65	89	1	1000
66	90	1	1000
67	91	1	1000
68	92	3	1200
69	93	1	1000
70	94	3	1200
71	95	1	1000
72	96	2	1200
73	97	2	1200
74	98	3	1200
75	99	1	1000
76	100	1	1000
77	101	2	1200
78	102	3	1200
79	103	1	1000
80	104	2	1200
81	105	5	1300
82	106	6	900
83	107	1	1000
84	108	1	1000
85	109	2	1200
86	110	1	1000
87	111	2	1200
88	112	1	1000
89	113	1	1000
90	114	1	1000
91	115	1	1000
92	116	1	1000
93	117	1	1000
94	118	1	1000
95	119	1	1000
96	120	2	1200
97	121	1	1000
98	122	1	1000
99	123	1	1000
100	124	1	1000
101	125	3	1200
102	126	1	1000
103	127	1	1000
104	128	1	1000
105	129	1	1000
106	130	3	1200
107	131	1	1000
108	132	1	1000
109	133	1	1000
110	134	1	1000
111	135	2	1200
112	136	1	1000
113	137	3	1200
114	138	1	1000
115	139	4	1000
116	140	5	1300
117	141	6	900
118	142	2	1200
119	143	2	1200
120	144	1	1000
121	145	2	1200
122	146	2	1200
123	147	4	1000
124	148	1	1000
125	149	1	1000
126	150	2	1200
127	151	1	1000
128	152	2	1200
129	153	3	1200
130	154	1	1000
131	155	1	1000
132	156	1	1000
133	157	2	1200
134	158	2	1200
135	159	1	1000
136	160	3	1200
137	161	1	1000
138	162	1	1000
139	163	1	1000
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
1	2020-06-11 21:15:53.718205-07
2	2020-06-12 14:02:22.51448-07
3	2020-06-12 14:13:55.692761-07
4	2020-06-12 14:15:25.364839-07
5	2020-06-12 14:17:05.568786-07
6	2020-06-12 14:29:09.784206-07
7	2020-06-12 14:30:54.18337-07
8	2020-06-12 14:31:35.839575-07
9	2020-06-12 15:27:05.458259-07
10	2020-06-12 15:28:02.574691-07
11	2020-06-12 15:28:54.671167-07
12	2020-06-12 15:29:26.721978-07
13	2020-06-12 15:33:35.955854-07
14	2020-06-12 15:34:31.950554-07
15	2020-06-12 15:35:09.40899-07
16	2020-06-12 15:35:58.37864-07
17	2020-06-12 15:37:08.680857-07
18	2020-06-12 15:38:25.5135-07
19	2020-06-12 15:39:39.616628-07
20	2020-06-12 15:41:51.77718-07
21	2020-06-12 15:42:34.688124-07
22	2020-06-12 15:44:01.101729-07
23	2020-06-12 15:44:55.373156-07
24	2020-06-12 15:46:33.060643-07
25	2020-06-12 15:47:03.075022-07
26	2020-06-12 15:47:40.551019-07
27	2020-06-12 15:52:02.984459-07
28	2020-06-12 15:52:33.284261-07
29	2020-06-12 15:53:24.103648-07
30	2020-06-12 15:55:50.964867-07
31	2020-06-12 15:58:31.269134-07
32	2020-06-12 15:59:02.23638-07
33	2020-06-13 10:16:46.865459-07
34	2020-06-13 10:19:15.84344-07
35	2020-06-13 10:31:38.372377-07
36	2020-06-13 10:33:22.189707-07
37	2020-06-13 10:34:05.369126-07
38	2020-06-13 10:35:21.123722-07
39	2020-06-13 10:36:13.337054-07
40	2020-06-13 10:40:57.154989-07
41	2020-06-13 10:41:26.220255-07
42	2020-06-13 10:42:03.070801-07
43	2020-06-13 10:43:32.44219-07
44	2020-06-13 10:59:44.201874-07
45	2020-06-13 11:26:29.3751-07
46	2020-06-13 11:27:04.648744-07
47	2020-06-13 11:29:40.507063-07
48	2020-06-13 11:30:23.823493-07
49	2020-06-13 11:39:20.320475-07
50	2020-06-13 12:15:03.40489-07
51	2020-06-13 12:15:39.458667-07
52	2020-06-13 13:14:38.786316-07
53	2020-06-13 13:28:43.131095-07
54	2020-06-13 13:42:19.390945-07
55	2020-06-13 13:46:59.125164-07
56	2020-06-13 13:48:27.479384-07
57	2020-06-13 13:51:16.258888-07
58	2020-06-13 13:53:42.304957-07
59	2020-06-13 13:54:20.110664-07
60	2020-06-13 13:55:20.039062-07
61	2020-06-16 19:10:26.104252-07
62	2020-06-16 19:17:25.571183-07
63	2020-06-16 19:17:50.483775-07
64	2020-06-16 19:27:10.174992-07
65	2020-06-16 19:29:15.582768-07
66	2020-06-16 19:30:06.755684-07
67	2020-06-16 19:30:54.709085-07
68	2020-06-16 19:35:00.458812-07
69	2020-06-16 19:35:27.998837-07
70	2020-06-16 19:51:19.788201-07
71	2020-06-18 19:59:25.865291-07
72	2020-06-18 20:06:32.018778-07
73	2020-06-18 20:06:52.974337-07
74	2020-06-18 20:09:34.316647-07
75	2020-06-18 20:12:45.272207-07
76	2020-06-18 20:12:46.63011-07
77	2020-06-18 20:13:11.088904-07
78	2020-06-18 20:14:25.92004-07
79	2020-06-18 20:14:36.473448-07
80	2020-06-18 20:18:08.554499-07
81	2020-06-18 20:18:45.981569-07
82	2020-06-18 20:19:02.736319-07
83	2020-06-18 21:05:37.372254-07
84	2020-06-18 21:05:50.097693-07
85	2020-06-18 21:07:01.12193-07
86	2020-06-18 21:07:07.601386-07
87	2020-06-18 21:08:21.817091-07
88	2020-06-18 21:09:55.265294-07
89	2020-06-18 21:10:02.47395-07
90	2020-06-18 21:14:08.423091-07
91	2020-06-18 21:14:16.863587-07
92	2020-06-18 21:14:25.470662-07
93	2020-06-18 21:15:21.751603-07
94	2020-06-18 21:15:28.904619-07
95	2020-06-18 21:16:57.961738-07
96	2020-06-18 21:17:09.920488-07
97	2020-06-18 21:17:39.640482-07
98	2020-06-20 10:09:24.183875-07
99	2020-06-20 10:09:35.569396-07
100	2020-06-20 10:15:37.566575-07
101	2020-06-20 10:15:45.688297-07
102	2020-06-20 10:16:11.182329-07
103	2020-06-20 10:51:26.484974-07
104	2020-06-20 10:51:33.396001-07
105	2020-06-20 10:51:39.945361-07
106	2020-06-20 10:51:55.349459-07
107	2020-06-20 10:52:03.48419-07
108	2020-06-20 11:09:25.360181-07
109	2020-06-20 11:09:30.553412-07
110	2020-06-20 11:10:06.375989-07
111	2020-06-20 11:10:11.125953-07
112	2020-06-20 11:27:09.283755-07
113	2020-06-20 11:27:09.755496-07
114	2020-06-20 11:27:10.518077-07
115	2020-06-20 12:30:44.442005-07
116	2020-06-20 13:04:25.781866-07
117	2020-06-20 13:18:13.961137-07
118	2020-06-20 13:35:21.145919-07
119	2020-06-20 13:36:59.045496-07
120	2020-06-20 13:38:05.792481-07
121	2020-06-20 13:41:04.53755-07
122	2020-06-20 13:41:43.296944-07
123	2020-06-20 13:42:28.465469-07
124	2020-06-20 13:42:49.354349-07
125	2020-06-20 13:44:28.809298-07
126	2020-06-20 13:44:46.379326-07
127	2020-06-20 13:45:11.283588-07
128	2020-06-20 13:47:58.250091-07
129	2020-06-20 13:48:12.678079-07
130	2020-06-20 13:48:39.78456-07
131	2020-06-20 13:50:08.118752-07
132	2020-06-20 13:57:47.191025-07
133	2020-06-20 13:59:26.732913-07
134	2020-06-20 14:00:37.440324-07
135	2020-06-20 14:02:35.64421-07
136	2020-06-20 14:17:39.817672-07
137	2020-06-20 14:18:14.718634-07
138	2020-06-20 14:19:16.464686-07
139	2020-06-20 14:19:25.116039-07
140	2020-06-20 14:19:33.516557-07
141	2020-06-20 14:19:46.414518-07
142	2020-06-20 14:20:47.993582-07
143	2020-06-20 14:21:27.016611-07
144	2020-06-20 14:21:58.598846-07
145	2020-06-20 14:22:17.99914-07
146	2020-06-20 14:24:02.343538-07
147	2020-06-20 14:24:10.549613-07
148	2020-06-20 14:26:48.3085-07
149	2020-06-23 20:21:16.577867-07
150	2020-06-23 20:21:29.47818-07
151	2020-06-23 20:30:10.592193-07
152	2020-06-23 20:30:14.620778-07
153	2020-06-23 20:30:26.570336-07
154	2020-06-23 20:32:53.304395-07
155	2020-06-23 20:33:54.395833-07
156	2020-06-23 20:34:21.601131-07
157	2020-06-23 20:34:45.861679-07
158	2020-06-23 20:35:12.407954-07
159	2020-06-23 20:35:29.586993-07
160	2020-06-23 20:35:46.931034-07
161	2020-06-23 20:36:42.586997-07
162	2020-06-23 20:38:40.479216-07
163	2020-06-23 20:50:22.537671-07
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription") FROM stdin;
1	Green Tea	1000	/images/green-tea-leaves.png	Green tea is light green in color and vegetal in taste. Green tea can be used to help energize the spirit. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
2	Assam Black Tea	1200	/images/assam-tea-leaves.png	Black tea is generally dark brown in color. The tea has a full, bold flavor and contains antioxidant and prebiotic properties. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
3	Rooibos Tea	1200	/images/rooibos-tea-leaves.png	Rooibos tea is red in color and is non-caffeinated. The tea contains antioxidant and anti-inflammatory properties. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
4	Oolong Tea	1000	/images/oolong-tea-leaves.png	Oolong tea  is golden in color. The tea produces a roasted aroma and contains L-theanine for stress reduction. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
5	Chrysanthemum Tea	1300	/images/chrysanthemum-tea.png	Chrysanthemum tea is yellow in color. The tea has a mild, flowery flavor and has popularity in use to reduce inflammation and calm nerves. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
6	Mint Tea	900	/images/mint-tea-leaves.png	Peppermint tea is light green to yellow in color. The tea has a minty flavor and has been known to aid in digestion. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 139, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 163, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

