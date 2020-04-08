from django.db import models


class School(models.Model):
    name = models.CharField(max_length=20)
    description = models.TextField()

    def __str__(self):
        return self.name


class Spell(models.Model):
    name = models.CharField(max_length=20)
    school = models.ForeignKey(School, on_delete=models.CASCADE)
    subschool = models.CharField(max_length=20)
    casting_time = models.CharField(max_length=100)
    range = models.CharField(max_length=100)
    area = models.CharField(max_length=100)
    effect = models.CharField(max_length=100)
    targets = models.CharField(max_length=100)
    duration = models.CharField(max_length=100)
    saving_throw = models.CharField(max_length=20)
    spell_resistance = models.CharField(max_length=20)
    short_desc = models.TextField()
    description = models.TextField()

    def __str__(self):
        return self.name


class PCClass(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name


class ClassSpells(models.Model):
    spell = models.ForeignKey(Spell, on_delete=models.CASCADE)
    level = models.PositiveIntegerField()
    pc_class = models.ForeignKey(PCClass, on_delete=models.CASCADE)

    def __str__(self):
        name = Spell.objects.get(id=self.spell.id).name
        pc_class = PCClass.objects.get(id=self.pc_class.id)
        return f'{name} - {pc_class} {self.level}'
