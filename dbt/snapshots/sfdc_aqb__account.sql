{% snapshot sfdc_aqb__account %}

{{
    config(
      target_database='dev_edw_db',
      target_schema='snapshots',
      unique_key='account_id',

      strategy='timestamp',
      updated_at='matillion_updated_timestamp',
    )
}}

select * from {{ ref('stg_sfdc_aqb__account') }}

{% endsnapshot %}