# Generated by Django 3.0 on 2024-04-17 06:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fcb_app', '0004_remove_complaint_status'),
    ]

    operations = [
        migrations.RenameField(
            model_name='review',
            old_name='review_details',
            new_name='description',
        ),
        migrations.AddField(
            model_name='booking',
            name='amount',
            field=models.CharField(default=1, max_length=225),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='booking',
            name='date',
            field=models.CharField(default=1, max_length=225),
            preserve_default=False,
        ),
    ]
