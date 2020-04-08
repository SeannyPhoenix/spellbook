#!/bin/bash

pg_dump -c -t main_app_school -t main_app_spell -t main_app_pcclass -t main_app_classspells spellbook > backup_$(date +%s).sql
psql -d spellbook -f seed.sql # > /dev/null
