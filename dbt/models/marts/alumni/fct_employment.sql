{{  config(  materialized='table',
 
  post_hook=["alter table {{ this }} add constraint fct_employment_contact foreign key (contact_key)
            references {{ ref('dim_contact') }} (contact_key) ",

            "alter table {{ this }} add primary key (employment_key)",  
         ], 
  ) 
 }}

with employment as (select * from {{ref ('int_sfdc_aqb__employment')}}), 
final as 
(select 
    employment.employment_id as employment_key 
    , employment.employment_contact_key as contact_key
    , employment.employment_id
    , employment.employment_name
    , employment.employment_record_type_name
    , employment.employment_business_phone
    , employment.employment_primary_employment
    , employment.employment_do_not_archive
    , employment.employment_status
    , employment.employment_title
    , employment.employment_employer_name_display
    , employment.employment_comment
    , employment.employment_external_id
    , employment.employment_end_date
    , employment.employment_ended
    , employment.employment_is_primary_employer
    , employment.employment_level
    , employment.employment_linked_employer
    , employment.employment_occupation
    , employment.employment_contact_id
    , employment.employment_start_date
    , employment.employment_is_deleted
    , employment.employment_created_date
    , employment.employment_record_type_id
    , employment.employment_last_modified_date
    , employment.employment_system_modstamp
    , employment.employment_created_by_id
    , employment.employment_last_modified_by_id
    , employment.employment_owner_id
    , employment.employment_matillion_batch_id
    , employment.employment_matillion_updated_timestamp
    , employment.employment_source_name
    , employment.employment_owner_name
    , employment.employment_creator_name
    , employment.employment_last_modified_by_name


from employment  )
select * from final 