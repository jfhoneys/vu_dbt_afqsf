with registration as (select * from  {{ ref ('stg_sfdc_aqb__aqb__registration__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

registration_trnsfrm as (
    select 
        trim(aqb__registration__c_id) as registration_id
        ,isdeleted as reg_is_deleted
        ,trim(name) as reg_name
        ,trim(recordtypeid) as record_type_id
        ,createddate as created_date
        ,trim(createdbyid) as reg_created_by_id
        ,lastmodifieddate as reg_last_modified_date
        ,trim(lastmodifiedbyid) as reg_last_modified_by_id
        ,systemmodstamp as reg_system_modstamp
        ,lastactivitydate as reg_last_activity_date
        ,trim(aqb__event__c) as reg_event
        ,trim(aqb__campaign__c) as reg_campaign
        ,trim(aqb__chartofaccounts__c) as reg_chart_of_accounts
        ,trim(aqb__comment__c) as reg_comment
        ,trim(aqb__contact__c) as reg_contact
        ,aqb__date_of_registration__c as date_of_registration
        ,aqb__eventdate__c as reg_event_date
        ,aqb__eventenddate__c as reg_event_end_date
        ,trim(aqb__eventlocality__c) as reg_event_locality
        ,aqb__eventstartdateandtime__c as reg_event_start_date_and_time
        ,aqb__eventstopdateandtime__c as reg_event_stop_date_and_time
        ,trim(aqb__event_venue__c) as reg_event_venue
        ,trim(aqb__lead__c) as reg_lead
        ,trim(aqb__registrationexternalid__c) as registration_external_id
        ,trim(aqb__registrationfullname__c) as registration_full_name
        ,aqb__total_registration_amount__c as reg_total_registration_amount
        ,aqb__numberofguestsattended__c as reg_number_of_guests_attended
        ,aqb__numberofguests__c as reg_number_of_guests
        ,trim(aqcv_conversionid__c) as reg_conversion_id
        ,aqc_host__c as reg_host
        ,tickets_sent__c as reg_tickets_sent
        ,vud_pending_guests_c__c as reg_vud_pending_guests
        ,ivud_nvited_guests_c__c as reg_ivud_nvited_guests
        ,vud_declined_guests_c__c as reg_vud_declined_guests
        ,vud_attending_guests_c__c as reg_vud_attending_guests
        ,matillion_batch_id as reg_matillion_batch_id
        ,matillion_updated_timestamp as reg_matillion_updated_timestamp
        ,'sfdc_aqb'  as reg_source_name 
  from registration
),

final as ( 
    select  
        registration_trnsfrm.*
        , created_by.name as edu_creator_name
        , last_modified_by.name as edu_last_modified_by_name
    from registration_trnsfrm
        join created_by on registration_trnsfrm.reg_created_by_id = created_by.user_id
        join last_modified_by on registration_trnsfrm.reg_last_modified_by_id = last_modified_by.user_id
)

/*clean select*/
select * from final