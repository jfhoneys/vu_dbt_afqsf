with student_interest as (select * from  {{ ref ('stg_sfdc_aqb__aqb__studentinterest__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

student_interest_transform as
(select
 student_interest.aqb__studentinterest__c_id as student_interest_id
, student_interest.ownerid as student_interest_ownerid
, student_interest.isdeleted as student_interest_isdeleted
, student_interest.name as student_interest_name
, student_interest.createddate as student_interest_createddate
, student_interest.createdbyid as student_interest_createdbyid
, student_interest.lastmodifieddate as student_interest_lastmodifieddate
, student_interest.lastmodifiedbyid as student_interest_lastmodifiedbyid
--, student_interest.systemmodstamp as student_interest_systemmodstamp
--, student_interest.aqb__contact__c as student_interest_contact
, student_interest.aqb__educationid__c as student_interest_educationid
--, student_interest.aqb__educationalinstitution__c as student_interest_educationalinstitution
, student_interest.aqb__interestgroup__c as student_interest_interestgroup
, student_interest.aqb__interesttype__c as student_interest_interesttype
--, student_interest.aqb__ownerunit__c as student_interest_ownerunit
, student_interest.aqb__position__c as student_interest_position
--, student_interest.aqb__source__c as student_interest_source
--, student_interest.aqb__startday__c as student_interest_startday
--, student_interest.aqb__startmonth__c as student_interest_startmonth
--, student_interest.aqb__startyear__c as student_interest_startyear
--, student_interest.aqb__stopday__c as student_interest_stopday
--, student_interest.aqb__stopmonth__c as student_interest_stopmonth
--, student_interest.aqb__stopyear__c as student_interest_stopyear
--, student_interest.aqcv_conversionid__c as student_interest_aqcv_conversionid
, student_interest.matillion_batch_id as student_interest_matillion_batch_id
, student_interest.matillion_updated_timestamp as student_interest_matillion_updated_timestamp
, student_interest.source_name as student_interest_source_name
   from student_interest
   ), 

final as (select -- select count(1) as cnt from trans
             student_interest_transform.*
             , owner.name as student_interest_owner_name
             , created_by.name as student_interest_creator_name
             , last_modified_by.name as student_interest_last_modified_by_name
        from student_interest_transform
             join owner on student_interest_transform.student_interest_ownerid = owner.user_id
             join created_by on student_interest_transform.student_interest_createdbyid = created_by.user_id
             join last_modified_by on student_interest_transform.student_interest_lastmodifiedbyid = last_modified_by.user_id
)

/*clean select*/
select * from final