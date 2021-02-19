Class IHE.Test.H04.H0401Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H04.H0401Rt).%New()
    
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "创建时间"
	s msg.ProviderWorkNo = "医护人员工号"
	s msg.Subject1Code = "专业技术职务类别代码"
	s msg.Subject1CodeName = "专业技能职务代码对应的名称"
	s msg.EffectiveTimeLow = "角色有效期间（起始）"
	s msg.EffectiveTimeHigh = "角色有效期间（结束）"
	s msg.IDCardNo = "身份证号"
	s msg.IDCategoryCode = "证件类别代码"
	s msg.IDCategoryName = "证件类别描述"
	s msg.ProviderName = "姓名"
	s msg.GenderCode = "性别代码"
	s msg.GenderName = "性别代码对应的名字"
	s msg.BirthTime = "出生日期"
	s msg.DeptCode = "科室号"
	s msg.DeptName = "科室名称"
	s msg.Birthplace = "出生地"
	s msg.AssignedPersonCode = "申请者工号"
	s msg.AssignedEntityName = "申请者姓名"
	s msg.AssignedEntityDeptId = "科室号ID"
	s msg.AssignedEntityDeptName = "科室名称"
	s msg.AssignedEntityDeptContact = "科室联系人名称"
	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
