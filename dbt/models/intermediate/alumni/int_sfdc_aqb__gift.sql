with gift as (select * from  {{ ref ('stg_sfdc_aqb__aqb__gift__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

gift_transform as (
    select gift.aqb__gift__c_id as gift_id
-- , gift.isdeleted as gift_isdeleted
, gift.name as gift_name
, gift.recordtypeid as gift_record_type_id
-- , gift.createddate as gift_createddate
, gift.createdbyid as gift_created_by_id
-- , gift.lastmodifieddate as gift_lastmodifieddate
, gift.lastmodifiedbyid as gift_last_modified_by_id
-- , gift.systemmodstamp as gift_systemmodstamp
-- , gift.lastactivitydate as gift_lastactivitydate
-- , gift.lastvieweddate as gift_lastvieweddate
-- , gift.lastreferenceddate as gift_lastreferenceddate
, gift.aqb__account__c as gift_account
, gift.aqb__accountid__c as gift_account_id
, gift.aqb__acknowledgement__c as gift_acknowledgement
, gift.aqb__alert__c as gift_alert
-- , gift.aqb__annualreceipt__c as gift_annualreceipt
-- , gift.aqb__anonymitylevel__c as gift_anonymitylevel
, gift.aqb__anonymous__c as gift_anonymous
-- , gift.aqb__approvereceipt__c as gift_approvereceipt
-- , gift.aqb__bypassgiftrecognitionlogic__c as gift_bypassgiftrecognitionlogic
-- , gift.aqb__campaigndifferent__c as gift_campaigndifferent
, gift.aqb__campaignfund__c as gift_campaign_fund
, gift.aqb__category__c as gift_category
, gift.aqb__conditionalpledge__c as gift_conditional_pledge
, gift.aqb__creditedopportunity__c as gift_credited_opportunity
, gift.aqb__date__c as gift_date
, gift.aqb__doc_link__c as gift_doc_link
-- , gift.aqb__donoraccount__c as gift_donoraccount
-- , gift.aqb__fundraisingcampaigntext__c as gift_fundraisingcampaigntext
-- , gift.aqb__giftdescription__c as gift_giftdescription
-- , gift.aqb__giftexternalid__c as gift_giftexternalid
, gift.aqb__gift_count__c as gift_count
-- , gift.aqb__hard_credit_gift_recogntion__c as gift_hard_credit_gift_recogntion
-- , gift.aqb__includeconditionalpledgeintotal__c as gift_includeconditionalpledgeintotal
-- , gift.aqb__includematchdueintotal__c as gift_includematchdueintotal
-- , gift.aqb__includematchpaidintotal__c as gift_includematchpaidintotal
-- , gift.aqb__includeunconditionalpledgeintotal__c as gift_includeunconditionalpledgeintotal
-- , gift.aqb__initialnetpresentvalue__c as gift_initialnetpresentvalue
-- , gift.aqb__initialnetpresentvalueofopportunity__c as gift_initialnetpresentvalueofopportunity
, gift.aqb__instrument__c as gift_instrument
-- , gift.aqb__ispaymentrolled__c as gift_ispaymentrolled
-- , gift.aqb__matchlink__c as gift_matchlink
-- , gift.aqb__matchedaccount__c as gift_matchedaccount
, gift.aqb__matched__c as gift_matched
-- , gift.aqb__matchinggiftpaymentsdue__c as gift_matchinggiftpaymentsdue
-- , gift.aqb__matchinggiftpaymentsmade__c as gift_matchinggiftpaymentsmade
-- , gift.aqb__maturitydate__c as gift_maturitydate
-- , gift.aqb__noreceipt__c as gift_noreceipt
-- , gift.aqb__numberofpayments__c as gift_numberofpayments
-- , gift.aqb__originatinggiftstatus__c as gift_originatinggiftstatus
-- , gift.aqb__originatinggift__c as gift_originatinggift
-- , gift.aqb__ownerunit__c as gift_ownerunit
-- , gift.aqb__payments__c as gift_payments
-- , gift.aqb__pledgebalanceconditional__c as gift_pledgebalanceconditional
, gift.aqb__pledgebalancetotal__c as gift_pledge_balance_total
-- , gift.aqb__pledgebalanceunconditional__c as gift_pledgebalanceunconditional
, gift.aqb__pledgeenddate__c as gift_pledge_end_date
-- , gift.aqb__pledgefrequency__c as gift_pledgefrequency
-- , gift.aqb__pledgeinterval__c as gift_pledgeinterval
-- , gift.aqb__pledgescheduletype__c as gift_pledgescheduletype
, gift.aqb__pledgestartdate__c as gift_pledge_start_date
-- , gift.aqb__proportionalgiftcredit__c as gift_proportionalgiftcredit
-- , gift.aqb__receiptcount__c as gift_receiptcount
-- , gift.aqb__recurringgiftlink__c as gift_recurringgiftlink
-- , gift.aqb__restrictedtotal__c as gift_restrictedtotal
-- , gift.aqb__revocable__c as gift_revocable
-- , gift.aqb__rolluppledgebalancetotal__c as gift_rolluppledgebalancetotal
-- , gift.aqb__samecampaign__c as gift_samecampaign
-- , gift.aqb__setup__c as gift_setup
-- , gift.aqb__softcredit__c as gift_softcredit
-- , gift.aqb__statusabbr__c as gift_statusabbr
-- , gift.aqb__status__c as gift_status
-- , gift.aqb__taxamount__c as gift_taxamount
-- , gift.aqb__testamentary__c as gift_testamentary
, gift.aqb__totalassetamount__c as gift_total_asset_amount
, gift.aqb__totalgift__c as gift_total_gift
, gift.aqb__type__c as gift_type
-- , gift.aqb__unrestrictedtotal__c as gift_unrestrictedtotal
, gift.aqb__dateoflastpledgepayment__c as gift_date_of_last_pledge_payment
, gift.aqb__nextpledgeduedate__c as gift_next_pledge_due_date
-- , gift.aqb__numberofopentransactions__c as gift_numberofopentransactions
, gift.aqb__originalpledgedamount__c as gift_original_pledged_amount
-- , gift.aqb__rollupmatchinggiftpaymentsdue__c as gift_rollupmatchinggiftpaymentsdue
-- , gift.aqb__rollupmatchinggiftpaymentsmade__c as gift_rollupmatchinggiftpaymentsmade
-- , gift.aqb__rolluppayments__c as gift_rolluppayments
-- , gift.aqb__rolluppledgebalanceconditional__c as gift_rolluppledgebalanceconditional
-- , gift.aqb__rolluppledgebalanceunconditional__c as gift_rolluppledgebalanceunconditional
-- , gift.aqb__rolluprestrictedtotal__c as gift_rolluprestrictedtotal
-- , gift.aqcv_conversionid__c as gift_aqcv_conversionid
-- , gift.aqc_annual_fund__c as gift_aqc_annual_fund
-- , gift.aqb__additionalnewgift__c as gift_additionalnewgift
, gift.aqb__originalamountpledged__c as gift_original_amount_pledged
-- , gift.aqb__relatedpledge__c as gift_relatedpledge
-- , gift.aqb__pledgewriteofftotal__c as gift_pledgewriteofftotal
, gift.school_unit__c as gift_school_unit
, gift.vu_fiscal_year__c as gift_vu_fiscal_year
, gift.aqc_originalpledgeamount__c as gift_aqc_original_pledge_amount
, gift.vu_fiscal_month_abbr_c__c as gift_vu_fiscal_month_abbr_c
-- , gift.aqc_originalpledgeamountfrm__c as gift_aqc_originalpledgeamountfrm
-- , gift.aqb__designationtext__c as gift_designationtext
-- , gift.vud_total_c__c as gift_vud_total_c
, gift.matillion_batch_id as gift_matillion_batch_id
, gift.matillion_updated_timestamp as gift_matillion_updated_timestamp
, gift.source_name as gift_source_name
    from gift
    ),

final as (select
             gift_transform.*
            -- , owner.name as gift_owner_name
             , created_by.name as gift_creator_name
             , last_modified_by.name as gift_last_modified_by_name
        from gift_transform
          --   join owner on gift_transform.gift_owner_id = owner.user_id
             join created_by on gift_transform.gift_created_by_id = created_by.user_id
             join last_modified_by on gift_transform.gift_last_modified_by_id = last_modified_by.user_id
)
select * from final
