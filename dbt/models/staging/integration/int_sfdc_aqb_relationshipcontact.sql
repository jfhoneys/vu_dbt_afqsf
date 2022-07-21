with relationshipcontact as (select * from  {{ ref ('stg_sfdc_aqb__aqb__relationshipcontact__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

relationshipcontact_transform as 
(select 
relationshipaccount.aqb__relationshipaccount__c_id as relationshipaccount_relationshipaccount_id
--, relationshipaccount.ownerid as relationshipaccount_ownerid
--, relationshipaccount.isdeleted as relationshipaccount_isdeleted
, relationshipaccount.name as relationshipaccount_name
, relationshipaccount.recordtypeid as relationshipaccount_recordtypeid
--, relationshipaccount.createddate as relationshipaccount_createddate
--, relationshipaccount.createdbyid as relationshipaccount_createdbyid
--, relationshipaccount.lastmodifieddate as relationshipaccount_lastmodifieddate
--, relationshipaccount.lastmodifiedbyid as relationshipaccount_lastmodifiedbyid
--, relationshipaccount.systemmodstamp as relationshipaccount_systemmodstamp
, relationshipaccount.aqb__accountid__c as relationshipaccount_accountid
, relationshipaccount.aqb__accountrolegroup__c as relationshipaccount_accountrolegroup
, relationshipaccount.aqb__accountrole__c as relationshipaccount_accountrole
, relationshipaccount.aqb__awardsoftcredit__c as relationshipaccount_awardsoftcredit
--, relationshipaccount.aqb__enddate__c as relationshipaccount_enddate
--, relationshipaccount.aqb__ended__c as relationshipaccount_ended
--, relationshipaccount.aqb__givesoftcredit__c as relationshipaccount_givesoftcredit
--, relationshipaccount.aqb__linkedrelationship__c as relationshipaccount_linkedrelationship
--, relationshipaccount.aqb__ownerunit__c as relationshipaccount_ownerunit
, relationshipaccount.aqb__relatedaccountrole__c as relationshipaccount_relatedaccountrole
, relationshipaccount.aqb__relatedaccount__c as relationshipaccount_relatedaccount
, relationshipaccount.aqb__relatedto__c as relationshipaccount_relatedto
, relationshipaccount.aqb__relationshippair__c as relationshipaccount_relationshippair
, relationshipaccount.aqb__source__c as relationshipaccount_source
, relationshipaccount.aqb__startdate__c as relationshipaccount_startdate
, relationshipaccount.aqb__started__c as relationshipaccount_started
, relationshipaccount.aqcv_conversionid__c as relationshipaccount_aqcv_conversionid
, relationshipaccount.matillion_batch_id as relationshipaccount_matillion_batch_id
, relationshipaccount.matillion_updated_timestamp as relationshipaccount_matillion_updated_timestamp
, relationshipaccount.source_name as relationshipaccount_source_name
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

    
