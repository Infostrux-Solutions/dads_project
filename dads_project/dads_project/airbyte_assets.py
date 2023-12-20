from dagster._utils import file_relative_path
from dagster_airbyte import airbyte_resource, load_assets_from_airbyte_instance, build_airbyte_assets
from dagster import (
    AssetKey,
    AssetSelection,
    Definitions,
    ScheduleDefinition,
    define_asset_job,
    file_relative_path,
)


airbyte_instance = airbyte_resource.configured(
    {
        "host": "localhost",
        "port": "8000",
        "username": "airbyte",
        "password":  "etl2023",
    }
)


# airbyte_assets = load_assets_from_airbyte_instance(
#     connection_id="a1c62148-bb92-4111-9ded-637ffc7f399a",
#     destination_tables=["ratings"],
#     asset_key_prefix=["ratings"],
# )

airbyte_assets = load_assets_from_airbyte_instance( airbyte_instance,  key_prefix=["raw_data"])

# airbyte_assets = load_assets_from_airbyte_instance(
#     airbyte_instance, connection_to_asset_key_fn=lambda c, n: AssetKey([c.name, n]), key_prefix=["ingest"]
# )
