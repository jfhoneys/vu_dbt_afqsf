with aqb__giftcredit__c as ( select * from {{ source('sfdc_aqb','aqb__giftcredit__c') }}
), 
final 
as ( select  
 trim(id) as aqb__giftcredit__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__alert__c) as aqb__alert__c
,aqb__anonymous__c as aqb__anonymous__c
,trim(aqb__campaignfund__c) as aqb__campaignfund__c
,trim(aqb__contactid__c) as aqb__contactid__c
,trim(aqb__creditedopportunity__c) as aqb__creditedopportunity__c
,trim(aqb__donoraccount__c) as aqb__donoraccount__c
,aqb__giftdate__c as aqb__giftdate__c
,trim(aqb__giftdescription__c) as aqb__giftdescription__c
,trim(aqb__giftid__c) as aqb__giftid__c
,aqb__gift_recognition_credit_count__c as aqb__gift_recognition_credit_count__c
,aqb__isprocessed__c as aqb__isprocessed__c
,aqb__matched__c as aqb__matched__c
,aqb__matchinggiftpaymentsdue__c as aqb__matchinggiftpaymentsdue__c
,aqb__matchinggiftpaymentsmade__c as aqb__matchinggiftpaymentsmade__c
,aqb__nextpledgeduedate__c as aqb__nextpledgeduedate__c
,aqb__numberofgiftcreditsawarded__c as aqb__numberofgiftcreditsawarded__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__payments__c as aqb__payments__c
,aqb__pledgebalanceconditional__c as aqb__pledgebalanceconditional__c
,aqb__pledgebalancetotal__c as aqb__pledgebalancetotal__c
,aqb__pledgebalanceunconditional__c as aqb__pledgebalanceunconditional__c
,aqb__primarygiftcreditamount__c as aqb__primarygiftcreditamount__c
,aqb__primarygiftrecognitioncreditpercent__c as aqb__primarygiftrecognitioncreditpercent__c
,aqb__proportionalgiftcredit__c as aqb__proportionalgiftcredit__c
,aqb__restrictedtotal__c as aqb__restrictedtotal__c
,aqb__secondarygiftcreditamount__c as aqb__secondarygiftcreditamount__c
,aqb__secondarygiftrecognitioncreditpercent__c as aqb__secondarygiftrecognitioncreditpercent__c
,aqb__signator__c as aqb__signator__c
,trim(aqb__statusabr__c) as aqb__statusabr__c
,trim(aqb__status__c) as aqb__status__c
,aqb__totalrecognitioncredit__c as aqb__totalrecognitioncredit__c
,aqb__unrestrictedtotal__c as aqb__unrestrictedtotal__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__engagementscorecategory__c) as aqb__engagementscorecategory__c
,aqb__engagementscoreoverride__c as aqb__engagementscoreoverride__c
,aqb__engagementscore__c as aqb__engagementscore__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__giftcredit__c
) 
select * from final 
