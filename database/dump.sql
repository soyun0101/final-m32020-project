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
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
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
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription") FROM stdin;
1	Green Tea	1000	/images/green-tea-leaves.png	Green tea is light green in color and vegetal in taste. Green tea can be used to help energize the spirit. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
2	Assam Black Tea	1200	/images/assam-tea-leaves.png	Black tea is generally dark brown in color. The tea has a full, bold flavor and contain antioxidant and prebiotic properties. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
3	Rooibos Tea	1200	/images/rooibos-tea-leaves.png	Rooibos tea is red in color and is non-caffeinated. The tea contains antioxidant and anti-inflammatory properties. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
4	Oolong Tea	1000	/images/oolong-tea-leaves.png	Oolong tea  is golden in color. The tea produces a roasted aroma and contains L-theanine for stress reduction. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
5	Chrysanthemum Tea	1300	/images/chrysanthemum-tea.png	Chrysanthemum tea is yellow in color. The tea has a mild, flowery flavor and has popularity in use to reduce inflammation and calm nerves. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
6	Mint Tea	900	/images/mint-tea-leaves.png	Peppermint tea is light green to yellow in color. The tea has a minty flavor and has been known to aid in digestion. Note: Statements have not been evaluated by the FDA. Please check with your doctor before consumption of tea leaves for health reasons.
\.


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


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

