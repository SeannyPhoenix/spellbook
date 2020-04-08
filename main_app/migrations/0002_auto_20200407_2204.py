# Generated by Django 3.0.5 on 2020-04-07 22:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Class',
            new_name='PCClass',
        ),
        migrations.RemoveField(
            model_name='classspells',
            name='school',
        ),
        migrations.AddField(
            model_name='classspells',
            name='pc_class',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='main_app.PCClass'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='spell',
            name='school',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='main_app.School'),
            preserve_default=False,
        ),
    ]
