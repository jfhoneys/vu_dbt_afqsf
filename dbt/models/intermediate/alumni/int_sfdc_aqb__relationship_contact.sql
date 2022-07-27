with relationship_contact as (select * from  {{ ref ('stg_sfdc_aqb__aqb__relationshipcontact__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

relationship_contact_transform as
(select
relationship_contact.aqb__relationshipcontact__c_id as relationship_contact_id
, relationship_contact.ownerid as relationship_contact_owner_id
, relationship_contact.isdeleted as relationship_contact_is_deleted
, relationship_contact.name as relationship_contact_name
, relationship_contact.recordtypeid as relationship_contact_record_type_id
, relationship_contact.createddate as relationship_contact_created_date
, relationship_contact.createdbyid as relationship_contact_created_by_id
, relationship_contact.lastmodifieddate as relationship_contact_last_modified_date
, relationship_contact.lastmodifiedbyid as relationship_contact_last_modified_by_id
--, relationship_contact.systemmodstamp as relationship_contact_systemmodstamp
, relationship_contact.aqb__contactid__c as relationship_contact_contactid
--, relationship_contact.aqb__contactrolegroup__c as relationship_contact_contact_role_group
--, relationship_contact.aqb__contactrole__c as relationship_contact_contact_role
--, relationship_contact.aqb__enddate__c as relationship_contact_end_date
--, relationshipcontact.aqb__ended__c as relationship_contact_ended
--, relationshipcontact.aqb__ownerunit__c as relationship_contact_owner_unit
, relationship_contact.aqb__relatedcontactrole__c as relationshipcontact_related_contact_role
, relationship_contact.aqb__relatedname__c as relationship_contact_related_name
, relationship_contact.aqb__relatedto__c as relationship_contact_related_to
--, relationship_contact.aqb__relationshippair__c as relationshipcontact_relationshippair
, relationship_contact.aqb__relationship_type__c as relationship_contact_relationship_type
, relationship_contact.aqb__relationship__c as relationship_contact_relationship
, relationship_contact.aqb__reverserelationship__c as relationship_contact_reverse_relationship
--, relationship_contact.aqb__source__c as relationship_contact_source
--, relationship_contact.aqb__startdate__c as relationship_contact_start_date
--, relationship_contact.aqb__started__c as relationship_contact_started
, relationship_contact.aqb__relatedcontact__c as relationship_contact_related_contact
--, relationship_contact.aqcv_conversionid__c as relationship_contact_aqcv_conversion_id
--, relationship_contact.aqc_non_constituent_birthday__c as relationship_contact_aqc_non_constituent_birthday
, relationship_contact.matillion_batch_id as relationship_contact_matillion_batch_id
, relationship_contact.matillion_updated_timestamp as relationship_contact_matillion_updated_timestamp
, relationship_contact.source_name as relationship_contact_source_name
    from relationship_contact
    ),

final as (select -- select count(1) as cnt from trans
             relationship_contact_transform.*
             , owner.name as relationship_contact_owner_name
             , created_by.name as relationship_contact_creator_name
             , last_modified_by.name as relationship_contact_last_modified_by_name
        from relationship_contact_transform
             join owner on relationship_contact_transform.relationship_contact_owner_id = owner.user_id
             join created_by on relationship_contact_transform.relationship_contact_created_by_id = created_by.user_id
             join last_modified_by on relationship_contact_transform.relationship_contact_last_modified_by_id = last_modified_by.user_id
)

/*clean select*/
select * from final