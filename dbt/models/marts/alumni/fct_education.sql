{{  config(  materialized='table',

   post_hook=["alter table {{ this }} add constraint fct_education_contact foreign key (contact_key)
            references {{ ref('dim_contact') }} (contact_key) ",

            "alter table {{ this }} add primary key (education_key)",  
         ], 
 ) 
 }}

with education as (select * from {{ref ('int_sfdc_aqb__education')}}), 
final as 
(select    
      education.education_id as education_key
    , education.education_id
    , education.education_contact_id as contact_key 
    , education.education_name
    , education.education_record_type_name
    , education.education_area_of_study
    , education.education_degree_diploma
    , education.education_degree_level
    , education.education_graduation_year
    , education.education_graduation_month
    , education.education_granting_school
    , education.education_honorary_degree
    , education.education_institution
    , education.education_institution_name
    , education.education_is_primary_degree
    , education.education_preferred_year
    , education.education_school
    , education.education_created_date
    , education.education_created_by_id
    , education.education_last_modified_date
    , education.education_last_modified_by_id
    , education.education_owner_id
    , education.education_matillion_batch_id
    , education.education_matillion_updated_timestamp
    , education.education_source_name
    , education.education_owner_name
    , education.education_creator_name
    , education.education_last_modified_by_name
      from education  )
select * from final 