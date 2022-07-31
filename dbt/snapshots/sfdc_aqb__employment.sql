{% snapshot sfdc_aqb__employment %}

{{
    config(
      target_database='dev_edw_db',
      target_schema='snapshots',
      unique_key='employment_id',
      strategy='timestamp',
      updated_at='employment_matillion_updated_timestamp',
    )
}}

select * from {{ ref('int_sfdc_aqb__employment') }}

{% endsnapshot %}