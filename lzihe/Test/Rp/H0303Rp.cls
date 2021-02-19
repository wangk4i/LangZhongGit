Class IHE.Test.Rp.H0303Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H03.H0303Rp).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "创建时间"
	s msg.ResultCode = "处理结果，AA表示成功，AE表示失败"
	s msg.RequestMsgID = "对应请求消息ID"
	s msg.ResultDesc = "处理结果说明"
	s msg.DeptCode = "医疗卫生机构（科室）本地ID"
	s msg.DeptTypeCode = "医疗卫生机构（科室）标识分类代码"
	s msg.DeptTypeName = "医疗卫生机构（科室）标识分类代码对应的名称"
	s msg.DeptPartName = "医疗卫生机构（科室）角色名称"
	s msg.WorkAddress = "工作地址"
	s msg.WorkContactTel = "工作联系电话"
	s msg.DeptName = "医疗卫生机构（科室）实体名称"
	s msg.AssignedPersonCode = "申请者ID"
	s msg.AssignedPersonName = "申请者名称"
	s msg.AssignedDeptCode = "医疗卫生机构（科室）标识"
	s msg.AssignedDeptName = "医疗卫生机构（科室）标识名称"
	s msg.AssignedContactPerson = "医疗卫生机构（科室）联系人"
	s msg.ResponseCode = "查询结果代码"

	d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
