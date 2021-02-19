Class IHE.Msg.H03.H0301Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 医疗卫生机构（科室）本地ID
Property DeptCode As %String;

/// 医疗卫生机构（科室）标识分类代码
Property DeptTypeCode As %String(MAXLEN = 50);

/// 医疗卫生机构（科室）标识分类代码对应的名称
Property DeptTypeName As %String(MAXLEN = 100);

/// 医疗卫生机构（科室）角色名称
Property DeptPartName As %String;

/// 工作地址
Property WorkAddress As %String(MAXLEN = 100);

/// 工作联系电话
Property WorkContactTel As %String;

/// 角色有效期间（开始时间）
Property EffectStartTime As %String(MAXLEN = 14);

/// 角色有效期间（结束时间）
Property EffectEndTime As %String(MAXLEN = 14);

/// 医疗卫生机构（科室）实体名称
Property DeptName As %String;

/// 上级医疗卫生机构机构（科室）号标识
Property ParentDeptCode As %String;

/// 上级医疗卫生机构（科室）名称
Property ParentDeptName As %String;

/// 申请者ID
Property AssignedPersonCode As %String(MAXLEN = 50);

/// 申请者名称
Property AssignedPersonName As %String;

/// 医疗卫生机构（科室）标识
Property AssignedDeptCode As %String;

/// 医疗卫生机构（科室）标识名称
Property AssignedDeptName As %String;

/// 医疗卫生机构（科室）联系人
Property AssignedContactPerson As %String;

}
