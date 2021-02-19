Class IHE.Msg.H04.H0402Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 医护人员工号
Property ProviderWorkNo As %String(MAXLEN = 50);

/// 专业技术职务类别代码
Property Subject1Code As %String;

/// 专业技能职务代码对应的名称
Property Subject1CodeName As %String;

/// 角色有效期间（起始）
Property EffectiveTimeLow As %String(MAXLEN = 14);

/// 角色有效期间（结束）
Property EffectiveTimeHigh As %String(MAXLEN = 14);

/// 身份证号
Property IDCardNo As %String;

/// 证件类别代码
Property IDCategoryCode As %String;

/// 证件类别描述
Property IDCategoryName As %String;

/// 姓名
Property ProviderName As %String;

/// 性别代码
Property GenderCode As %String;

/// 性别代码对应的名字
Property GenderName As %String;

/// 出生日期
Property BirthTime As %String;

/// 科室号
Property DeptCode As %String;

/// 科室名称
Property DeptName As %String;

/// 出生地
Property Birthplace As %String(MAXLEN = 100);

/// 申请者工号
Property AssignedPersonCode As %String(MAXLEN = 50);

/// 申请者姓名
Property AssignedEntityName As %String;

/// 科室号ID
Property AssignedEntityDeptId As %String;

/// 科室名称
Property AssignedEntityDeptName As %String;

/// 科室联系人名称
Property AssignedEntityDeptContact As %String;

}
