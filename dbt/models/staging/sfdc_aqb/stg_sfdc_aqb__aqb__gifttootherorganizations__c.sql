with aqb__gifttootherorganizations__c as ( select * from {{ source('sfdc_aqb','aqb__gifttootherorganizations__c') }}
), 
final 
as ( select  
 trim(id) as aqb__gifttootherorganizations__c_id
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
,aqb__amountofgift__c as aqb__amountofgift__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__dateofgift__c as aqb__dateofgift__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__designationofgift__c) as aqb__designationofgift__c
,aqb__evaluation_date__c as aqb__evaluation_date__c
,trim(aqb__lastverifiedby__c) as aqb__lastverifiedby__c
,aqb__lastverifiedon__c as aqb__lastverifiedon__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__recipientorganizationlocation__c) as aqb__recipientorganizationlocation__c
,trim(aqb__recipientorganization__c) as aqb__recipientorganization__c
,trim(aqb__source__c) as aqb__source__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__gifttootherorganizations__c
) 
select * from final 
