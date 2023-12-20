from dagster import (
    AssetKey,
    AssetSelection,
    Definitions,
    ScheduleDefinition,
    define_asset_job,
    file_relative_path,
)
from dagster._utils import file_relative_path
from dagster_airbyte import airbyte_resource, load_assets_from_airbyte_instance



airbyte_instance = airbyte_resource.configured(
    {
        "host": "localhost",
        "port": "8000",
        "username": "airbyte",
        "password":  "etl2023",
    }
)

# airbyte_assets = load_assets_from_airbyte_instance(
#     airbyte_instance, connection_to_asset_key_fn=lambda c, n: AssetKey([c.name, n])
# )




update_dash_job = define_asset_job("update_activity_dash", selection=AssetSelection.all())
update_dash_schedule = ScheduleDefinition(job=update_dash_job, cron_schedule="* * 1 * *")

