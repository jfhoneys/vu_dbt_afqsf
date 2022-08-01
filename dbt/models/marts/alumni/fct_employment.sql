{{  config(  materialized='table',
 post_hook="alter table {{ this }} add primary key (employment_key)",  ) 
 }}

with employment as (select * from {{ref ('int_sfdc_aqb__employment')}}), 
final as 
(select employment.empoyment_id as education_key, education.*  from employment  )
select * from final 