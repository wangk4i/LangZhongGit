Class IHE.Msg.H03.H0304Rp Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 创建时间
Property CreTime As %String(MAXLEN = 14);

/// 处理结果，"AA"表示成功，"AE"表示失败
Property ResultCode As %String;

/// 对应请求消息ID
Property RequestMsgID As %String(MAXLEN = 50);

/// 处理结果说明
Property ResultDesc As %String(MAXLEN = 200);

/// 医疗卫生机构（科室）标识分类代码
Property OrganTypeCode As %String(MAXLEN = 50);

/// 医疗卫生机构（科室）标识分类代码对应的名称
Property OrganTypeValue As %String(MAXLEN = 50);

/// 医疗卫生机构（科室）角色名称
Property OrganPartName As %String;

/// 工作地址
Property WorkAddress As %String(MAXLEN = 100);

/// 工作联系电话
Property WorkContactTel As %String;

/// 医疗卫生机构（科室）实体名称
Property OrganName As %String;

/// 申请者ID
Property AssignedPersonCode As %String(MAXLEN = 50);

/// 申请者名称
Property AssignedPersonName As %String;

/// 医疗卫生机构（科室）标识
Property AssignedOrganCode As %String;

/// 医疗卫生机构（科室）标识名称
Property AssignedOrganName As %String;

/// 医疗卫生机构（科室）联系人
Property AssignedContactPerson As %String;

/// 查询结果代码
Property QueryResponseCode As %String(MAXLEN = 50);

}
