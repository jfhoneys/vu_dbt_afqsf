with relationshipcontact as (select * from  {{ ref ('stg_sfdc_aqb__aqb__relationshipcontact__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

relationshipcontact_transform as (
    select relationshipcontact.aqb__relationshipcontact__c_id as relationshipcontact_relationship_contact_id
, relationshipcontact.ownerid as relationshipcontact_owner_id
-- , relationshipcontact.isdeleted as relationshipcontact_isdeleted
, relationshipcontact.name as relationshipcontact_name
, relationshipcontact.recordtypeid as relationshipcontact_recordtypeid
-- , relationshipcontact.createddate as relationshipcontact_createddate
, relationshipcontact.createdbyid as relationshipcontact_created_by_id
-- , relationshipcontact.lastmodifieddate as relationshipcontact_lastmodifieddate
, relationshipcontact.lastmodifiedbyid as relationshipcontact_lastmodified_by_id
-- , relationshipcontact.systemmodstamp as relationshipcontact_systemmodstamp
, relationshipcontact.aqb__contactid__c as relationshipcontact_contact_id
-- , relationshipcontact.aqb__contactrolegroup__c as relationshipcontact_contactrolegroup
-- , relationshipcontact.aqb__contactrole__c as relationshipcontact_contactrole
-- , relationshipcontact.aqb__enddate__c as relationshipcontact_enddate
-- , relationshipcontact.aqb__ended__c as relationshipcontact_ended
-- , relationshipcontact.aqb__ownerunit__c as relationshipcontact_ownerunit
, relationshipcontact.aqb__relatedcontactrole__c as relationshipcontact_related_contact_role
, relationshipcontact.aqb__relatedname__c as relationshipcontact_related_name
, relationshipcontact.aqb__relatedto__c as relationshipcontact_related_to
-- , relationshipcontact.aqb__relationshippair__c as relationshipcontact_relationshippair
, relationshipcontact.aqb__relationship_type__c as relationshipcontact_relationship_type
, relationshipcontact.aqb__relationship__c as relationshipcontact_relationship
, relationshipcontact.aqb__reverserelationship__c as relationshipcontact_reverse_relationship
-- , relationshipcontact.aqb__source__c as relationshipcontact_source
-- , relationshipcontact.aqb__startdate__c as relationshipcontact_startdate
-- , relationshipcontact.aqb__started__c as relationshipcontact_started
, relationshipcontact.aqb__relatedcontact__c as relationshipcontact_related_contact
-- , relationshipcontact.aqcv_conversionid__c as relationshipcontact_aqcv_conversionid
-- , relationshipcontact.aqc_non_constituent_birthday__c as relationshipcontact_aqc_non_constituent_birthday
-- , relationshipcontact.matillion_batch_id as relationshipcontact_matillion_batch_id
-- , relationshipcontact.matillion_updated_timestamp as relationshipcontact_matillion_updated_timestamp
, relationshipcontact.source_name as relationshipcontact_source_name
    from relationshipcontact
    ),

final as (select -- select count(1) as cnt from trans
             relationshipcontact_transform.*
             , owner.name as relationshipcontact_owner_name
             , created_by.name as relationshipcontact_creator_name
             , last_modified_by.name as relationshipcontact_last_modified_by_name
        from relationshipcontact_transform
             join owner on relationshipcontact_transform.relationshipcontact_owner_id = owner.user_id
             join created_by on relationshipcontact_transform.relationshipcontact_created_by_id = created_by.user_id
             join last_modified_by on relationshipcontact_transform.relationshipcontact_last_modified_by_id = last_modified_by.user_id
)

/*clean select*/
select * from final
