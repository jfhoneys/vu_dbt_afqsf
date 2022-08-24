{% snapshot sfdc_aqb__education %}

{{
    config(
      target_database='dev_edw_db',
      target_schema='snapshots',
      unique_key='education_id',

      strategy='timestamp',
      updated_at='education_matillion_updated_timestamp',
    )
}}

select * from {{ ref('int_sfdc_aqb__education') }}

{% endsnapshot %}