{{  config(  materialized='table',
 post_hook="alter table {{ this }} add primary key (education_key)",  ) 
 }}

with education as (select * from {{ref ('int_sfdc_aqb__education')}}), 
final as 
(select education.education_id as education_key, education.*  from education  )
select * from final 