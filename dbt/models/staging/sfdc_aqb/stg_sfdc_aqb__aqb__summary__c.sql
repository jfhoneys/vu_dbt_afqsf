with aqb__summary__c as ( select * from {{ source('sfdc_aqb','aqb__summary__c') }}
), 
final 
as ( select  
 trim(id) as aqb__summary__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__comment__c) as aqb__comment__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__count__c as aqb__count__c
,aqb__currency__c as aqb__currency__c
,aqb__date__c as aqb__date__c
,trim(aqb__giftrecognitioncredit__c) as aqb__giftrecognitioncredit__c
,trim(aqb__gift__c) as aqb__gift__c
,trim(aqb__givinglevel__c) as aqb__givinglevel__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__summaries_definition__c) as aqb__summaries_definition__c
,trim(aqb__transaction__c) as aqb__transaction__c
,aqb__year__c as aqb__year__c
,aqb__enddate__c as aqb__enddate__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__displayyear__c) as aqb__displayyear__c
,trim(aqb__engagementscorecategory__c) as aqb__engagementscorecategory__c
,aqb__engagementscoreoverride__c as aqb__engagementscoreoverride__c
,aqb__engagementscore__c as aqb__engagementscore__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__summary__c
) 
select * from final 
