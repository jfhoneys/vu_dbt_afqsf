with event as ( select * from {{ source('sfdc_aqb','event') }}
), 
final 
as ( select  
 trim(id) as event_id
,trim(whoid) as whoid
,trim(whatid) as whatid
,whocount as whocount
,whatcount as whatcount
,trim(subject) as subject
,trim(location) as location
,isalldayevent as isalldayevent
,activitydatetime as activitydatetime
,activitydate as activitydate
,durationinminutes as durationinminutes
,startdatetime as startdatetime
,enddatetime as enddatetime
,enddate as enddate
,trim(description) as description
,trim(accountid) as accountid
,trim(ownerid) as ownerid
,trim(type) as type
,isprivate as isprivate
,trim(showas) as showas
,isdeleted as isdeleted
,ischild as ischild
,isgroupevent as isgroupevent
,trim(groupeventtype) as groupeventtype
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,isarchived as isarchived
,trim(recurrenceactivityid) as recurrenceactivityid
,isrecurrence as isrecurrence
,recurrencestartdatetime as recurrencestartdatetime
,recurrenceenddateonly as recurrenceenddateonly
,trim(recurrencetimezonesidkey) as recurrencetimezonesidkey
,trim(recurrencetype) as recurrencetype
,recurrenceinterval as recurrenceinterval
,recurrencedayofweekmask as recurrencedayofweekmask
,recurrencedayofmonth as recurrencedayofmonth
,trim(recurrenceinstance) as recurrenceinstance
,trim(recurrencemonthofyear) as recurrencemonthofyear
,reminderdatetime as reminderdatetime
,isreminderset as isreminderset
,trim(eventsubtype) as eventsubtype
,isrecurrence2exclusion as isrecurrence2exclusion
,trim(recurrence2patterntext) as recurrence2patterntext
,trim(recurrence2patternversion) as recurrence2patternversion
,isrecurrence2 as isrecurrence2
,isrecurrence2exception as isrecurrence2exception
,recurrence2patternstartdate as recurrence2patternstartdate
,trim(recurrence2patterntimezone) as recurrence2patterntimezone
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__activityreport__c) as aqb__activityreport__c
,trim(aqb__activitysummary__c) as aqb__activitysummary__c
,aqb__automatedchangedate__c as aqb__automatedchangedate__c
,trim(aqb__completed__c) as aqb__completed__c
,trim(aqb__confidentialcomment__c) as aqb__confidentialcomment__c
,aqb__essentialmove__c as aqb__essentialmove__c
,trim(aqb__followup__c) as aqb__followup__c
,trim(aqb__opportunity__c) as aqb__opportunity__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__stewardship__c) as aqb__stewardship__c
,trim(aqb__tasktemplateid__c) as aqb__tasktemplateid__c
,trim(aqb__engagementscorecategory__c) as aqb__engagementscorecategory__c
,aqb__engagementscoreoverride__c as aqb__engagementscoreoverride__c
,aqb__engagementscore__c as aqb__engagementscore__c
,trim(aqb__objective__c) as aqb__objective__c
,trim(aqb__purpose__c) as aqb__purpose__c
,trim(aqb__reportstatus__c) as aqb__reportstatus__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from event
) 
select * from final 