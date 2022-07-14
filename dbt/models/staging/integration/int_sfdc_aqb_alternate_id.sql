with alt_id as (select * from  {{ ref ('stg_sfdc_aqb__aqb__alternateid__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

alt_id_transform as (
select 
	alt_id.AQB__ALTERNATEID__C_ID as alt_id_id
	, alt_id.ownerid as alt_id_owner_id
	, alt_id.isdeleted as alt_id_is_deleted
	, alt_id.name as alt_id_name
	, alt_id.createddate as alt_id_created_date
	, alt_id.createdbyid as alt_id_created_by_id
	, alt_id.lastmodifieddate as alt_id_last_modified_date
	, alt_id.lastmodifiedbyid as alt_id_last_modified_id
	--, systemmodstamp
	, alt_id.lastvieweddate as alt_id_last_viewed_date
	, alt_id.lastreferenceddate as alt_id_last_referenced_date
	, alt_id.aqb__accountreferenced__c as alt_id_account_referenced
	, alt_id.aqb__alternateid__c as alt_id_alternate_id
	, alt_id.aqb__contactreferenced__c as alt_id_contact_referenced
	, alt_id.aqb__nonuniquealternateid__c as alt_id_non_unique_alternate_id
	--, aqb__ownerunit__c
	--, aqb__type__c
	--, aqcv_conversionid__c
	--, matillion_batch_id
	--, matillion_updated_timestamp
	--, source_name
from 
	alt_id
),

final as (
	select
		alt_id_transform.*
		, owner.name as alt_id_owner_name
        , created_by.name as alt_id_creator_name
        , last_modified_by.name as alt_id_last_modified_by_name
	FROM	
		alt_id_transform
			join owner on alt_id_transform.alt_id_owner_id = owner.user_id
			join created_by on alt_id_transform.alt_id_created_by_id = created_by.user_id
            join last_modified_by on alt_id_transform.alt_id_last_modified_id = last_modified_by.user_id
)

select * from final