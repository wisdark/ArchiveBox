# Generated by Django 5.1 on 2024-08-20 22:43

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_remove_apitoken_uuid_remove_outboundwebhook_uuid_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='outboundwebhook',
            old_name='uuid',
            new_name='id'
        ),
        migrations.AlterField(
            model_name='outboundwebhook',
            name='id',
            field=models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='apitoken',
            name='id',
            field=models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False),
        ),
    ]
