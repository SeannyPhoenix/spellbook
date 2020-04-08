--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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

ALTER TABLE ONLY public.main_app_spell DROP CONSTRAINT main_app_spell_school_id_e43d3d10_fk_main_app_school_id;
DROP INDEX public.main_app_spell_school_id_e43d3d10;
ALTER TABLE ONLY public.main_app_spell DROP CONSTRAINT main_app_spell_pkey;
ALTER TABLE public.main_app_spell ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.main_app_spell_id_seq;
DROP TABLE public.main_app_spell;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: main_app_spell; Type: TABLE; Schema: public; Owner: seanny
--

CREATE TABLE public.main_app_spell (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    casting_time character varying(100) NOT NULL,
    range character varying(100) NOT NULL,
    area character varying(100) NOT NULL,
    effect character varying(100) NOT NULL,
    targets character varying(100) NOT NULL,
    duration character varying(100) NOT NULL,
    saving_throw character varying(100) NOT NULL,
    spell_resistance character varying(100) NOT NULL,
    short_desc text NOT NULL,
    description text NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE public.main_app_spell OWNER TO seanny;

--
-- Name: main_app_spell_id_seq; Type: SEQUENCE; Schema: public; Owner: seanny
--

CREATE SEQUENCE public.main_app_spell_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_spell_id_seq OWNER TO seanny;

--
-- Name: main_app_spell_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seanny
--

ALTER SEQUENCE public.main_app_spell_id_seq OWNED BY public.main_app_spell.id;


--
-- Name: main_app_spell id; Type: DEFAULT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_spell ALTER COLUMN id SET DEFAULT nextval('public.main_app_spell_id_seq'::regclass);


--
-- Data for Name: main_app_spell; Type: TABLE DATA; Schema: public; Owner: seanny
--

COPY public.main_app_spell (id, name, casting_time, range, area, effect, targets, duration, saving_throw, spell_resistance, short_desc, description, school_id) FROM stdin;
1	Animate Dead	1 standard action	touch	-	-	one of more corpses	instantaneous	none	no	Create controlled undead creatures out of target corpses.	This spell turns corpses into undead creatures that obey your spoken commands. The undead can be made to follow you, or they can be made to remain in place and attack any creature (or a specific kind of creature) entering the area. They remain animated until they are destroyed. A destroyed undead can’t be animated again.\r\nYou can create one or more undead creatures with a total CR of no more than half your caster level. You can only create one type of undead with each casting of this spell. Creating undead requires special materials worth 1,000 credits × the total CR of the undead created; these materials are consumed as part of casting the spell.\r\nThe undead you create remain under your control indefinitely. No matter how many times you use this spell, however, you can control only a number of undead whose total CR is no greater than your caster level. If you exceed this number, all the newly created creatures fall under your control and any excess undead from previous castings become uncontrolled. You choose which creatures are released. Once released, such undead have no particular feelings of loyalty to you, and in time they may grow in power beyond the undead you can create.\r\nThe corpses you use must be as intact as the typical undead of the type you choose to create. For example, a skeleton can be created only from a mostly intact corpse (that has bones) or skeleton. A zombie can be created only from a creature with a physical anatomy.	7
2	Arcane Eye	10 minutes	planetary	-	magical sensor	-	1 minute/level (D)	none	no	Invisible floating eye moves 30 feet per round and sends you visual information.	You create an invisible magical sensor that sends you visual information. The sensor appears at any point within line of sight, but it can then travel beyond your line of sight without hindrance. An arcane eye travels at 30 feet per round (300 feet per minute) if viewing an area ahead as a humanoid would (primarily looking at the floor) or 10 feet per round (100 feet per minute) if examining the ceiling and walls as well as the floor ahead. The arcane eye sees exactly as you would see if you were there.\tThe arcane eye can travel in any direction as long as the spell lasts. Solid barriers block its passage, but it can pass through a hole or space as small as 1 inch in diameter. The arcane eye can’t enter another plane of existence, even through Drift travel or a magical gate or similar magical portal.\tYou must concentrate to use an arcane eye. If you do not concentrate, the sensor is inert until you concentrate again.	3
\.


--
-- Name: main_app_spell_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seanny
--

SELECT pg_catalog.setval('public.main_app_spell_id_seq', 2, true);


--
-- Name: main_app_spell main_app_spell_pkey; Type: CONSTRAINT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_spell
    ADD CONSTRAINT main_app_spell_pkey PRIMARY KEY (id);


--
-- Name: main_app_spell_school_id_e43d3d10; Type: INDEX; Schema: public; Owner: seanny
--

CREATE INDEX main_app_spell_school_id_e43d3d10 ON public.main_app_spell USING btree (school_id);


--
-- Name: main_app_spell main_app_spell_school_id_e43d3d10_fk_main_app_school_id; Type: FK CONSTRAINT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_spell
    ADD CONSTRAINT main_app_spell_school_id_e43d3d10_fk_main_app_school_id FOREIGN KEY (school_id) REFERENCES public.main_app_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

