with registration as (select * from  {{ ref ('stg_sfdc_aqb__aqb__registration__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

registration_transform as
(select 
  registration.aqb__registration__c_id as registration_id,
  registration.isdeleted as registration_is_deleted
, registration.name as registration_name
, registration.recordtypeid as registration_record_type_id
, registration.createddate as registration_created_date
, registration.createdbyid as registration_created_by_id
, registration.lastmodifieddate as registration_last_modified_date
, registration.lastmodifiedbyid as registration_last_modified_by_id
, registration.systemmodstamp as registration_system_modstamp
, registration.lastactivitydate as registration_last_activity_date
, registration.aqb__event__c as registration_event
, registration.aqb__campaign__c as registration_campaign
, registration.aqb__chartofaccounts__c as registration_chart_of_accounts
, registration.aqb__comment__c as registration_comment
, registration.aqb__contact__c as registration_contact
, registration.aqb__date_of_registration__c as registration_date_of_registration
, registration.aqb__eventdate__c as registration_event_date
, registration.aqb__eventenddate__c as registration_event_end_date
, registration.aqb__eventlocality__c as registration_event_locality
, registration.aqb__eventstartdateandtime__c as registration_event_start_date_and_time
, registration.aqb__eventstopdateandtime__c as registration_event_stop_date_and_time
, registration.aqb__event_venue__c as registration_event_venue
, registration.aqb__lead__c as registration_lead
, registration.aqb__registrationexternalid__c as registration_external_id
, registration.aqb__registrationfullname__c as registration_fullname
, registration.aqb__total_registration_amount__c as registration_total_registration_amount
, registration.aqb__numberofguestsattended__c as registration_number_of_guests_attended
, registration.aqb__numberofguests__c as registration_number_of_guests
, registration.aqcv_conversionid__c as registration_aqcv_conversion_id
, registration.aqc_host__c as registration_aqc_host
, registration.tickets_sent__c as registration_tickets_sent
, registration.vud_pending_guests_c__c as registration_vud_pending_guests_c
, registration.ivud_nvited_guests_c__c as registration_ivud_nvited_guests_c
, registration.vud_declined_guests_c__c as registration_vud_declined_guests_c
, registration.vud_attending_guests_c__c as registration_vud_attending_guests_c
, registration.matillion_batch_id as registration_matillion_batch_id
, registration.matillion_updated_timestamp as registration_matillion_updated_timestamp
, registration.source_name as registration_source_name
   ), 

final as (select -- select count(1) as cnt from trans
             registration_transform.*
             , owner.name as registration_owner_name
             , created_by.name as registration_creator_name
             , last_modified_by.name as registration_last_modified_by_name
        from registration_transform
             join owner on registration_transform.registration_ownerid = owner.user_id
             join created_by on registration_transform.registration_createdbyid = created_by.user_id
             join last_modified_by on registration_transform.registration_lastmodifiedbyid = last_modified_by.user_id
)

/*clean select*/
select * from final