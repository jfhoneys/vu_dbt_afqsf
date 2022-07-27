with registration as (select * from  {{ ref ('stg_sfdc_aqb__aqb__registration__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),



registration_transform as
(select
 registration.aqb__registration__c_id as registration_registration_id
, registration.aqb__registration__c_id as registration_registration_id2
, registration.isdeleted as registration_is-deleted
, registration.name as registration_name
, registration.recordtypeid as registration_record_typ_eid
, registration.createddate as registration_created_date
, registration.createdbyid as registration_createdbyid
, registration.lastmodifieddate as registration_lastmodifieddate
, registration.lastmodifiedbyid as registration_lastmodifiedbyid
, registration.systemmodstamp as registration_systemmodstamp
, registration.lastactivitydate as registration_lastactivitydate
, registration.aqb__event__c as registration_event
, registration.aqb__campaign__c as registration_campaign
, registration.aqb__chartofaccounts__c as registration_chartofaccounts
, registration.aqb__comment__c as registration_comment
, registration.aqb__contact__c as registration_contact
, registration.aqb__date_of_registration__c as registration_date_of_registration
, registration.aqb__eventdate__c as registration_eventdate
, registration.aqb__eventenddate__c as registration_eventenddate
, registration.aqb__eventlocality__c as registration_eventlocality
, registration.aqb__eventstartdateandtime__c as registration_eventstartdateandtime
, registration.aqb__eventstopdateandtime__c as registration_eventstopdateandtime
, registration.aqb__event_venue__c as registration_event_venue
, registration.aqb__lead__c as registration_lead
, registration.aqb__registrationexternalid__c as registration_registrationexternalid
, registration.aqb__registrationfullname__c as registration_registrationfullname
, registration.aqb__total_registration_amount__c as registration_total_registration_amount
, registration.aqb__numberofguestsattended__c as registration_numberofguestsattended
, registration.aqb__numberofguests__c as registration_numberofguests
, registration.aqcv_conversionid__c as registration_aqcv_conversionid
, registration.aqc_host__c as registration_aqc_host
, registration.tickets_sent__c as registration_tickets_sent
, registration.vud_pending_guests_c__c as registration_vud_pending_guests_c
, registration.ivud_nvited_guests_c__c as registration_ivud_nvited_guests_c
, registration.vud_declined_guests_c__c as registration_vud_declined_guests_c
, registration.vud_attending_guests_c__c as registration_vud_attending_guests_c
, registration.matillion_batch_id as registration_matillion_batch_id
, registration.matillion_updated_timestamp as registration_matillion_updated_timestamp
, registration.source_name as registration_source_name
    from registration
    ),

final as (select -- select count(1) as cnt from trans
             registration_transform.*
 --            , owner.name as registration_owner_name
             , created_by.name as registration_creator_name
             , last_modified_by.name as registration_last_modified_by_name
        from registration_transform
 --            join owner on registration_transform.registration_ownerid = owner.user_id
             join created_by on registration_transform.registration_createdbyid = created_by.user_id
             join last_modified_by on registration_transform.registration_lastmodifiedbyid = last_modified_by.user_id
)

/*clean select*/
select * from final