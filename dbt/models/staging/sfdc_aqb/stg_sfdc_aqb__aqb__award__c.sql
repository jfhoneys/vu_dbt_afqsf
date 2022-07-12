with aqb__award__c as ( select * from {{ source('sfdc_aqb','aqb__award__c') }}
), 
final 
as ( select  
 trim(id) as aqb__award__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__awardterms__c) as aqb__awardterms__c
,trim(aqb__awardtype__c) as aqb__awardtype__c
,trim(aqb__awardedby__c) as aqb__awardedby__c
,aqb__dateoffirstaward__c as aqb__dateoffirstaward__c
,aqb__dateoflastaward__c as aqb__dateoflastaward__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__llchartofaccountsid__c) as aqb__llchartofaccountsid__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__termofaward__c) as aqb__termofaward__c
,aqb__totalamountawarded__c as aqb__totalamountawarded__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqc_project_code__c) as aqc_project_code__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__award__c
) 
select * from final 
