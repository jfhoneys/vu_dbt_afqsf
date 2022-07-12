with aqb__research_reference__c as ( select * from {{ source('sfdc_aqb','aqb__research_reference__c') }}
), 
final 
as ( select  
 trim(id) as aqb__research_reference__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__date_of_research__c as aqb__date_of_research__c
,trim(aqb__issue__c) as aqb__issue__c
,trim(aqb__notes__c) as aqb__notes__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__page__c) as aqb__page__c
,trim(aqb__requestedby__c) as aqb__requestedby__c
,aqb__requesteddate__c as aqb__requesteddate__c
,trim(aqb__researcher__c) as aqb__researcher__c
,aqb__resourcedate__c as aqb__resourcedate__c
,trim(aqb__resource__c) as aqb__resource__c
,trim(aqb__status__c) as aqb__status__c
,trim(aqb__volume__c) as aqb__volume__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__engagementscorecategory__c) as aqb__engagementscorecategory__c
,aqb__engagementscoreoverride__c as aqb__engagementscoreoverride__c
,aqb__engagementscore__c as aqb__engagementscore__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__research_reference__c
) 
select * from final 
