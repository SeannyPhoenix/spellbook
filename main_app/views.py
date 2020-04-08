from django.shortcuts import render
from .models import School, Spell, PCClass, ClassSpells


def home(request):
    return render(request, 'index.html',
                  {
                      'page_title': 'Home'
                  })


def spells(request):
    all_spells = Spell.objects.all()
    return render(request, 'spells.html',
                  {
                      'page_title': 'Spell List',
                      'spells': all_spells
                  })


def spell_detail(request, spell_name):
    spell = Spell.objects.get(name=spell_name)
    return render(request, 'spell/detail.html',
                  {
                      'page_title': spell.name,
                      'spell': spell
                  })


def spell_create(request):
    print(request.method)
    return render(request, 'index.html',
                  {
                      'page_title': 'Create Spell'
                  })
