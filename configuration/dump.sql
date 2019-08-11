--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

-- Started on 2017-04-05 15:22:58 +06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2161 (class 1262 OID 21262)
-- Name: library; Type: DATABASE; Schema: -; Owner: library_user
--

\connect library

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 28209)
-- Name: author; Type: TABLE; Schema: public; Owner: library_user
--

CREATE TABLE author (
    id bigint NOT NULL,
    biography character varying(255),
    fullname character varying(255),
    year_of_birth integer
);


ALTER TABLE author OWNER TO library_user;

--
-- TOC entry 182 (class 1259 OID 28217)
-- Name: author_book; Type: TABLE; Schema: public; Owner: library_user
--

CREATE TABLE author_book (
    author_id bigint NOT NULL,
    book_id bigint NOT NULL
);


ALTER TABLE author_book OWNER TO library_user;

--
-- TOC entry 183 (class 1259 OID 28220)
-- Name: book; Type: TABLE; Schema: public; Owner: library_user
--

CREATE TABLE book (
    id bigint NOT NULL,
    title character varying(255),
    year_of_publishing integer,
    genre bigint NOT NULL
);


ALTER TABLE book OWNER TO library_user;

--
-- TOC entry 184 (class 1259 OID 28227)
-- Name: genre; Type: TABLE; Schema: public; Owner: library_user
--

CREATE TABLE genre (
    id bigint NOT NULL,
    title character varying(255)
);


ALTER TABLE genre OWNER TO library_user;

--
-- TOC entry 2033 (class 2606 OID 28216)
-- Name: author_pkey; Type: CONSTRAINT; Schema: public; Owner: library_user
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- TOC entry 2035 (class 2606 OID 28226)
-- Name: book_genre_key; Type: CONSTRAINT; Schema: public; Owner: library_user
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_genre_key UNIQUE (genre);


--
-- TOC entry 2037 (class 2606 OID 28224)
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: library_user
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2039 (class 2606 OID 28231)
-- Name: genre_pkey; Type: CONSTRAINT; Schema: public; Owner: library_user
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 2041 (class 2606 OID 28237)
-- Name: fk2a7a111d98217a13; Type: FK CONSTRAINT; Schema: public; Owner: library_user
--

ALTER TABLE ONLY author_book
    ADD CONSTRAINT fk2a7a111d98217a13 FOREIGN KEY (author_id) REFERENCES book(id);


--
-- TOC entry 2040 (class 2606 OID 28232)
-- Name: fk2a7a111dedab17d7; Type: FK CONSTRAINT; Schema: public; Owner: library_user
--

ALTER TABLE ONLY author_book
    ADD CONSTRAINT fk2a7a111dedab17d7 FOREIGN KEY (book_id) REFERENCES author(id);


--
-- TOC entry 2042 (class 2606 OID 28242)
-- Name: fk2e3ae9cba28f8b; Type: FK CONSTRAINT; Schema: public; Owner: library_user
--

ALTER TABLE ONLY book
    ADD CONSTRAINT fk2e3ae9cba28f8b FOREIGN KEY (genre) REFERENCES genre(id);


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: library_user
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM library_user;
GRANT ALL ON SCHEMA public TO library_user;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-04-05 15:22:58 +06

--
-- PostgreSQL database dump complete
--

