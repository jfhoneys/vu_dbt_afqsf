with opportunity as (select * from  {{ ref ('stg_sfdc_aqb__opportunity')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

opportunity_transform as
(select
opportunity.opportunity_id as opportunity_id
-- , opportunity.isdeleted as opportunity_isdeleted
, opportunity.accountid as opportunity_accountid
, opportunity.recordtypeid as opportunity_recordtypeid
-- , opportunity.isprivate as opportunity_isprivate
, opportunity.name as opportunity_name
-- , opportunity.description as opportunity_description
, opportunity.stagename as opportunity_stagename
, opportunity.amount as opportunity_amount
, opportunity.probability as opportunity_probability
, opportunity.expectedrevenue as opportunity_expectedrevenue
-- , opportunity.totalopportunityquantity as opportunity_totalopportunityquantity
, opportunity.closedate as opportunity_closedate
-- , opportunity.type as opportunity_type
-- , opportunity.nextstep as opportunity_nextstep
-- , opportunity.leadsource as opportunity_leadsource
, opportunity.isclosed as opportunity_isclosed
, opportunity.iswon as opportunity_iswon
, opportunity.forecastcategory as opportunity_forecastcategory
-- , opportunity.forecastcategoryname as opportunity_forecastcategoryname
-- , opportunity.campaignid as opportunity_campaignid
-- , opportunity.hasopportunitylineitem as opportunity_hasopportunitylineitem
-- , opportunity.pricebook2id as opportunity_pricebook2id
, opportunity.ownerid as opportunity_ownerid
-- , opportunity.createddate as opportunity_createddate
, opportunity.createdbyid as opportunity_createdbyid
-- , opportunity.lastmodifieddate as opportunity_lastmodifieddate
, opportunity.lastmodifiedbyid as opportunity_lastmodifiedbyid
-- , opportunity.systemmodstamp as opportunity_systemmodstamp
-- , opportunity.lastactivitydate as opportunity_lastactivitydate
, opportunity.fiscalquarter as opportunity_fiscalquarter
, opportunity.fiscalyear as opportunity_fiscalyear
-- , opportunity.fiscal as opportunity_fiscal
-- , opportunity.contactid as opportunity_contactid
-- , opportunity.lastvieweddate as opportunity_lastvieweddate
-- , opportunity.lastreferenceddate as opportunity_lastreferenceddate
-- , opportunity.syncedquoteid as opportunity_syncedquoteid
-- , opportunity.contractid as opportunity_contractid
-- , opportunity.hasopenactivity as opportunity_hasopenactivity
-- , opportunity.hasoverduetask as opportunity_hasoverduetask
-- , opportunity.lastamountchangedhistoryid as opportunity_lastamountchangedhistoryid
-- , opportunity.lastclosedatechangedhistoryid as opportunity_lastclosedatechangedhistoryid
-- , opportunity.budget_confirmed__c as opportunity_budget_confirmed
-- , opportunity.discovery_completed__c as opportunity_discovery_completed
-- , opportunity.roi_analysis_completed__c as opportunity_roi_analysis_completed
-- , opportunity.aqb__accountrating__c as opportunity_accountrating
-- , opportunity.loss_reason__c as opportunity_loss_reason
-- , opportunity.aqb__alert__c as opportunity_alert
, opportunity.aqb__anonymous__c as opportunity_anonymous
-- , opportunity.aqb__campaignfund__c as opportunity_campaignfund
, opportunity.aqb__capacity__c as opportunity_capacity
-- , opportunity.aqb__capitalgain__c as opportunity_capitalgain
-- , opportunity.aqb__charitablededuction__c as opportunity_charitablededuction
-- , opportunity.aqb__comment__c as opportunity_comment
-- , opportunity.aqb__costbasis__c as opportunity_costbasis
-- , opportunity.aqb__currentstagetracklink__c as opportunity_currentstagetracklink
, opportunity.aqb__dateproposalsubmitted__c as opportunity_dateproposalsubmitted
, opportunity.aqb__daysincurentstage__c as opportunity_daysincurentstage
-- , opportunity.aqb__deadline__c as opportunity_deadline
-- , opportunity.aqb__determinationdate__c as opportunity_determinationdate
, opportunity.aqb__donotcontact__c as opportunity_donotcontact
-- , opportunity.aqb__earlieststartdate__c as opportunity_earlieststartdate
-- , opportunity.aqb__finishyear__c as opportunity_finishyear
-- , opportunity.aqb__firstpaymentdate__c as opportunity_firstpaymentdate
, opportunity.aqb__fundingcomplete__c as opportunity_fundingcomplete
-- , opportunity.aqb__fundraisingcampaign__c as opportunity_fundraisingcampaign
-- , opportunity.aqb__giftamount__c as opportunity_giftamount
-- , opportunity.aqb__giftdate__c as opportunity_giftdate
-- , opportunity.aqb__giftsubtype__c as opportunity_giftsubtype
-- , opportunity.aqb__goalamount__c as opportunity_goalamount
-- , opportunity.aqb__goalyear__c as opportunity_goalyear
-- , opportunity.aqb__goal_type__c as opportunity_goal_type
-- , opportunity.aqb__irsdiscouintrate__c as opportunity_irsdiscouintrate
-- , opportunity.aqb__includeinstageaverage__c as opportunity_includeinstageaverage
-- , opportunity.aqb__initialnetpresentvalue__c as opportunity_initialnetpresentvalue
-- , opportunity.aqb__institutionalunit__c as opportunity_institutionalunit
, opportunity.aqb__instrument__c as opportunity_instrument
-- , opportunity.aqb__kpichart1__c as opportunity_kpichart1
-- , opportunity.aqb__kpichart2__c as opportunity_kpichart2
-- , opportunity.aqb__kpichartsize__c as opportunity_kpichartsize
-- , opportunity.aqb__lastactivityformula__c as opportunity_lastactivityformula
-- , opportunity.aqb__lateststartdate__c as opportunity_lateststartdate
-- , opportunity.aqb__marketvaluedate__c as opportunity_marketvaluedate
-- , opportunity.aqb__marketvalue__c as opportunity_marketvalue
-- , opportunity.aqb__maturitydate__c as opportunity_maturitydate
-- , opportunity.aqb__monthstopayment__c as opportunity_monthstopayment
-- , opportunity.aqb__nextactivitydate__c as opportunity_nextactivitydate
-- , opportunity.aqb__nextactivity__c as opportunity_nextactivity
-- , opportunity.aqb__omi__c as opportunity_omi
-- , opportunity.aqb__opportunityexternalid__c as opportunity_opportunityexternalid
-- , opportunity.aqb__opportunitymanagementindex__c as opportunity_opportunitymanagementindex
-- , opportunity.aqb__ownerunit__c as opportunity_ownerunit
-- , opportunity.aqb__readiness__c as opportunity_readiness
-- , opportunity.aqb__remainder__c as opportunity_remainder
-- , opportunity.aqb__revocable__c as opportunity_revocable
, opportunity.aqb__stagedate__c as opportunity_stagedate
-- , opportunity.aqb__strategy__c as opportunity_strategy
-- , opportunity.aqb__taxamount__c as opportunity_taxamount
, opportunity.aqb__totalassetamount__c as opportunity_totalassetamount
-- , opportunity.aqcv_conversionid__c as opportunity_aqcv_conversionid
, opportunity.total_funded_amount__c as opportunity_total_funded_amount
-- , opportunity.aqc_businessplanprospect__c as opportunity_aqc_businessplanprospect
-- , opportunity.aqc_loss_reason__c as opportunity_aqc_loss_reason
-- , opportunity.vu_opportunity_owner_name__c as opportunity_vu_opportunity_owner_name
-- , opportunity.aqc_fiscal_year_top_propsect__c as opportunity_aqc_fiscal_year_top_propsect
-- , opportunity.activity_report_identification__c as opportunity_activity_report_identification
-- , opportunity.activity_report_qualification__c as opportunity_activity_report_qualification
-- , opportunity.activity_report_verbal_proposal__c as opportunity_activity_report_verbal_proposal
-- , opportunity.affinity_rating__c as opportunity_affinity_rating
-- , opportunity.anticipated_ask_amount__c as opportunity_anticipated_ask_amount
-- , opportunity.anticipated_ask_date__c as opportunity_anticipated_ask_date
-- , opportunity.ask_amount__c as opportunity_ask_amount
-- , opportunity.ask_date__c as opportunity_ask_date
-- , opportunity.closing_comments__c as opportunity_closing_comments
-- , opportunity.funding_type__c as opportunity_funding_type
-- , opportunity.reason__c as opportunity_reason
-- , opportunity.research_needed__c as opportunity_research_needed
-- , opportunity.verbal_commitment__c as opportunity_verbal_commitment
-- , opportunity.volunteer_indicator__c as opportunity_volunteer_indicator
-- , opportunity.aqb__fee1exception_aq__c as opportunity_fee1exception_aq
-- , opportunity.aqb__fee1exemptreason_aq__c as opportunity_fee1exemptreason_aq
-- , opportunity.aqb__fee1exempt_aq__c as opportunity_fee1exempt_aq
-- , opportunity.aqb__fee1sourceaccount_aq__c as opportunity_fee1sourceaccount_aq
-- , opportunity.aqb__fee1_aq__c as opportunity_fee1_aq
-- , opportunity.aqb__fee2exception_aq__c as opportunity_fee2exception_aq
-- , opportunity.aqb__fee2exemptreason_aq__c as opportunity_fee2exemptreason_aq
-- , opportunity.aqb__fee2exempt_aq__c as opportunity_fee2exempt_aq
-- , opportunity.aqb__fee2sourceaccount_aq__c as opportunity_fee2sourceaccount_aq
-- , opportunity.aqb__fee2_aq__c as opportunity_fee2_aq
, opportunity.matillion_batch_id as opportunity_matillion_batch_id
, opportunity.matillion_updated_timestamp as opportunity_matillion_updated_timestamp
, opportunity.source_name as opportunity_source_name
    from opportunity
    ),

final as (select 
             opportunity_transform.*
             , owner.name as opportunity_owner_name
             , created_by.name as opportunity_creator_name
             , last_modified_by.name as opportunity_last_modified_by_name
        from opportunity_transform
             join owner on opportunity_transform.opportunity_ownerid = owner.user_id
             join created_by on opportunity_transform.opportunity_createdbyid = created_by.user_id
             join last_modified_by on opportunity_transform.opportunity_lastmodifiedbyid = last_modified_by.user_id
)
select * from final

