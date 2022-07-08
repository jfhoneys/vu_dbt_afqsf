/*A test table creation with stg data*/
{{ config(materialized='table') }}

with contacts_test_tbl as (
select acct.account_id
, acct.masterrecordid
, acct.name
, acct.phone
, acct.accountnumber
, acct.AQB__NEXTACTIVITYDATE__C
,cnct.contact_ID
from DRYDENNE_STAGE.STG_SFDC_AQB__ACCOUNT acct
	join DRYDENNE_STAGE.STG_SFDC_AQB__CONTACT CNCT 
		on acct.ACCOUNT_ID = cnct.accountID
where acct.ISDELETED = 0 and cnct.isdeleted = 0
)

select * from contacts_test_tbl
