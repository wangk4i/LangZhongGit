Class IHE.Msg.H03.H0303Rp Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.BaseResponse) [ Language = objectscript ]
{

/// 医疗卫生机构（科室）本地ID
Property DeptCode As %String;

/// 医疗卫生机构（科室）标识分类代码
Property DeptTypeCode As %String;

/// 医疗卫生机构（科室）标识分类代码对应的名称
Property DeptTypeName As %String;

/// 医疗卫生机构（科室）角色名称
Property DeptPartName As %String;

/// 工作地址
Property WorkAddress As %String;

/// 工作联系电话
Property WorkContactTel As %String;

/// 医疗卫生机构（科室）实体名称
Property DeptName As %String;

/// 申请者ID
Property AssignedPersonCode As %String;

/// 申请者名称
Property AssignedPersonName As %String;

/// 医疗卫生机构（科室）标识
Property AssignedDeptCode As %String;

/// 医疗卫生机构（科室）标识名称
Property AssignedDeptName As %String;

/// 医疗卫生机构（科室）联系人
Property AssignedContactPerson As %String;

/// 查询结果代码
Property ResponseCode As %String;

}
