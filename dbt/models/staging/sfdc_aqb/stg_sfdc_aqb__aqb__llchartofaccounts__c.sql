with aqb__llchartofaccounts__c as ( select * from {{ source('sfdc_aqb','aqb__llchartofaccounts__c') }}
), 
final 
as ( select  
 trim(id) as aqb__llchartofaccounts__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__account_sub_type__c) as aqb__account_sub_type__c
,trim(aqb__account_type__c) as aqb__account_type__c
,aqb__active__c as aqb__active__c
,trim(aqb__alert__c) as aqb__alert__c
,aqb__athletics_points__c as aqb__athletics_points__c
,trim(aqb__businessofficeglname__c) as aqb__businessofficeglname__c
,trim(aqb__campus__c) as aqb__campus__c
,trim(aqb__category__c) as aqb__category__c
,aqb__closeddate__c as aqb__closeddate__c
,trim(aqb__constituentfacingname__c) as aqb__constituentfacingname__c
,aqb__counts_towards_points__c as aqb__counts_towards_points__c
,aqb__current_value__c as aqb__current_value__c
,aqb__dateofinception__c as aqb__dateofinception__c
,trim(aqb__department__c) as aqb__department__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__designationaccountnumbergroupeight__c) as aqb__designationaccountnumbergroupeight__c
,trim(aqb__designationaccountnumbergroupfive__c) as aqb__designationaccountnumbergroupfive__c
,trim(aqb__designationaccountnumbergroupfour__c) as aqb__designationaccountnumbergroupfour__c
,trim(aqb__designationaccountnumbergroupnine__c) as aqb__designationaccountnumbergroupnine__c
,trim(aqb__designationaccountnumbergroupone__c) as aqb__designationaccountnumbergroupone__c
,trim(aqb__designationaccountnumbergroupseven__c) as aqb__designationaccountnumbergroupseven__c
,trim(aqb__designationaccountnumbergroupsix__c) as aqb__designationaccountnumbergroupsix__c
,trim(aqb__designationaccountnumbergroupten__c) as aqb__designationaccountnumbergroupten__c
,trim(aqb__designationaccountnumbergroupthree__c) as aqb__designationaccountnumbergroupthree__c
,trim(aqb__designationaccountnumbergrouptwo__c) as aqb__designationaccountnumbergrouptwo__c
,trim(aqb__designationaccountnumber__c) as aqb__designationaccountnumber__c
,trim(aqb__detaileddescription__c) as aqb__detaileddescription__c
,trim(aqb__fee1exception__c) as aqb__fee1exception__c
,trim(aqb__fee1exemptreason__c) as aqb__fee1exemptreason__c
,aqb__fee1exempt__c as aqb__fee1exempt__c
,trim(aqb__fee1sourceaccount__c) as aqb__fee1sourceaccount__c
,aqb__fee1__c as aqb__fee1__c
,trim(aqb__fee2exception__c) as aqb__fee2exception__c
,trim(aqb__fee2exemptreason__c) as aqb__fee2exemptreason__c
,aqb__fee2exempt__c as aqb__fee2exempt__c
,trim(aqb__fee2sourceaccount__c) as aqb__fee2sourceaccount__c
,aqb__fee2__c as aqb__fee2__c
,aqb__financialdatalastmodifiedx__c as aqb__financialdatalastmodifiedx__c
,trim(aqb__goalcategory__c) as aqb__goalcategory__c
,trim(aqb__goal__c) as aqb__goal__c
,aqb__incomegeneratedlastfiscalyear__c as aqb__incomegeneratedlastfiscalyear__c
,trim(aqb__institutionalunit__c) as aqb__institutionalunit__c
,trim(aqb__inventoryitem__c) as aqb__inventoryitem__c
,trim(aqb__marketvalueaboveprinciple__c) as aqb__marketvalueaboveprinciple__c
,aqb__marketvalue__c as aqb__marketvalue__c
,aqb__minimum_for_distribution__c as aqb__minimum_for_distribution__c
,trim(aqb__notes__c) as aqb__notes__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__pretty_nmae__c) as aqb__pretty_nmae__c
,trim(aqb__primaryinternalcontact__c) as aqb__primaryinternalcontact__c
,aqb__principlebalance__c as aqb__principlebalance__c
,aqb__restricted__c as aqb__restricted__c
,trim(aqb__restrictions__c) as aqb__restrictions__c
,trim(aqb__schoolunit__c) as aqb__schoolunit__c
,trim(aqb__spendingdepartment__c) as aqb__spendingdepartment__c
,trim(aqb__sub_department__c) as aqb__sub_department__c
,trim(aqb__use_category__c) as aqb__use_category__c
,trim(aqb__use__c) as aqb__use__c
,trim(aqb__vseextramuralathletics__c) as aqb__vseextramuralathletics__c
,trim(aqb__vse_endowment_restrictions__c) as aqb__vse_endowment_restrictions__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(vud_coa_external_id__c) as vud_coa_external_id__c
,trim(vu_net_asset_class__c) as vu_net_asset_class__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__llchartofaccounts__c
) 
select * from final 
