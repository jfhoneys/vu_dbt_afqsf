{{  config(  materialized='table',
 post_hook="alter table {{ this }} add primary key (employment_key)",  ) 
 }}

with employment as (select * from {{ref ('int_sfdc_aqb__employment')}}), 
final as 
(select employment.employment_id as employment_key, employment.*  from employment  )
select * from final 