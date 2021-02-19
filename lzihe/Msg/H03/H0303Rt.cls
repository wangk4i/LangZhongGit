Class IHE.Msg.H03.H0303Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 医疗卫生机构（科室）标识
Property DeptCode As %String;

/// 医疗卫生机构（科室）实体名称
Property DeptName As %String;

}
