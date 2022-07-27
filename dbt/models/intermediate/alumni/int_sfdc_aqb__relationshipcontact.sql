with relationship_contact as (select * from  {{ ref ('stg_sfdc_aqb__aqb__relationshipcontact__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

relationship_contact_transform as
(select
relationshipcontact.aqb__relationshipcontact__c_id as relationship_contact_id
, relationshipcontact.ownerid as relationship_contact_owner_id
, relationshipcontact.isdeleted as relationshipcontact_is_deleted
, relationshipcontact.name as relationship_contact_name
, relationshipcontact.recordtypeid as relationship_contact_record_type_id
, relationshipcontact.createddate as relationship_contact_created_date
, relationshipcontact.createdbyid as relationship_contact_created_by_id
, relationshipcontact.lastmodifieddate as relationship_contact_last_modified_date
, relationshipcontact.lastmodifiedbyid as relationship_contact_last_modified_by_id
--, relationshipcontact.systemmodstamp as relationship_contact_systemmodstamp
, relationshipcontact.aqb__contactid__c as relationship_contact_contactid
--, relationshipcontact.aqb__contactrolegroup__c as relationship_contact_contact_role_group
--, relationshipcontact.aqb__contactrole__c as relationship_contact_contact_role
--, relationshipcontact.aqb__enddate__c as relationship_contact_end_date
--, relationshipcontact.aqb__ended__c as relationship_contact_ended
--, relationshipcontact.aqb__ownerunit__c as relationship_contact_owner_unit
, relationshipcontact.aqb__relatedcontactrole__c as relationshipcontact_related_contact_role
, relationshipcontact.aqb__relatedname__c as relationship_contact_related_name
, relationshipcontact.aqb__relatedto__c as relationship_contact_related_to
--, relationshipcontact.aqb__relationshippair__c as relationshipcontact_relationshippair
, relationshipcontact.aqb__relationship_type__c as relationship_contact_relationship_type
, relationshipcontact.aqb__relationship__c as relationship_contact_relationship
, relationshipcontact.aqb__reverserelationship__c as relationship_contact_reverse_relationship
--, relationshipcontact.aqb__source__c as relationship_contact_source
--, relationshipcontact.aqb__startdate__c as relationship_contact_start_date
--, relationshipcontact.aqb__started__c as relationship_contact_started
, relationshipcontact.aqb__relatedcontact__c as relationship_contact_related_contact
--, relationshipcontact.aqcv_conversionid__c as relationship_contact_aqcv_conversion_id
--, relationshipcontact.aqc_non_constituent_birthday__c as relationship_contact_aqc_non_constituent_birthday
, relationshipcontact.matillion_batch_id as relationship_contact_matillion_batch_id
, relationshipcontact.matillion_updated_timestamp as relationship_contact_matillion_updated_timestamp
, relationshipcontact.source_name as relationship_contact_source_name
    from relationshipcontact
    ),

final as (select -- select count(1) as cnt from trans
             relationship_contact_transform.*
            -- , owner.name as relationship_contact_owner_name
             , created_by.name as relationship_contact_creator_name
             , last_modified_by.name as relationship_contact_last_modified_by_name
        from relationship_contact_transform
            -- join owner on relationship_contact_transform.relationship_contact_ownerid = owner.user_id
             join created_by on relationship_contact_transform.relationship_contact_created_by_id = created_by.user_id
             join last_modified_by on relationship_contact_transform.relationship_contact_last_modified_by_id = last_modified_by.user_id
)

/*clean select*/
select * from final