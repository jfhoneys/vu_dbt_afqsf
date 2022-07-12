with aqb__batchitemrecognition__c as ( select * from {{ source('sfdc_aqb','aqb__batchitemrecognition__c') }}
), 
final 
as ( select  
 trim(id) as aqb__batchitemrecognition__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__batchitemid__c) as aqb__batchitemid__c
,aqb__anonymous__c as aqb__anonymous__c
,trim(aqb__batchitemreferenceid__c) as aqb__batchitemreferenceid__c
,trim(aqb__contactid__c) as aqb__contactid__c
,trim(aqb__creditedopportunity__c) as aqb__creditedopportunity__c
,trim(aqb__donoraccount__c) as aqb__donoraccount__c
,trim(aqb__fundraisingcampaign__c) as aqb__fundraisingcampaign__c
,aqb__giftdate__c as aqb__giftdate__c
,trim(aqb__giftdescription__c) as aqb__giftdescription__c
,aqb__matched__c as aqb__matched__c
,aqb__payments__c as aqb__payments__c
,aqb__primarygiftrecognitioncreditpercent__c as aqb__primarygiftrecognitioncreditpercent__c
,aqb__primaryrecognitionamount__c as aqb__primaryrecognitionamount__c
,aqb__proportionalgiftcredit__c as aqb__proportionalgiftcredit__c
,aqb__secondarygiftrecognitioncreditpercent__c as aqb__secondarygiftrecognitioncreditpercent__c
,aqb__secondaryrecognitionamount__c as aqb__secondaryrecognitionamount__c
,aqb__signator__c as aqb__signator__c
,aqb__totalrecognitioncredit__c as aqb__totalrecognitioncredit__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__linktobatchitemtransaction__c) as aqb__linktobatchitemtransaction__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__batchitemrecognition__c
) 
select * from final 
