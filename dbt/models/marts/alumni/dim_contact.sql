

with contact as (select * from {{ref('int_sfdc_aqb__contact')}}   ),
final as (
    select * from contact 
)
select * from final