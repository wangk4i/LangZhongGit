Class IHE.Msg.H02.H0203Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 患者登记时间
Property EffectiveTime As %String(MAXLEN = 14);

/// 身份证号
Property IDCardNo As %String;

/// 证件类别代码
Property IDCategoryCode As %String;

/// 证件类别描述
Property IDCategoryName As %String;

/// 要合并到的姓名
Property MergeName As %String;

/// 操作人职工代码
Property OperateCode As %String(MAXLEN = 50);

/// 操作人姓名
Property OperateName As %String;

/// 要合并到病人的PatientID
Property MergeID As %String(MAXLEN = 50);

}
