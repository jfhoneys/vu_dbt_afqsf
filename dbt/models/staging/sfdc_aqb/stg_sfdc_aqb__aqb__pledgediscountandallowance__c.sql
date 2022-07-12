with aqb__pledgediscountandallowance__c as ( select * from {{ source('sfdc_aqb','aqb__pledgediscountandallowance__c') }}
), 
final 
as ( select  
 trim(id) as aqb__pledgediscountandallowance__c_id
,isdeleted as isdeleted
,trim(name) as name
,trim(setupownerid) as setupownerid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,aqb__balancedueage0__c as aqb__balancedueage0__c
,aqb__balancedueage10__c as aqb__balancedueage10__c
,aqb__balancedueage1__c as aqb__balancedueage1__c
,aqb__balancedueage2__c as aqb__balancedueage2__c
,aqb__balancedueage3__c as aqb__balancedueage3__c
,aqb__balancedueage4__c as aqb__balancedueage4__c
,aqb__balancedueage5__c as aqb__balancedueage5__c
,aqb__balancedueage6__c as aqb__balancedueage6__c
,aqb__balancedueage7__c as aqb__balancedueage7__c
,aqb__balancedueage8__c as aqb__balancedueage8__c
,aqb__balancedueage9__c as aqb__balancedueage9__c
,aqb__currentfyyearpledgediscountrate__c as aqb__currentfyyearpledgediscountrate__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__pledgediscountandallowance__c
) 
select * from final 
