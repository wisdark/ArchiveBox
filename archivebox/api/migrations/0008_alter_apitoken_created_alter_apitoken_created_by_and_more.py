# Generated by Django 5.1 on 2024-09-04 23:32

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models

import archivebox.base_models.models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0007_alter_apitoken_created_by'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AlterField(
            model_name='apitoken',
            name='created',
            field=archivebox.base_models.models.AutoDateTimeField(db_index=True, default=None),
        ),
        migrations.AlterField(
            model_name='apitoken',
            name='created_by',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='apitoken',
            name='id',
            field=models.UUIDField(default=None, editable=False, primary_key=True, serialize=False, unique=True, verbose_name='ID'),
        ),
        migrations.AlterField(
            model_name='outboundwebhook',
            name='created',
            field=archivebox.base_models.models.AutoDateTimeField(db_index=True, default=None),
        ),
        migrations.AlterField(
            model_name='outboundwebhook',
            name='created_by',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='outboundwebhook',
            name='id',
            field=models.UUIDField(default=None, editable=False, primary_key=True, serialize=False, unique=True, verbose_name='ID'),
        ),
    ]