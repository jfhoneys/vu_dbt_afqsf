{% snapshot sfdc_aqb__contact %}

{{
    config(
      target_database='dev_edw_db',
      target_schema='snapshots',
      unique_key='contact_id',

      strategy='timestamp',
      updated_at='contact_matillion_updated_timestamp',
    )
}}

select * from {{ ref('int_sfdc_aqb__contact') }}

{% endsnapshot %}