-------------PIT -----------------------
SELECT DISTINCT 
    tp.PIN_NO,
    tp.TAX_PAYER_NAME,
    tp.TAX_PAYER_TYPE,
    st.STATION_NAME,
    tp.REG_STATUS,
    tp.EFFECTIVE_DATE AGE_,
    section_.ECONOMIC_ACTIVITY_NAME SECTOR_,
    division_.ECONOMIC_ACTIVITY_NAME DIVISION_,
    tp.ACC_MONTH ACCOUNTING_PERIOD_END_MONTH,
    reg.TRP_TO_DT PERIOD_YEAR
FROM 
    KRA_INT.I_TRE_TAX_PAYER_MST tp,
    KRA_INT.I_TRP_RETURNS_REGISTER reg,
    KRA_INT.I_CPM_STATION_MST st,
    KRA_INT.I_TRE_IND_ECO_ACTIVITY_DTL e,
    KRA_INT.I_CPM_ECONOMIC_ACTIVITIES_MST section_,
    KRA_INT.I_CPM_ECONOMIC_ACTIVITIES_MST division_,
    KRA_INT.I_TRP_IT_PROF_LOSS_ACNT_DTL prof
WHERE 
    tp.TAX_PAYER_ID = reg.TAX_PAYER_ID
AND tp.JURISDICTION_STATION_ID = st.STATION_ID
AND tp.TAX_PAYER_ID = e.TAX_PAYER_ID
AND section_.ECO_ACT_MST_ID = e.ACTIVITY_SECTION
AND division_.ECO_ACT_MST_ID = e.ACTIVITY_DIVISION
AND prof.TRP_ID = reg.TRP_ID
--AND st.PARENT_ID = 56
AND reg.TRP_STATUS = 'APRV'
AND reg.IS_TRP_ACTIVE = 'Y'
AND TO_CHAR(reg.TRP_TO_DT, 'YYYY') = '2019'
AND tp.ACTIVE_FLAG = 'Y'
AND tp.PIN_NO = 'A001712327L'