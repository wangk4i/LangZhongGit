Class IHE.Test.H03.H0303Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H03.H0303Rt).%New()
    
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "创建时间"
	s msg.DeptCode = "医疗卫生机构（科室）标识"
	s msg.DeptName = "医疗卫生机构（科室）实体名称"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
