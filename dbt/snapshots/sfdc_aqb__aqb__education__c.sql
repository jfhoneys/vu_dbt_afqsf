{% snapshot sfdc_aqb__aqb__education__c %}

{{
    config(
      target_database='dev_edw_db',
      target_schema='snapshots',
      unique_key='aqb__education__c_id',

      strategy='timestamp',
      updated_at='matillion_updated_timestamp',
    )
}}

select * from {{ ref('stg_sfdc_aqb__aqb__education__c') }}

{% endsnapshot %}