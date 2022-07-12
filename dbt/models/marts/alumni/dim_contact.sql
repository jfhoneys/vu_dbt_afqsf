

with contact as (select * from {{ ref ('stg_sfdc_aqb__contact')}} where not isdeleted ), 
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_updated_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
all_cols as 
(select
    contact.contact_id
    -- , contact.isdeleted
    -- , contact.masterrecordid
    , contact.accountid
    , contact.lastname 
    , contact.firstname
    , contact.salutation
    , contact.middlename
    , contact.suffix
    , contact.name as contact_name 
    -- , contact.otherstreet
    -- , contact.othercity
    -- , contact.otherstate
    -- , contact.otherpostalcode
    -- , contact.othercountry
    -- , contact.otherlatitude
    -- , contact.otherlongitude
    -- , contact.othergeocodeaccuracy
    , contact.mailingstreet
    , contact.mailingcity
    , contact.mailingstate
    , contact.mailingpostalcode
    , contact.mailingcountry
    , contact.mailinglatitude
    , contact.mailinglongitude
    -- , contact.mailinggeocodeaccuracy
    , contact.phone
    -- , contact.fax
    , contact.mobilephone
    , contact.homephone
    , contact.otherphone
    , contact.assistantphone
    , contact.reportstoid
    , contact.email
    , contact.title
    , contact.department
    , contact.assistantname
    , contact.leadsource
    , contact.birthdate
    , contact.description
    , contact.ownerid
    , contact.hasoptedoutofemail
    , contact.hasoptedoutoffax
    , contact.donotcall
    , contact.createddate
    , contact.createdbyid
    , contact.lastmodifieddate
    , contact.lastmodifiedbyid
    , contact.systemmodstamp
    , contact.lastactivitydate
    , contact.lastcurequestdate
    , contact.lastcuupdatedate
    , contact.lastvieweddate
    , contact.lastreferenceddate
    , contact.emailbouncedreason
    , contact.emailbounceddate
    , contact.isemailbounced
    , contact.photourl
    , contact.jigsaw
    , contact.jigsawcontactid
    , contact.individualid
    -- , contact.aqb__anlink__c
    -- , contact.aqb__aname__c
    -- , contact.aqb__accessibilitypreferences__c
    -- , contact.aqb__accountcapacity__c
    -- , contact.aqb__accountmailingaddresstype__c
    -- , contact.aqb__accountmailingaddress__c
    -- , contact.aqb__accountmailingcity__c
    -- , contact.aqb__accountmailingcountry__c
    -- , contact.aqb__accountmailingcounty__c
    -- , contact.aqb__accountmailinglocality__c
    -- , contact.aqb__accountmailingnote__c
    -- , contact.aqb__accountmailingpostalcode__c
    -- , contact.aqb__accountmailingstate__c
    -- , contact.aqb__accountmailingstatus__c
    -- , contact.aqb__accountmailingstreet__c
    -- , contact.aqb__accountphone__c
    -- , contact.aqb__accountreadiness__c
    -- , contact.aqb__additionalinstitutionalsuffix__c
    -- , contact.aqb__addresschangeflags__c
    -- , contact.aqb__addressinusetext__c
    -- , contact.aqb__addressinusetype__c
    -- , contact.aqb__age__c
    -- , contact.aqb__alert__c
    -- , contact.aqb__automatedalternatename__c
    -- , contact.aqb__automatedcommunityname__c
    -- , contact.aqb__automateddefaultaddresssalutation__c
    -- , contact.aqb__automateddefaultgreetingsalutation__c
    -- , contact.aqb__automatedformalname__c
    -- , contact.aqb__automatedpreferredname__c
    -- , contact.aqb__awardgiftcredit__c
    -- , contact.aqb__businessaddresscity__c
    -- , contact.aqb__businessaddresscountry__c
    -- , contact.aqb__businessaddresslocality__c
    -- , contact.aqb__businessaddressnote__c
    -- , contact.aqb__businessaddresspostalcode__c
    -- , contact.aqb__businessaddressstatepro__c
    -- , contact.aqb__businessaddressstatus__c
    -- , contact.aqb__businessaddressstreet__c
    -- , contact.aqb__businessaddresstype__c
    -- , contact.aqb__businessaddress__c
    -- , contact.aqb__businessemail__c
    -- , contact.aqb__businessphone__c
    -- , contact.aqb__caecategory__c
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
    -- , contact.aqb__contactexternalid__c
    -- , contact.aqb__contactgrouping__c
    -- , contact.aqb__contactmailingaddressstreetlineone__c
    -- , contact.aqb__contactmailingaddressstreetlinethre__c
    -- , contact.aqb__contactmailingaddressstreetlinetwo__c
    -- , contact.aqb__contactpicture__c
    -- , contact.aqb__contactsource__c
    -- , contact.aqb__contact_mailing_address__c
    -- , contact.aqb__corroborateddeathdate__c
    -- , contact.aqb__countryid__c
    -- , contact.aqb__countryofdeath__c
    -- , contact.aqb__countynumber__c
    -- , contact.aqb__county__c
    -- , contact.aqb__dateobituaryattached__c
    -- , contact.aqb__dateofdeathnotification__c
    -- , contact.aqb__dateofdeathprecision__c
    -- , contact.aqb__dateofdeath__c
    -- , contact.aqb__deathcorroboratedby__c
    -- , contact.aqb__deceased__c
    -- , contact.aqb__defaultaddresssal__c
    -- , contact.aqb__defaultgreetingsal__c
    -- , contact.aqb__degreeyear__c
    -- , contact.aqb__degree_level__c
    -- , contact.aqb__degree__c
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
    -- , contact.aqb__district__c
    -- , contact.aqb__donotarchive__c
    -- , contact.aqb__donotcontact__c
    -- , contact.aqb__donotsolicit__c
    -- , contact.aqb__educationlink__c
    -- , contact.aqb__emailnotes__c
    -- , contact.aqb__emailpreference__c
    -- , contact.aqb__employername__c
    -- , contact.aqb__engagementscoreexperiential__c
    -- , contact.aqb__engagementscorephilanthropic__c
    -- , contact.aqb__engagementscorevolunteer__c
    -- , contact.aqb__engagmentscorecommunication__c
    -- , contact.aqb__ethnicity__c
    -- , contact.aqb__fipsstatecode__c
    -- , contact.aqb__fnlink__c
    -- , contact.aqb__fname__c
    -- , contact.aqb__flag__c
    -- , contact.aqb__foodpreferences__c
    -- , contact.aqb__full_name__c
    -- , contact.aqb__gender__c
    -- , contact.aqb__greeting__c
    -- , contact.aqb__institution__c
    -- , contact.aqb__institutionalarea1alternate__c
    -- , contact.aqb__institutionalarea1isoverridden__c
    -- , contact.aqb__institutionalarea1__c
    -- , contact.aqb__institutionalarea2alternate__c
    -- , contact.aqb__institutionalarea2isoverridden__c
    -- , contact.aqb__institutionalarea2__c
    -- , contact.aqb__institutionalarea3alternate__c
    -- , contact.aqb__institutionalarea3isoverridden__c
    -- , contact.aqb__institutionalarea3__c
    -- , contact.aqb__institutionalarea4alternate__c
    -- , contact.aqb__institutionalarea4isoverridden__c
    -- , contact.aqb__institutionalarea4__c
    -- , contact.aqb__institutionalsuffixoverride__c
    -- , contact.aqb__institutionalsuffix__c
    -- , contact.aqb__internalcontactmailingstreetone__c
    -- , contact.aqb__internalcontactmailingstreettwo__c
    -- , contact.aqb__involvementrating__c
    -- , contact.aqb__involvementscore__c
    -- , contact.aqb__isprimarycontact__c
    -- , contact.aqb__issecondarycontact__c
    -- , contact.aqb__languages__c
    -- , contact.aqb__lastactivitydate__c
    -- , contact.aqb__latitude__c
    -- , contact.aqb__legacycontactidnumber__c
    -- , contact.aqb__linkedaddress__c
    -- , contact.aqb__locationofdeath__c
    -- , contact.aqb__longitude__c
    -- , contact.aqb__maidenname__c
    -- , contact.aqb__mailingaddresstype__c
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
    -- , contact.aqb__maritalstatus__c
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
    -- , contact.aqb__nickname__c
    -- , contact.aqb__notifiedby__c
    -- , contact.aqb__number_of_events_attended__c
    -- , contact.aqb__obituaryattached__c
    -- , contact.aqb__obituarylink__c
    -- , contact.aqb__otheremail__c
    -- , contact.aqb__otherpreferences__c
    -- , contact.aqb__ownerunit__c
    -- , contact.aqb__pnamelink__c
    -- , contact.aqb__pname__c
    -- , contact.aqb__personalemail__c
    -- , contact.aqb__phonenotes__c
    -- , contact.aqb__phonepreference__c
    -- , contact.aqb__placeofbirth__c
    -- , contact.aqb__preferredyear__c
    -- , contact.aqb__presentation_preferences__c
    -- , contact.aqb__primaryemploymentlink__c
    -- , contact.aqb__primaryemploymenttitle__c
    -- , contact.aqb__primarygiftrecognitioncredit_percent__c
    -- , contact.aqb__pronoun__c
    -- , contact.aqb__rfm__c
    -- , contact.aqb__regionalternate__c
    -- , contact.aqb__regionisoverridden__c
    -- , contact.aqb__region__c
    -- , contact.aqb__relationship__c
    -- , contact.aqb__residentialdeliveryindicator__c
    -- , contact.aqb__revertaddressinusetype__c
    -- , contact.aqb__salutationlink__c
    -- , contact.aqb__schoolemail__c
    -- , contact.aqb__school__c
    -- , contact.aqb__secondarygiftrecognitioncreditpercent__c
    -- , contact.aqb__secondarytype__c
    -- , contact.aqb__setup__c
    -- , contact.aqb__signator__c
    -- , contact.aqb__stateid__c
    -- , contact.aqb__stateprovinceofdeath__c
    -- , contact.aqb__suffix__c
    -- , contact.aqb__totalaccountopenopportunities__c
    -- , contact.aqb__totalengagementscore__c
    -- , contact.aqb__total_number_of_event_registrations__c
    -- , contact.aqb__total_of_all_registration_fees__c
    -- , contact.aqb__type__c
    -- , contact.aqb__useaccountaddressonimport__c
    -- , contact.aqb__vsealumnidegreecategory__c
    -- , contact.aqb__validationdate__c
    -- , contact.aqb__verificationflag__c
    -- , contact.aqc_multipleethnicity__c
    -- , contact.aqcv_conversionid__c
    -- , contact.aqc_partial_birth_date__c
    -- , contact.aqb__engagementscorecategory__c
    -- , contact.aqb__engagementscoreoverride__c
    -- , contact.aqb__engagementscore__c
    -- , contact.aqb__professionalsuffix__c
    -- , contact.aqc_contact_id_text__c
    -- , contact.aqc_power_of_one__c
    -- , contact.vud_sort_name__c
    -- , contact.vud_contact_external_id__c
    -- , contact.et4ae5__hasoptedoutofmobile__c
    -- , contact.et4ae5__mobile_country_code__c
    -- , contact.vu_account_total__c
    -- , contact.email_unsubscribe_reason__c
    -- , contact.aqb__dummytext_aq__c
    -- , contact.test_email_groups__c
    -- , contact.id_full_characters__c
    , contact.matillion_batch_id
    , contact.matillion_updated_timestamp
    , contact.source_name
from contact ),
joins as (
  -- select count(1) as cnt  from all_cols -- 557545
  -- select ownerid, count(1) cnt from all_cols
  -- group by ownerid 
  select all_cols.*
  , owner.lastname as owner_lastname, owner.firstname as owner_firstname 
--   , created_by.lastname as created_by_lastname, created_by.firstname as created_by_lastname
  from all_cols
  inner join owner on all_cols.ownerid = owner.user_id
  inner join created_by on all_cols.createdbyid = created_by.user_id
    )
select * from joins


    