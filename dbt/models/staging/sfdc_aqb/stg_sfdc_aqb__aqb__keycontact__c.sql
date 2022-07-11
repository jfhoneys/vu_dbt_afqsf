with aqb__keycontact__c as ( select * from {{ source('sfdc_aqb','aqb__keycontact__c') }}
), 
final 
as ( select  
 trim(id) as aqb__keycontact__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__relatedchartofaccountitem__c) as aqb__relatedchartofaccountitem__c
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__contactid__c) as aqb__contactid__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__levelofanonmity__c) as aqb__levelofanonmity__c
,trim(aqb__note__c) as aqb__note__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__role__c) as aqb__role__c
,trim(aqb__sortname__c) as aqb__sortname__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqc_stewardee_level__c) as aqc_stewardee_level__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__keycontact__c
) 
select * from final 
