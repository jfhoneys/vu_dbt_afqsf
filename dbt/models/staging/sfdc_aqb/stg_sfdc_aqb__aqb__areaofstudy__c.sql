with aqb__areaofstudy__c as ( select * from {{ source('sfdc_aqb','aqb__areaofstudy__c') }}
), 
final 
as ( select  
 trim(id) as aqb__areaofstudy__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__education__c) as aqb__education__c
,trim(aqb__areaofstudy__c) as aqb__areaofstudy__c
,trim(aqb__concentrationlevel__c) as aqb__concentrationlevel__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__degreeincludesthisconcentration__c as aqb__degreeincludesthisconcentration__c
,trim(aqb__endyear__c) as aqb__endyear__c
,trim(aqb__institution__c) as aqb__institution__c
,aqb__primaryareaofstudy__c as aqb__primaryareaofstudy__c
,trim(aqb__startyear__c) as aqb__startyear__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__areaofstudy__c
) 
select * from final 
