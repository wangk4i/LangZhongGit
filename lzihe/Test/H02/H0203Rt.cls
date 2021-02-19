Class IHE.Test.H02.H0203Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H02.H0203Rt).%New()
    
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.PatientID = "PatientID"
	s msg.EffectiveTime = "患者登记时间"
	s msg.IDCardNo = "身份证号"
	s msg.IDCategoryCode = "证件类别代码"
	s msg.IDCategoryName = "证件类别描述"
	s msg.MergeName = "要合并到的姓名"
	s msg.OperateCode = "操作人职工代码"
	s msg.OperateName = "操作人姓名"
	s msg.MergeID = "要合并到病人的PatientID"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
