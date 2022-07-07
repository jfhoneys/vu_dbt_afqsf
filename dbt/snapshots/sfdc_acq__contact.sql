{% snapshot sfdc_acq__contact %}

{{
    config(
      target_database='dev_edw_db',
      target_schema='snapshots',
      unique_key='contact_id',

      strategy='timestamp',
      updated_at='matillion_updated_timestamp',
    )
}}

select * from {{ ref('stg_sfdc_aqb__contact') }}

{% endsnapshot %}