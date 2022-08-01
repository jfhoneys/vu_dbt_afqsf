{{  config(  materialized='view', 
   ) 
 }}


with relationship_account as (select * from  {{ ref ('stg_sfdc_aqb__aqb__relationshipaccount__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

relationship_account_transform as
(select
 relationship_account.aqb__relationshipaccount__c_id as relationship_account_id
, relationship_account.name as relationship_account_name
, relationship_account.recordtypeid as relationship_account_record_type_id
, relationship_account.aqb__accountid__c as relationship_account_account_id
, relationship_account.aqb__accountrolegroup__c as relationship_account_account_group
, relationship_account.aqb__accountrole__c as relationship_account_account_role
, relationship_account.aqb__awardsoftcredit__c as relationship_account_awards_of_tcredit
, relationship_account.aqb__enddate__c as relationship_account_end_date
, relationship_account.aqb__ended__c as relationship_account_ended
, relationship_account.aqb__givesoftcredit__c as relationship_account_gives_of_tcredit
, relationship_account.aqb__linkedrelationship__c as relationship_account_linked_relationship
, relationship_account.aqb__ownerunit__c as relationship_account_owner_unit
, relationship_account.aqb__relatedaccountrole__c as relationship_account_related_account_role
, relationship_account.aqb__relatedaccount__c as relationship_account_related_account
, relationship_account.aqb__relatedto__c as relationship_account_related_to
, relationship_account.aqb__relationshippair__c as relationship_account_relationship_pair
, relationship_account.aqb__source__c as relationship_account_source
, relationship_account.aqb__startdate__c as relationship_account_start_date
, relationship_account.aqb__started__c as relationship_account_started
, relationship_account.aqcv_conversionid__c as relationship_account_aqcv_conversion_id
-- Our standard columns for the end 
, relationship_account.ownerid as relationship_account_owner_id
, relationship_account.isdeleted as relationship_account_is_deleted
, relationship_account.lastmodifieddate as relationship_account_last_modified_date
, relationship_account.lastmodifiedbyid as relationship_account_last_modified_by_id
, relationship_account.systemmodstamp as relationship_account_system_modstamp
, relationship_account.createdbyid as relationship_account_created_by_id
, relationship_account.matillion_batch_id as relationship_account_matillion_batch_id
, relationship_account.matillion_updated_timestamp as relationship_account_matillion_updated_timestamp
, relationship_account.source_name as relationship_account_source_name
   from relationship_account
   ), 

final as (select -- select count(1) as cnt from trans
             relationship_account_transform.*
             , owner.name as relationship_account_owner_name
             , created_by.name as relationship_account_creator_name
             , last_modified_by.name as relationship_account_last_modified_by_name
        from relationship_account_transform
             join owner on relationship_account_transform.relationship_account_owner_id = owner.user_id
             join created_by on relationship_account_transform.relationship_account_created_by_id = created_by.user_id
             join last_modified_by on relationship_account_transform.relationship_account_last_modified_by_id = last_modified_by.user_id
)

/*clean select*/
select * from final