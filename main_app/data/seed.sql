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
ALTER TABLE ONLY public.main_app_classspells DROP CONSTRAINT main_app_classspells_spell_id_1a7e3ff4_fk_main_app_spell_id;
ALTER TABLE ONLY public.main_app_classspells DROP CONSTRAINT main_app_classspells_pc_class_id_6a8286b2_fk_main_app_;
DROP INDEX public.main_app_spell_school_id_e43d3d10;
DROP INDEX public.main_app_classspells_pc_class_id_6a8286b2;
DROP INDEX public.main_app_classspells_name_id_d054c3ba;
ALTER TABLE ONLY public.main_app_spell DROP CONSTRAINT main_app_spell_pkey;
ALTER TABLE ONLY public.main_app_school DROP CONSTRAINT main_app_school_pkey;
ALTER TABLE ONLY public.main_app_classspells DROP CONSTRAINT main_app_classspells_pkey;
ALTER TABLE ONLY public.main_app_pcclass DROP CONSTRAINT main_app_class_pkey;
ALTER TABLE public.main_app_spell ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.main_app_school ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.main_app_pcclass ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.main_app_classspells ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.main_app_spell_id_seq;
DROP TABLE public.main_app_spell;
DROP SEQUENCE public.main_app_school_id_seq;
DROP TABLE public.main_app_school;
DROP SEQUENCE public.main_app_classspells_id_seq;
DROP TABLE public.main_app_classspells;
DROP SEQUENCE public.main_app_class_id_seq;
DROP TABLE public.main_app_pcclass;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: main_app_pcclass; Type: TABLE; Schema: public; Owner: seanny
--

