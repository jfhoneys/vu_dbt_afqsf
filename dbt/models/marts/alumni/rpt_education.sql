
{{  config(  
 post_hook="alter table {{ this }} add primary key (edu_education_id)",  ) 
 }}


with education as (select * from {{ref('int_sfdc_aqb__education')}}   ),
final as (
    select  education.* from education 
)
select * from final