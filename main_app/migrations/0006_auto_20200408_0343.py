# Generated by Django 3.0.5 on 2020-04-08 03:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0005_auto_20200407_2337'),
    ]

    operations = [
        migrations.AddField(
            model_name='spell',
            name='subschool',
            field=models.CharField(default='-', max_length=20),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='spell',
            name='name',
            field=models.CharField(max_length=20),
        ),
        migrations.AlterField(
            model_name='spell',
            name='saving_throw',
            field=models.CharField(max_length=20),
        ),
        migrations.AlterField(
            model_name='spell',
            name='spell_resistance',
            field=models.CharField(max_length=20),
        ),
    ]
