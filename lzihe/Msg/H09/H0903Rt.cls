Class IHE.Msg.H09.H0903Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 申请单ID
Property ExamAppInfoID As %String;

/// 门急诊号
Property OutpatientId As %String;

/// 住院号
Property HospitalizationId As %String;

/// 标本ID
Property SpecimenID As %String;

/// 申请单开立者工号
Property AuthorID As %String(MAXLEN = 50);

/// 申请单有效期（低值)
Property EffectiveTimeLow As %String(MAXLEN = 14);

/// 申请单有效期（高值)
Property EffectiveTimeHigh As %String(MAXLEN = 14);

/// 患者身份证号
Property IDCardNo As %String;

/// 患者医保卡号
Property MedicalInsuranceCard As %String(MAXLEN = 50);

/// 患者ID
Property PatientID As %String(MAXLEN = 50);

/// 检验状态
Property ExamStatus As %String(MAXLEN = 50);

}
