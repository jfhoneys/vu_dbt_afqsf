with aqb__matchlink__c as ( select * from {{ source('sfdc_aqb','aqb__matchlink__c') }}
), 
final 
as ( select  
 trim(id) as aqb__matchlink__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__matchedgift__c) as aqb__matchedgift__c
,aqb__counter__c as aqb__counter__c
,aqb__matchpaymentsdue__c as aqb__matchpaymentsdue__c
,aqb__matchpaymentsmade__c as aqb__matchpaymentsmade__c
,trim(aqb__matchinggift__c) as aqb__matchinggift__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,aqb__dateofmatch__c as aqb__dateofmatch__c
,trim(aqb__designationofmatch__c) as aqb__designationofmatch__c
,trim(aqb__matchedaccount__c) as aqb__matchedaccount__c
,trim(aqb__matchingaccount__c) as aqb__matchingaccount__c
,trim(aqb__matchingtransaction__c) as aqb__matchingtransaction__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__matchlink__c
) 
select * from final 