CREATE TABLE public.main_app_pcclass (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.main_app_pcclass OWNER TO seanny;

--
-- Name: main_app_class_id_seq; Type: SEQUENCE; Schema: public; Owner: seanny
--

CREATE SEQUENCE public.main_app_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_class_id_seq OWNER TO seanny;

--
-- Name: main_app_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seanny
--

ALTER SEQUENCE public.main_app_class_id_seq OWNED BY public.main_app_pcclass.id;


--
-- Name: main_app_classspells; Type: TABLE; Schema: public; Owner: seanny
--

CREATE TABLE public.main_app_classspells (
    id integer NOT NULL,
    level integer NOT NULL,
    spell_id integer NOT NULL,
    pc_class_id integer NOT NULL,
    CONSTRAINT main_app_classspells_level_check CHECK ((level >= 0))
);


ALTER TABLE public.main_app_classspells OWNER TO seanny;

--
-- Name: main_app_classspells_id_seq; Type: SEQUENCE; Schema: public; Owner: seanny
--

CREATE SEQUENCE public.main_app_classspells_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_classspells_id_seq OWNER TO seanny;

--
-- Name: main_app_classspells_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seanny
--

ALTER SEQUENCE public.main_app_classspells_id_seq OWNED BY public.main_app_classspells.id;


--
-- Name: main_app_school; Type: TABLE; Schema: public; Owner: seanny
--

CREATE TABLE public.main_app_school (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.main_app_school OWNER TO seanny;

--
-- Name: main_app_school_id_seq; Type: SEQUENCE; Schema: public; Owner: seanny
--

CREATE SEQUENCE public.main_app_school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_school_id_seq OWNER TO seanny;

--
-- Name: main_app_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seanny
--

ALTER SEQUENCE public.main_app_school_id_seq OWNED BY public.main_app_school.id;


--
-- Name: main_app_spell; Type: TABLE; Schema: public; Owner: seanny
--

CREATE TABLE public.main_app_spell (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    casting_time character varying(100) NOT NULL,
    range character varying(100) NOT NULL,
    area character varying(100) NOT NULL,
    effect character varying(100) NOT NULL,
    targets character varying(100) NOT NULL,
    duration character varying(100) NOT NULL,
    saving_throw character varying(20) NOT NULL,
    spell_resistance character varying(20) NOT NULL,
    short_desc text NOT NULL,
    description text NOT NULL,
    school_id integer NOT NULL,
    subschool character varying(20) NOT NULL
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
-- Name: main_app_classspells id; Type: DEFAULT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_classspells ALTER COLUMN id SET DEFAULT nextval('public.main_app_classspells_id_seq'::regclass);


--
-- Name: main_app_pcclass id; Type: DEFAULT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_pcclass ALTER COLUMN id SET DEFAULT nextval('public.main_app_class_id_seq'::regclass);


--
-- Name: main_app_school id; Type: DEFAULT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_school ALTER COLUMN id SET DEFAULT nextval('public.main_app_school_id_seq'::regclass);


--
-- Name: main_app_spell id; Type: DEFAULT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_spell ALTER COLUMN id SET DEFAULT nextval('public.main_app_spell_id_seq'::regclass);


--
-- Data for Name: main_app_classspells; Type: TABLE DATA; Schema: public; Owner: seanny
--

COPY public.main_app_classspells (id, level, spell_id, pc_class_id) FROM stdin;
1	4	1	1
2	4	1	2
3	4	2	2
4	3	3	2
5	3	4	2
6	2	5	1
7	6	6	2
8	3	7	1
9	5	8	1
10	5	8	2
11	5	9	1
\.


--
-- Data for Name: main_app_pcclass; Type: TABLE DATA; Schema: public; Owner: seanny
--

COPY public.main_app_pcclass (id, name) FROM stdin;
1	Mystic
2	Technomancer
3	Whichwarper
\.


--
-- Data for Name: main_app_school; Type: TABLE DATA; Schema: public; Owner: seanny
--

COPY public.main_app_school (id, name, description) FROM stdin;
1	Abjuration	Abjurations are protective spells. If an abjuration creates a barrier that keeps certain types of creatures at bay, that barrier cannot be used to push away those creatures. If you force the barrier against such a creature, you feel a discernible pressure against the barrier. If you continue to apply pressure, the spell ends, even if the spell would normally work or its normal duration has not yet elapsed.
2	Conjuration	Conjuration spells bring creatures, objects, or energy (potentially including healing energy) into being or transport them to new locations. A conjured creature or object must arrive in an open location on a surface capable of supporting it. It can’t appear inside another creature or object. The conjured creature or object must appear within the spell’s range, but once conjured it does not have to remain within the range.
3	Divination	Divination spells enable you to learn long-forgotten secrets, predict the future, find hidden things, and pierce deceptive spells. In most circumstances, attempts to use divination magic to glean information about events during the Gap fail.
4	Enchantment	Enchantment spells affect the minds of others, influencing or controlling their behavior. All enchantments are mind-affecting spells and have that descriptor. Most enchantments are either charms or compulsions and have those descriptors. See Descriptors on page 269 for more information.
5	Evocation	Evocation spells manipulate magical energy or tap an unseen source of power to produce a desired result created entirely with magic. Many of these spells produce spectacular effects, and evocation spells can deal large amounts of damage. Evocation spells often produce effects that manifest as various kinds of energy, or as an energy type of the caster’s choice, as noted in an individual spell’s description.
6	Illusion	Illusion spells deceive the senses or minds of others. They cause people to see things that aren’t there, not see things that are actually there, hear phantom noises, or remember things that never really happened. By default, illusions create actual sensory stimuli in much the same manner as a hologram might.
7	Necromancy	Necromancy spells manipulate the power of death, unlife, and life force, including spells involving creating undead creatures.
8	Transmutation	Transmutation spells change the properties of some creature, thing, or condition.
\.


--
-- Data for Name: main_app_spell; Type: TABLE DATA; Schema: public; Owner: seanny
--

COPY public.main_app_spell (id, name, casting_time, range, area, effect, targets, duration, saving_throw, spell_resistance, short_desc, description, school_id, subschool) FROM stdin;
1	Animate Dead	1 standard action	touch	-	-	one of more corpses	instantaneous	none	no	Create controlled undead creatures out of target corpses.	This spell turns corpses into undead creatures that obey your spoken commands. The undead can be made to follow you, or they can be made to remain in place and attack any creature (or a specific kind of creature) entering the area. They remain animated until they are destroyed. A destroyed undead can’t be animated again.\r\nYou can create one or more undead creatures with a total CR of no more than half your caster level. You can only create one type of undead with each casting of this spell. Creating undead requires special materials worth 1,000 credits × the total CR of the undead created; these materials are consumed as part of casting the spell.\r\nThe undead you create remain under your control indefinitely. No matter how many times you use this spell, however, you can control only a number of undead whose total CR is no greater than your caster level. If you exceed this number, all the newly created creatures fall under your control and any excess undead from previous castings become uncontrolled. You choose which creatures are released. Once released, such undead have no particular feelings of loyalty to you, and in time they may grow in power beyond the undead you can create.\r\nThe corpses you use must be as intact as the typical undead of the type you choose to create. For example, a skeleton can be created only from a mostly intact corpse (that has bones) or skeleton. A zombie can be created only from a creature with a physical anatomy.	7	-
2	Arcane Eye	10 minutes	planetary	-	magical sensor	-	1 minute/level (D)	none	no	Invisible floating eye moves 30 feet per round and sends you visual information.	You create an invisible magical sensor that sends you visual information. The sensor appears at any point within line of sight, but it can then travel beyond your line of sight without hindrance. An arcane eye travels at 30 feet per round (300 feet per minute) if viewing an area ahead as a humanoid would (primarily looking at the floor) or 10 feet per round (100 feet per minute) if examining the ceiling and walls as well as the floor ahead. The arcane eye sees exactly as you would see if you were there.\tThe arcane eye can travel in any direction as long as the spell lasts. Solid barriers block its passage, but it can pass through a hole or space as small as 1 inch in diameter. The arcane eye can’t enter another plane of existence, even through Drift travel or a magical gate or similar magical portal.\tYou must concentrate to use an arcane eye. If you do not concentrate, the sensor is inert until you concentrate again.	3	-
3	Arcane Sight	1 standard action	personal	-	-	-	1 minute/level (D)			Magical sources become visible to you.	This spell allows you to see magic sources within 120 feet of you. The effect is similar to that of a detect magic spell, but arcane sight does not require concentration and discerns information more quickly.\nYou know the location and caster level of all magic sources within your sight. If the magic sources are in line of sight, you can attempt a DC 28 Mysticism check (one check per source) to determine the school of magic involved in each source.\nIf you concentrate on a specific creature within 120 feet of you as a standard action, you can determine whether it has any spellcasting or spell-like abilities and the caster level of the most powerful spell or spell-like ability the creature currently has available for use.\nAs with detect magic, you can use this spell to identify the properties of magic items, but not of artifacts.	3	-
4	Arcing Surge	1 standard action		line-shaped burst	-	-	instantaneous	Reflex half	yes	Deal 10d6 electricity damage in a 120-foot line.	You cause an electrical device in your possession to surge in power and unleash a line of electricity from the massive oversurge. This deals 10d6 electricity damage to all creatures and objects in the area.	5	electricity
5	Augury	1 minute	personal	-	-	-	instantaneous			Learn whether an action will be good or bad.	Casting augury can tell you whether a particular action will bring good or bad results for you in the immediate future. Casting this spell takes intense personal focus and requires you to spend 1 Resolve Point.\nThe chance for successfully receiving a meaningful reply is 75%; this roll is made secretly by the GM. A question may be so straightforward that a successful result is automatic, or it may be so vague as to have no chance of success. If the augury succeeds, you get one of four results.\nD Weal (if the action will probably bring good results).\nD Woe (for bad results).\nD Weal and woe (for both).\nD Nothing (for actions that have neither especially good nor especially bad results).\nIf the augury isn’t successful, you get the “nothing” result.\nA spellcaster who gets the “nothing” result has no way to tell whether it was the consequence of a failed or successful augury.\nThe augury can see only about 30 minutes into the future, so anything that might happen beyond that time frame does not affect the result. Thus, the result might not take into account the long-term consequences of a contemplated action. Multiple castings of augury by the same creature about the same topic use the same die result as the first casting.	3	-
6	Battle Junkbot	1 round	touch	-	-	at least 1 bulk of inert electronic equipment; see text	1 round/level	none	no	Create a temporary robot from random junk, turning it into a deadly combatant.	You turn a pile of technological junk into a vicious robot that can hunt down and attack your enemies.\nYou must target inert, nonworking electronic equipment of at least 1 bulk. Valid targets include a large broken computer system, nonworking or unconnected computer or robot parts, a destroyed robot or another such trashed mechanical system, or any related electronic components or combination of the above as long as the junk is found in a large enough quantity. Creating a battle junkbot also requires one ultra-capacity battery. Casting this spell drains all of the battery’s charges.\nWhile casting this spell, you use your magic and technological know-how to rearrange the junked parts and infuse them with aggression and martial skills. A battle junkbot is Small, its KAC and EAC are each equal to 15 + your technomancer level, it has hardness 15, and it has a number of Hit Points equal to half of your own (but no Stamina Points). It uses your saving throw bonuses when it is the target of spells and other targeted effects. It has a land speed of 30 feet and a fly speed of 15\nfeet with average maneuverability. For purposes of spells and effects that target the junkbot, it is treated as a construct with the magical and technological subtypes.\nThe battle junkbot has four hands. It is treated as if it had the Deadly Aim and Improved Combat Maneuver (Bull Rush, Grapple, Trip) feats. It has an attack bonus equal to 6 + your technomancer level; in one hand it wields a special buzzblade dagger that deals 6d8+6 damage instead of its normal damage, and a second hand carries a special light laser pistol that deals 6d6 damage instead of its normal damage. Damage from the junkbot’s special weapons counts as magic for the purpose of overcoming damage reduction.\nYou can give new basic commands to your battle junkbot telepathically on your turn as a move action, and the junkbot can take actions as if it were a normal creature. You are aware when the robot has made an attack or combat maneuver and whether or not it was successful, as well as when the battle junkbot has been attacked, has taken damage, or is destroyed, but you can perceive nothing else through this basic telepathic link.\nWhen the battle junkbot is destroyed or this spell ends, the electronic equipment you used to create the junkbot falls apart into refuse, its circuitry fried beyond anything recognizable. You cannot use this refuse as a target to create another junkbot.	8	-
7	Bestow Curse	1 standard action	touch	-	-	one creature	permanent	Will negates	yes	Target takes –4 penalty to attack rolls, saves, and checks or 50% chance of not acting on each of its turns.	You place a terrible curse on the target, stealing either its overall competency or its ability to think and act on its feet. Choose one of the following.\nD The target takes a –4 penalty to ability checks, attack rolls,\nsaving throws, and skill checks.\nD Each turn, the target has a 50% chance to act normally;\notherwise, it takes no action.\nYou can also invent your own curse (see Afflictions on page 414 for a few ideas), but it should be no more powerful than those described above. The curse bestowed by this spell cannot be dispelled, but it can be removed with a break enchantment, miracle, remove affliction, or wish spell.\nCasting this spell doesn’t provoke attacks of opportunity. Bestow curse counters remove affliction.	7	curse
8	Break Enchantment	1 minute	close (25 ft. + 5 ft./2 levels)	-	-	up to one creature per level, no two of which can be more than 30 ft. apart4	instantaneous	none	no	Free creatures from curses, enchantments, and transmutations.	This spell frees victims from curses, enchantments, and transmutations. Break enchantment can reverse even an instantaneous effect. For each such effect, you attempt a caster level check (1d20 + your caster level, maximum +15) against a DC equal to 11 + the caster level of the effect. Success means that the creature is free of the spell, curse, or effect. For a cursed magic item, the DC of the caster level check is equal to the DC of the curse.\nIf the spell is one that can’t be dispelled by dispel magic, break enchantment works only if that spell is 5th level or lower. If the effect comes from a permanent magic item, break enchantment doesn’t remove the curse from the item but it does free the victim from the item’s effects.	1	-
9	Call Cosmos	1 standard action	long (400 ft. + 40 ft./level)	-	-	-	1 round/level (D)	none	yes	Rain cosmic particles on targets, dealing 4d6 fire damage and 3d6 cold damage.	You evoke a vertical column of dangerous material from across the universe that rains down upon creatures in the area. This matter is made up of bits of burning stars and chunks of frozen comets, and it deals 4d6 fire damage and 3d6 cold damage to every creature in the area. This damage occurs only once, when the spell is cast. For the spell’s remaining duration, the fallen starstuff makes the entire area difficult terrain, and thick, swirling clouds of particulate space matter magically block vision. This obscures all sight beyond 5 feet, including darkvision and other vision-based senses (including vision-based blindsight and sense through), but doesn’t prevent blindsense. A creature within 5 feet of its attacker has concealment (attacks have a 20% miss chance). Creatures farther away have total concealment (50% miss chance, and the attacker can’t use sight to locate the target). Additionally, the swirling cosmic particles are distracting to spellcasters in the area, who have a 20% chance of losing any spell they attempt to cast in the area. At the end of the duration, the starstuff disappears, leaving no aftereffects (other than the damage dealt).	5	-
\.


--
-- Name: main_app_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seanny
--

SELECT pg_catalog.setval('public.main_app_class_id_seq', 2, true);


--
-- Name: main_app_classspells_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seanny
--

SELECT pg_catalog.setval('public.main_app_classspells_id_seq', 5, true);


--
-- Name: main_app_school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seanny
--

SELECT pg_catalog.setval('public.main_app_school_id_seq', 8, true);


--
-- Name: main_app_spell_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seanny
--

SELECT pg_catalog.setval('public.main_app_spell_id_seq', 2, true);


--
-- Name: main_app_pcclass main_app_class_pkey; Type: CONSTRAINT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_pcclass
    ADD CONSTRAINT main_app_class_pkey PRIMARY KEY (id);


--
-- Name: main_app_classspells main_app_classspells_pkey; Type: CONSTRAINT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_classspells
    ADD CONSTRAINT main_app_classspells_pkey PRIMARY KEY (id);


--
-- Name: main_app_school main_app_school_pkey; Type: CONSTRAINT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_school
    ADD CONSTRAINT main_app_school_pkey PRIMARY KEY (id);


--
-- Name: main_app_spell main_app_spell_pkey; Type: CONSTRAINT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_spell
    ADD CONSTRAINT main_app_spell_pkey PRIMARY KEY (id);


--
-- Name: main_app_classspells_name_id_d054c3ba; Type: INDEX; Schema: public; Owner: seanny
--

CREATE INDEX main_app_classspells_name_id_d054c3ba ON public.main_app_classspells USING btree (spell_id);


--
-- Name: main_app_classspells_pc_class_id_6a8286b2; Type: INDEX; Schema: public; Owner: seanny
--

CREATE INDEX main_app_classspells_pc_class_id_6a8286b2 ON public.main_app_classspells USING btree (pc_class_id);


--
-- Name: main_app_spell_school_id_e43d3d10; Type: INDEX; Schema: public; Owner: seanny
--

CREATE INDEX main_app_spell_school_id_e43d3d10 ON public.main_app_spell USING btree (school_id);


--
-- Name: main_app_classspells main_app_classspells_pc_class_id_6a8286b2_fk_main_app_; Type: FK CONSTRAINT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_classspells
    ADD CONSTRAINT main_app_classspells_pc_class_id_6a8286b2_fk_main_app_ FOREIGN KEY (pc_class_id) REFERENCES public.main_app_pcclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_app_classspells main_app_classspells_spell_id_1a7e3ff4_fk_main_app_spell_id; Type: FK CONSTRAINT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_classspells
    ADD CONSTRAINT main_app_classspells_spell_id_1a7e3ff4_fk_main_app_spell_id FOREIGN KEY (spell_id) REFERENCES public.main_app_spell(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_app_spell main_app_spell_school_id_e43d3d10_fk_main_app_school_id; Type: FK CONSTRAINT; Schema: public; Owner: seanny
--

ALTER TABLE ONLY public.main_app_spell
    ADD CONSTRAINT main_app_spell_school_id_e43d3d10_fk_main_app_school_id FOREIGN KEY (school_id) REFERENCES public.main_app_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
