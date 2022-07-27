
with contact as (select * from {{ ref ('stg_sfdc_aqb__contact')}} where not isdeleted ), 
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
all_cols as 
(select
    contact.contact_id
    -- , contact.isdeleted
    -- , contact.masterrecordid
    , contact.accountid as contact_acount_id 
    , contact.lastname as contact_last_name 
    , contact.firstname as contact_first_name 
    , contact.salutation as contact_salution
    , contact.middlename as contact_middle_name 
    , contact.suffix as contact_suffix
    , contact.name as contact_name 
    -- , contact.otherstreet
    -- , contact.othercity
    -- , contact.otherstate
    -- , contact.otherpostalcode
    -- , contact.othercountry
    -- , contact.otherlatitude
    -- , contact.otherlongitude
    -- , contact.othergeocodeaccuracy
    , contact.mailingstreet as contact_mailing_street 
    , contact.mailingcity as contact_mailing_city
    , contact.mailingstate as contact_mailing_state 
    , contact.mailingpostalcode as contact_mailing_postal_code 
    , contact.mailingcountry as contact_mailing_country 
    , contact.mailinglatitude as contact_mailing_latitude 
    , contact.mailinglongitude as contact_mailing_longitude 
    -- , contact.mailinggeocodeaccuracy
    , contact.phone as contact_phone 
    -- , contact.fax
    , contact.mobilephone as contact_mobile_phone
    , contact.homephone as contact_home_phone
--    , contact.otherphone
--    , contact.assistantphone
--    , contact.reportstoid
    , contact.email as contact_email
    , contact.title as contact_title 
    -- , contact.department
    -- , contact.assistantname
    -- , contact.leadsource
    , contact.birthdate as contact_birthdate  
    -- , contact.description
    , contact.hasoptedoutofemail as contact_opted_out_email 
    -- , contact.hasoptedoutoffax
    , contact.donotcall as contact_do_not_call 
    , contact.systemmodstamp as contact_system_mod_stamp 
    , contact.lastactivitydate as contact_last_activity_date 
    , contact.lastcurequestdate as contact_last_cu_request_date
    , contact.lastcuupdatedate as contact_last_cu_update_date
--    , contact.lastvieweddate
    -- , contact.lastreferenceddate
    -- , contact.emailbouncedreason
    -- , contact.emailbounceddate
    -- , contact.isemailbounced
    -- , contact.photourl
    -- , contact.jigsaw
    -- , contact.jigsawcontactid
    -- , contact.individualid
    -- , contact.aqb__anlink__c
    -- , contact.aqb__aname__c
    -- , contact.aqb__accessibilitypreferences__c
     , contact.aqb__accountcapacity__c as contact_account_capacity
    -- , contact.aqb__accountmailingaddresstype__c
    -- , contact.aqb__accountmailingaddress__c
    -- , contact.aqb__accountmailingcity__c
    -- , contact.aqb__accountmailingcountry__c
    -- , contact.aqb__accountmailingcounty__c
    -- , contact.aqb__accountmailinglocality__c
    -- , contact.aqb__accountmailingnote__c
    -- , contact.aqb__accountmailingpostalcode__c
    -- , contact.aqb__accountmailingstate__c
    , contact.aqb__accountmailingstatus__c as contact_account_mailing_status
    -- , contact.aqb__accountmailingstreet__c
    , contact.aqb__accountphone__c as contact_account_phone
    -- , contact.aqb__accountreadiness__c
    -- , contact.aqb__additionalinstitutionalsuffix__c
    -- , contact.aqb__addresschangeflags__c
    -- , contact.aqb__addressinusetext__c
    -- , contact.aqb__addressinusetype__c
    , contact.aqb__age__c as contact_age 
    -- , contact.aqb__alert__c
    -- , contact.aqb__automatedalternatename__c
    -- , contact.aqb__automatedcommunityname__c
    -- , contact.aqb__automateddefaultaddresssalutation__c
    -- , contact.aqb__automateddefaultgreetingsalutation__c
    -- , contact.aqb__automatedformalname__c
    -- , contact.aqb__automatedpreferredname__c
    -- , contact.aqb__awardgiftcredit__c
    , contact.aqb__businessaddresscity__c as contact_business_address_city
    , contact.aqb__businessaddresscountry__c as contact_business_address_country
    -- , contact.aqb__businessaddresslocality__c
    -- , contact.aqb__businessaddressnote__c
    , contact.aqb__businessaddresspostalcode__c as contact_business_address_postal_code 
    , contact.aqb__businessaddressstatepro__c as contact_business_address_state_pro
    -- , contact.aqb__businessaddressstatus__c
    , contact.aqb__businessaddressstreet__c as contact_buiness_address_street 
    -- , contact.aqb__businessaddresstype__c
    , contact.aqb__businessaddress__c as contact_business_address 
    -- , contact.aqb__businessemail__c
    , contact.aqb__businessphone__c as contact_business_phone
    , contact.aqb__caecategory__c as contact_cae_category
    -- , contact.aqb__cnlink__c
    -- , contact.aqb__cname__c
    -- , contact.aqb__carrierroute__c
    -- , contact.aqb__causedeath__c
    -- , contact.aqb__certifiedcityname__c
    -- , contact.aqb__certifiedstateabbreviation__c
    -- , contact.aqb__certifiedstreetname__c
    -- , contact.aqb__certifiedzipcode__c
    -- , contact.aqb__cityofdeath__c
    -- , contact.aqb__comments__c
    -- , contact.aqb__communitypassword__c
    -- , contact.aqb__contactanonymousoption__c
    -- , contact.aqb__contactcount__c
    , contact.aqb__contactexternalid__c as contact_external_id
    -- , contact.aqb__contactgrouping__c
    -- , contact.aqb__contactmailingaddressstreetlineone__c
    -- , contact.aqb__contactmailingaddressstreetlinethre__c
    -- , contact.aqb__contactmailingaddressstreetlinetwo__c
    -- , contact.aqb__contactpicture__c
    -- , contact.aqb__contactsource__c
    , contact.aqb__contact_mailing_address__c as contact_mailing_address
    -- , contact.aqb__corroborateddeathdate__c
    -- , contact.aqb__countryid__c
    -- , contact.aqb__countryofdeath__c
    -- , contact.aqb__countynumber__c
    -- , contact.aqb__county__c
    -- , contact.aqb__dateobituaryattached__c
    -- , contact.aqb__dateofdeathnotification__c
    -- , contact.aqb__dateofdeathprecision__c
    , contact.aqb__dateofdeath__c as contact_date_of_death
    -- , contact.aqb__deathcorroboratedby__c
    , contact.aqb__deceased__c as contact_deceased 
    -- , contact.aqb__defaultaddresssal__c 
    -- , contact.aqb__defaultgreetingsal__c
    , contact.aqb__degreeyear__c as contact_degree_year

    , contact.aqb__degree_level__c as contact_degree_level
    , contact.aqb__degree__c as contact_degree 
    -- , contact.aqb__deliverypoint1__c
    -- , contact.aqb__deliverypointcheckdigit__c
    -- , contact.aqb__deliverypointvalidationflag__c
    -- , contact.aqb__deliverypointvalidation__c
    -- , contact.aqb__directoryincludesendemaillink__c
    -- , contact.aqb__directorypublishaddress__c
    -- , contact.aqb__directorypublishcoredata__c
    -- , contact.aqb__directorypublisheducation__c
    -- , contact.aqb__directorypublishemail__c
    -- , contact.aqb__directorypublishemployment__c
    -- , contact.aqb__directorypublishinterests__c
    -- , contact.aqb__directorypublishphone__c
    -- , contact.aqb__districtalternate__c
    -- , contact.aqb__districtisoverridden__c
    , contact.aqb__district__c as contact_district 
    -- , contact.aqb__donotarchive__c
    , contact.aqb__donotcontact__c as contact_do_not_contact 
    , contact.aqb__donotsolicit__c as contact_do_not_solicit 
    , contact.aqb__educationlink__c as contact_education_link 
    -- , contact.aqb__emailnotes__c
    -- , contact.aqb__emailpreference__c
    , contact.aqb__employername__c as contact_employer_name 
    -- , contact.aqb__engagementscoreexperiential__c
    -- , contact.aqb__engagementscorephilanthropic__c
    -- , contact.aqb__engagementscorevolunteer__c
    -- , contact.aqb__engagmentscorecommunication__c
    -- , contact.aqb__ethnicity__c
    -- , contact.aqb__fipsstatecode__c
    -- , contact.aqb__fnlink__c
    , contact.aqb__fname__c as contact_full_name_first_last 
    -- , contact.aqb__flag__c
    -- , contact.aqb__foodpreferences__c
     , contact.aqb__full_name__c as contact_full_name_last_first
    , contact.aqb__gender__c as contact_gender 
    , contact.aqb__greeting__c as contact_greeting 
    -- , contact.aqb__institution__c
    -- , contact.aqb__institutionalarea1alternate__c
    -- , contact.aqb__institutionalarea1isoverridden__c
    , contact.aqb__institutionalarea1__c as contact_institutional_area_1
    -- , contact.aqb__institutionalarea2alternate__c
    -- , contact.aqb__institutionalarea2isoverridden__c
    , contact.aqb__institutionalarea2__c as contact_institutional_area_2
    -- , contact.aqb__institutionalarea3alternate__c
    -- , contact.aqb__institutionalarea3isoverridden__c
    , contact.aqb__institutionalarea3__c as contact_institutional_area_3
    -- , contact.aqb__institutionalarea4alternate__c
    -- , contact.aqb__institutionalarea4isoverridden__c
    , contact.aqb__institutionalarea4__c as contact_institutional_area_4
    -- , contact.aqb__institutionalsuffixoverride__c
    -- , contact.aqb__institutionalsuffix__c
    -- , contact.aqb__internalcontactmailingstreetone__c
    -- , contact.aqb__internalcontactmailingstreettwo__c
    -- , contact.aqb__involvementrating__c
    -- , contact.aqb__involvementscore__c
    , contact.aqb__isprimarycontact__c as contact_is_primary_contact 
    , contact.aqb__issecondarycontact__c as contact_is_secondary_contact
    -- , contact.aqb__languages__c
    -- , contact.aqb__lastactivitydate__c
    -- , contact.aqb__latitude__c
    -- , contact.aqb__legacycontactidnumber__c
    -- , contact.aqb__linkedaddress__c
    -- , contact.aqb__locationofdeath__c
    -- , contact.aqb__longitude__c
    -- , contact.aqb__maidenname__c
    , contact.aqb__mailingaddresstype__c as contact_mailing_address_type 
    -- , contact.aqb__mailingdistrict__c
    -- , contact.aqb__mailinglists__c
    -- , contact.aqb__mailinglocality__c
    -- , contact.aqb__mailingnote__c
    -- , contact.aqb__mailingregion__c
    -- , contact.aqb__mailingstatus__c
    -- , contact.aqb__mailingstreetlinefour__c
    -- , contact.aqb__mailingstreetlineone__c
    -- , contact.aqb__mailingstreetlinethree__c
    -- , contact.aqb__mailingstreetlinetwo__c
    -- , contact.aqb__mailingtimezone__c
    , contact.aqb__maritalstatus__c as contact_marital_status 
    -- , contact.aqb__mobilework__c
    -- , contact.aqb__mostrecenteventattendancelink__c
    -- , contact.aqb__mostrecenteventattended__c
    -- , contact.aqb__most_recent_event_attendance_date__c
    -- , contact.aqb__most_recent_event_registration_date__c
    -- , contact.aqb__most_recent_event_registration_link__c
    -- , contact.aqb__most_recent_event_registration__c
    -- , contact.aqb__name__c
    -- , contact.aqb__nextactivitydate__c
    -- , contact.aqb__nextactivity__c
    , contact.aqb__nickname__c as contact_nickname 
    -- , contact.aqb__notifiedby__c
    -- , contact.aqb__number_of_events_attended__c
    -- , contact.aqb__obituaryattached__c
    -- , contact.aqb__obituarylink__c
    , contact.aqb__otheremail__c as contact_other_email 
    -- , contact.aqb__otherpreferences__c
    -- , contact.aqb__ownerunit__c
    -- , contact.aqb__pnamelink__c
    -- , contact.aqb__pname__c
    , contact.aqb__personalemail__c as contact_personal_email 
    -- , contact.aqb__phonenotes__c
    , contact.aqb__phonepreference__c as contact_phone_preference 
    -- , contact.aqb__placeofbirth__c
    , contact.aqb__preferredyear__c as contact_preferred_year
    -- , contact.aqb__presentation_preferences__c
    -- , contact.aqb__primaryemploymentlink__c
    -- , contact.aqb__primaryemploymenttitle__c
    -- , contact.aqb__primarygiftrecognitioncredit_percent__c
    -- , contact.aqb__pronoun__c
    -- , contact.aqb__rfm__c
    -- , contact.aqb__regionalternate__c
    -- , contact.aqb__regionisoverridden__c
    -- , contact.aqb__region__c
    , contact.aqb__relationship__c as contact_relationship 
    -- , contact.aqb__residentialdeliveryindicator__c
    -- , contact.aqb__revertaddressinusetype__c
    -- , contact.aqb__salutationlink__c
    , contact.aqb__schoolemail__c as contact_school_email
    , contact.aqb__school__c as contact_school 
    -- , contact.aqb__secondarygiftrecognitioncreditpercent__c
    , contact.aqb__secondarytype__c as contact_secondary_type 
    -- , contact.aqb__setup__c
    -- , contact.aqb__signator__c
    -- , contact.aqb__stateid__c
    -- , contact.aqb__stateprovinceofdeath__c
    -- , contact.aqb__suffix__c
    , contact.aqb__totalaccountopenopportunities__c as contact_total_account_open_opportunities
    -- , contact.aqb__totalengagementscore__c
    , contact.aqb__total_number_of_event_registrations__c as contact_total_number_of_event_registrations
    -- , contact.aqb__total_of_all_registration_fees__c
    , contact.aqb__type__c as contact_type 
    -- , contact.aqb__useaccountaddressonimport__c
    -- , contact.aqb__vsealumnidegreecategory__c
    -- , contact.aqb__validationdate__c
    -- , contact.aqb__verificationflag__c
    , contact.aqc_multipleethnicity__c as contact_multiple_ethnicity 
    -- , contact.aqcv_conversionid__c
    -- , contact.aqc_partial_birth_date__c
    -- , contact.aqb__engagementscorecategory__c
    -- , contact.aqb__engagementscoreoverride__c
    -- , contact.aqb__engagementscore__c
    -- , contact.aqb__professionalsuffix__c
    , contact.aqc_contact_id_text__c as contact_id_text
    -- , contact.aqc_power_of_one__c
    , contact.vud_sort_name__c as contact_vud_sort_name 
    , contact.vud_contact_external_id__c as contact_vud_contact_external_id
    -- , contact.et4ae5__hasoptedoutofmobile__c
    -- , contact.et4ae5__mobile_country_code__c
    -- , contact.vu_account_total__c
    -- , contact.email_unsubscribe_reason__c
    -- , contact.aqb__dummytext_aq__c
    -- , contact.test_email_groups__c
    , contact.id_full_characters__c as contact_id_full_characters
    , contact.createddate as contact_created_date 
    , contact.createdbyid as contact_created_by_id
    , contact.lastmodifieddate as contact_last_modified_date
    , contact.lastmodifiedbyid as contact_last_modifiedby_id 
    , contact.matillion_batch_id as contact_matillion_batch_id 
    , contact.matillion_updated_timestamp as contact_matillion_updated_timestamp
    , contact.source_name as contact_source_name
    , contact.ownerid as contact_owner_id 
from contact ),
joins as (
  -- select count(1) as cnt  from all_cols -- 557545
  -- select ownerid, count(1) cnt from all_cols
  -- group by ownerid 
  select all_cols.*
   , owner.name as contact_owner_name 
   , created_by.name as contact_created_by_name 
   , last_modified_by.name as contact_last_modified_by_name
  from all_cols
  inner join owner on all_cols.contact_owner_id = owner.user_id
  inner join created_by on all_cols.contact_created_by_id = created_by.user_id
  inner join last_modified_by on all_cols.contact_last_modifiedby_id = last_modified_by.user_id
    )
select * from joins