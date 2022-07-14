
{{  config(  
 post_hook="alter table {{ this }} add primary key (contact_key)",  ) 
 }}


with contact as (select * from {{ref('int_sfdc_aqb__contact')}}   ),
final as (
    select contact.contact_id as contact_key, contact.* from contact 
)
select * from final