<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0052">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.72"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0052" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>住院医嘱</title>
            <!-- 文档机器生成时间 -->
            <effectiveTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </effectiveTime>
            <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality" displayName="正常访问保密级别"/>
            <languageCode code="zh-CN"/>
            <setId>
                <xsl:value-of select="DocSetID"/>
            </setId>
            <versionNumber>
                <xsl:value-of select="Version"/>
            </versionNumber>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--住院号：DE01.00.014.00 @@@参照OID分配表修改 -->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
                    <telecom value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="PatientTel"/>
                        </xsl:attribute>
                    </telecom>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号标识-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!--N:有就填-->
                        <age value="" unit="岁">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                    <providerOrganization>
                        <id root="2.16.156.10011.1.5" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="ProviderOrgCode"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="ProviderOrgName"/>
                        </name>
                    </providerOrganization>
                </patientRole>
            </recordTarget>
            <!-- 文档作者 -->
            <author typeCode="AUT" contextControlCode="OP">
                <!--医嘱开立日期时间：DE06.00.220.00 -->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="RecordTime"/>
                    </xsl:attribute>
                </time>
                <assignedAuthor classCode="ASSIGNED">
                    <id root="2.16.156.10011.1.7" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AuthorCode"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="医嘱开立者"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <!-- 文档生成机构 -->
            <custodian typeCode="CST">
                <assignedCustodian classCode="ASSIGNED">
                    <representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
                        <id root="2.16.156.10011.1.5" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="CustodianOrgCode"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="CustodianOrgName"/>
                        </name>
                    </representedCustodianOrganization>
                </assignedCustodian>
            </custodian>
            <!--N:默认无，支持RPLC\APND\XFRM-->
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id/>
                    <setId/>
                    <versionNumber/>
                </parentDocument>
            </relatedDocument>
            <!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
            <componentOf typeCode="COMP">
                <!--就诊-->
                <encompassingEncounter classCode="ENC" moodCode="EVN">
                    <code/>
                    <!--就诊时间-->
                    <effectiveTime/>
                    <location typeCode="LOC">
                        <healthCareFacility classCode="SDLOC">
                            <!--机构角色-->
                            <serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
                                <asOrganizationPartOf classCode="PART">
                                    <!--床位号-->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <!--N:加上OID-->
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name>
                                            <xsl:value-of select="BedName"/>
                                        </name>
                                        <!--病房号-->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <!--N:加上OID-->
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name>
                                                    <xsl:value-of select="RoomName"/>
                                                </name>
                                                <!--病区-->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <!--N:加上OID-->
                                                        <id root="2.16.156.10011.1.27" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="AreaCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="AreaName"/>
                                                        </name>
                                                        <!--科室-->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <!--N:加上OID-->
                                                                <id root="2.16.156.10011.1.26" extension="">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="DeptCode"/>
                                                                    </xsl:attribute>
                                                                </id>
                                                                <name>
                                                                    <xsl:value-of select="DeptName"/>
                                                                </name>
                                                            </wholeOrganization>
                                                        </asOrganizationPartOf>
                                                    </wholeOrganization>
                                                </asOrganizationPartOf>
                                            </wholeOrganization>
                                        </asOrganizationPartOf>
                                    </wholeOrganization>
                                </asOrganizationPartOf>
                            </serviceProviderOrganization>
                        </healthCareFacility>
                    </location>
                </encompassingEncounter>
            </componentOf>
            <component>
                <structuredBody>
                    <!--生命体征章节-->
                    <component>
                        <section>
                            <code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重"/>
                                    <!--N:定为生命体征，疑问-->
                                    <value xsi:type="PQ" value="" unit="kg">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientWeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--医嘱章节-->
                    <component>
                        <section>
                            <!--N:!!!-->
                            <code code="46209-3" codeSystem="2.16.840.1.113883.6.1" displayName="Provider Orders" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.286.00" displayName="医嘱类别" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.58" codeSystemName="医嘱类别代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="OrderTypeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="OrderTypeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <xsl:for-each select="OrderInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.289.00" displayName="医嘱项目类型" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.268" codeSystemName="医嘱项目类型代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="OrderItemTypeCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="OrderItemTypeName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.288.00" displayName="医嘱项目内容" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <effectiveTime>
                                                    <!--医嘱计划开始日期时间-->
                                                    <low value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderPlanTimeLow"/>
                                                        </xsl:attribute>
                                                    </low>
                                                    <!--医嘱计划结束日期时间-->
                                                    <high value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderPlanTimeHigh"/>
                                                        </xsl:attribute>
                                                    </high>
                                                </effectiveTime>
                                                <!--医嘱计划信息-->
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OrderPlanDesc"/>
                                                </value>
                                                <!--作者：医嘱开立者-->
                                                <author>
                                                    <!--医嘱开立日期时间：DE06.00.220.00-->
                                                    <time value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderMakeTime"/>
                                                        </xsl:attribute>
                                                    </time>
                                                    <assignedAuthor>
                                                        <id root="2.16.156.10011.1.4" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="OrderMakePersonCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <code displayName="医嘱开立者"/>
                                                        <!--医嘱开立者签名：DE02.01.039.00-->
                                                        <assignedPerson>
                                                            <name>
                                                                <xsl:value-of select="OrderMakePersonName"/>
                                                            </name>
                                                        </assignedPerson>
                                                        <!--医嘱开立科室：DE08.10.026.00-->
                                                        <representedOrganization>
                                                            <name>
                                                                <xsl:value-of select="OrderMakeDeptName"/>
                                                            </name>
                                                        </representedOrganization>
                                                    </assignedAuthor>
                                                </author>
                                                <!--医嘱审核-->
                                                <participant typeCode="ATND">
                                                    <!--医嘱审核日期时间：DE09.00.088.00-->
                                                    <time value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderAuditTime"/>
                                                        </xsl:attribute>
                                                    </time>
                                                    <participantRole classCode="ASSIGNED">
                                                        <id root="2.16.156.10011.1.4" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="OrderAuditPersonCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <!--角色-->
                                                        <code displayName="医嘱审核人"/>
                                                        <!--医嘱审核人签名：DE02.01.039.00-->
                                                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                            <name>
                                                                <xsl:value-of select="OrderAuditPersonName"/>
                                                            </name>
                                                        </playingEntity>
                                                    </participantRole>
                                                </participant>
                                                <!--医嘱核对-->
                                                <participant typeCode="ATND">
                                                    <!--医嘱核对日期时间：DE06.00.205.00-->
                                                    <time value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderCheckTime"/>
                                                        </xsl:attribute>
                                                    </time>
                                                    <participantRole classCode="ASSIGNED">
                                                        <id root="2.16.156.10011.1.4" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="OrderCheckPersonCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <!--角色-->
                                                        <code displayName="医嘱核对人"/>
                                                        <!--医嘱核对护士签名：DE02.01.039.00-->
                                                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                            <name>
                                                                <xsl:value-of select="OrderCheckPersonName"/>
                                                            </name>
                                                        </playingEntity>
                                                    </participantRole>
                                                </participant>
                                                <!--医嘱停止-->
                                                <participant typeCode="ATND">
                                                    <!--医嘱停止日期时间：DE06.00.218.00-->
                                                    <time value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderStopTime"/>
                                                        </xsl:attribute>
                                                    </time>
                                                    <participantRole classCode="ASSIGNED">
                                                        <id root="2.16.156.10011.1.4" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="OrderStopPersonCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <!--角色-->
                                                        <code displayName="医嘱停止人"/>
                                                        <!--停止医嘱者签名：DE02.01.039.00-->
                                                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                            <name>
                                                                <xsl:value-of select="OrderStopPersonName"/>
                                                            </name>
                                                        </playingEntity>
                                                    </participantRole>
                                                </participant>
                                                <!--医嘱取消-->
                                                <participant typeCode="ATND">
                                                    <!--医嘱取消日期时间：DE06.00.234.00-->
                                                    <time value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderCancelTime"/>
                                                        </xsl:attribute>
                                                    </time>
                                                    <participantRole classCode="ASSIGNED">
                                                        <id root="2.16.156.10011.1.4" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="OrderCancelPersonCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <!--角色-->
                                                        <code displayName="医嘱取消人"/>
                                                        <!--取消医嘱者签名：DE02.01.039.00-->
                                                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                            <name>
                                                                <xsl:value-of select="OrderCancelPersonName"/>
                                                            </name>
                                                        </playingEntity>
                                                    </participantRole>
                                                </participant>
                                                <!--医嘱备注信息-->
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE06.00.179.00" displayName="医嘱备注信息" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="OrderNotice"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                                <!--医嘱执行状态-->
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE06.00.290.00" displayName="医嘱执行状态" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="OrderExcuteStatus"/>
                                                        </value>
                                                        <!--执行者-->
                                                        <performer>
                                                            <!--医嘱执行日期时间：DE06.00.222.00-->
                                                            <time value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="OrderExcuteTime"/>
                                                                </xsl:attribute>
                                                            </time>
                                                            <assignedEntity>
                                                                <id root="2.16.156.10011.1.4" extension="">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="OrderExcutePersonCode"/>
                                                                    </xsl:attribute>
                                                                </id>
                                                                <code displayName="医嘱执行者"/>
                                                                <!--医嘱执行者签名：DE02.01.039.00-->
                                                                <assignedPerson>
                                                                    <name>
                                                                        <xsl:value-of select="OrderExcutePersonName"/>
                                                                    </name>
                                                                </assignedPerson>
                                                                <!--医嘱执行科室：DE08.10.026.00-->
                                                                <representedOrganization>
                                                                    <name>
                                                                        <xsl:value-of select="OrderExcuteDeptName"/>
                                                                    </name>
                                                                </representedOrganization>
                                                            </assignedEntity>
                                                        </performer>
                                                    </observation>
                                                </entryRelationship>
                                                <!--电子申请单编号：例如检查检验申请单编号？？？-->
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE01.00.008.00" displayName="电子申请单编号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="ApplyID"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                                <!--处方药品组号：例如如果是用药医嘱的话指向处方单号？？？-->
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE08.50.056.00" displayName="处方药品组号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="DrugGroupNum"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>