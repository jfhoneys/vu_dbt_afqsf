with aqb__gift__c as ( select * from {{ source('sfdc_aqb','aqb__gift__c') }}
), 
final 
as ( select  
 trim(id) as aqb__gift__c_id
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__accountid__c) as aqb__accountid__c
,trim(aqb__acknowledgement__c) as aqb__acknowledgement__c
,trim(aqb__alert__c) as aqb__alert__c
,aqb__annualreceipt__c as aqb__annualreceipt__c
,trim(aqb__anonymitylevel__c) as aqb__anonymitylevel__c
,aqb__anonymous__c as aqb__anonymous__c
,aqb__approvereceipt__c as aqb__approvereceipt__c
,aqb__bypassgiftrecognitionlogic__c as aqb__bypassgiftrecognitionlogic__c
,aqb__campaigndifferent__c as aqb__campaigndifferent__c
,trim(aqb__campaignfund__c) as aqb__campaignfund__c
,trim(aqb__category__c) as aqb__category__c
,aqb__conditionalpledge__c as aqb__conditionalpledge__c
,trim(aqb__creditedopportunity__c) as aqb__creditedopportunity__c
,aqb__date__c as aqb__date__c
,trim(aqb__doc_link__c) as aqb__doc_link__c
,trim(aqb__donoraccount__c) as aqb__donoraccount__c
,trim(aqb__fundraisingcampaigntext__c) as aqb__fundraisingcampaigntext__c
,trim(aqb__giftdescription__c) as aqb__giftdescription__c
,trim(aqb__giftexternalid__c) as aqb__giftexternalid__c
,aqb__gift_count__c as aqb__gift_count__c
,trim(aqb__hard_credit_gift_recogntion__c) as aqb__hard_credit_gift_recogntion__c
,aqb__includeconditionalpledgeintotal__c as aqb__includeconditionalpledgeintotal__c
,aqb__includematchdueintotal__c as aqb__includematchdueintotal__c
,aqb__includematchpaidintotal__c as aqb__includematchpaidintotal__c
,aqb__includeunconditionalpledgeintotal__c as aqb__includeunconditionalpledgeintotal__c
,aqb__initialnetpresentvalue__c as aqb__initialnetpresentvalue__c
,aqb__initialnetpresentvalueofopportunity__c as aqb__initialnetpresentvalueofopportunity__c
,trim(aqb__instrument__c) as aqb__instrument__c
,aqb__ispaymentrolled__c as aqb__ispaymentrolled__c
,trim(aqb__matchlink__c) as aqb__matchlink__c
,trim(aqb__matchedaccount__c) as aqb__matchedaccount__c
,aqb__matched__c as aqb__matched__c
,aqb__matchinggiftpaymentsdue__c as aqb__matchinggiftpaymentsdue__c
,aqb__matchinggiftpaymentsmade__c as aqb__matchinggiftpaymentsmade__c
,aqb__maturitydate__c as aqb__maturitydate__c
,aqb__noreceipt__c as aqb__noreceipt__c
,aqb__numberofpayments__c as aqb__numberofpayments__c
,trim(aqb__originatinggiftstatus__c) as aqb__originatinggiftstatus__c
,trim(aqb__originatinggift__c) as aqb__originatinggift__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__payments__c as aqb__payments__c
,aqb__pledgebalanceconditional__c as aqb__pledgebalanceconditional__c
,aqb__pledgebalancetotal__c as aqb__pledgebalancetotal__c
,aqb__pledgebalanceunconditional__c as aqb__pledgebalanceunconditional__c
,aqb__pledgeenddate__c as aqb__pledgeenddate__c
,aqb__pledgefrequency__c as aqb__pledgefrequency__c
,trim(aqb__pledgeinterval__c) as aqb__pledgeinterval__c
,trim(aqb__pledgescheduletype__c) as aqb__pledgescheduletype__c
,aqb__pledgestartdate__c as aqb__pledgestartdate__c
,aqb__proportionalgiftcredit__c as aqb__proportionalgiftcredit__c
,aqb__receiptcount__c as aqb__receiptcount__c
,trim(aqb__recurringgiftlink__c) as aqb__recurringgiftlink__c
,aqb__restrictedtotal__c as aqb__restrictedtotal__c
,aqb__revocable__c as aqb__revocable__c
,aqb__rolluppledgebalancetotal__c as aqb__rolluppledgebalancetotal__c
,aqb__samecampaign__c as aqb__samecampaign__c
,trim(aqb__setup__c) as aqb__setup__c
,aqb__softcredit__c as aqb__softcredit__c
,trim(aqb__statusabbr__c) as aqb__statusabbr__c
,trim(aqb__status__c) as aqb__status__c
,aqb__taxamount__c as aqb__taxamount__c
,aqb__testamentary__c as aqb__testamentary__c
,aqb__totalassetamount__c as aqb__totalassetamount__c
,aqb__totalgift__c as aqb__totalgift__c
,trim(aqb__type__c) as aqb__type__c
,aqb__unrestrictedtotal__c as aqb__unrestrictedtotal__c
,aqb__dateoflastpledgepayment__c as aqb__dateoflastpledgepayment__c
,aqb__nextpledgeduedate__c as aqb__nextpledgeduedate__c
,aqb__numberofopentransactions__c as aqb__numberofopentransactions__c
,aqb__originalpledgedamount__c as aqb__originalpledgedamount__c
,aqb__rollupmatchinggiftpaymentsdue__c as aqb__rollupmatchinggiftpaymentsdue__c
,aqb__rollupmatchinggiftpaymentsmade__c as aqb__rollupmatchinggiftpaymentsmade__c
,aqb__rolluppayments__c as aqb__rolluppayments__c
,aqb__rolluppledgebalanceconditional__c as aqb__rolluppledgebalanceconditional__c
,aqb__rolluppledgebalanceunconditional__c as aqb__rolluppledgebalanceunconditional__c
,aqb__rolluprestrictedtotal__c as aqb__rolluprestrictedtotal__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,aqc_annual_fund__c as aqc_annual_fund__c
,trim(aqb__additionalnewgift__c) as aqb__additionalnewgift__c
,aqb__originalamountpledged__c as aqb__originalamountpledged__c
,trim(aqb__relatedpledge__c) as aqb__relatedpledge__c
,aqb__pledgewriteofftotal__c as aqb__pledgewriteofftotal__c
,trim(school_unit__c) as school_unit__c
,trim(vu_fiscal_year__c) as vu_fiscal_year__c
,aqc_originalpledgeamount__c as aqc_originalpledgeamount__c
,trim(vu_fiscal_month_abbr_c__c) as vu_fiscal_month_abbr_c__c
,aqc_originalpledgeamountfrm__c as aqc_originalpledgeamountfrm__c
,trim(aqb__designationtext__c) as aqb__designationtext__c
,vud_total_c__c as vud_total_c__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__gift__c
) 
select * from final 