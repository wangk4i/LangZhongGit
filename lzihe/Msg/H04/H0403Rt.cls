Class IHE.Msg.H04.H0403Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 性别代码
Property GenderCode As %String;

/// 性别描述
Property GenderName As %String;

/// 出生日期上限
Property BirthTimeLow As %String(MAXLEN = 14);

/// 出生日期下限
Property BirthTimeHigh As %String(MAXLEN = 14);

/// 医护人员工号
Property ProviderWorkNo As %String(MAXLEN = 50);

/// 身份证号
Property IDCardNo As %String;

/// 姓名
Property ProviderName As %String;

}
