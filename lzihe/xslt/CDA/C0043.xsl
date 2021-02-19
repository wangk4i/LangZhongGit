<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0043">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.63"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0043" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>阶段小结</title>
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
            <!--文档记录对象（患者） [1..*] contextControlCode="OP"表示本信息可以被重载-->
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--住院号标识-->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!--1 数据集里是年龄（年）、年龄（月）-->
                        <birthTime value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/BirthTime"/>
                            </xsl:attribute>
                        </birthTime>
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                </patientRole>
            </recordTarget>
            <!-- 文档创作者 -->
            <author typeCode="AUT" contextControlCode="OP">
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
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <!-- 保管机构 -->
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
            <!-- 签名 -->
            <xsl:for-each select="DocSignInfo/row">
                <authenticator>
                    <!--签名日期时间-->
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="医师签名"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!--小结日期时间-->
            <documentationOf>
                <serviceEvent>
                    <code/>
                    <effectiveTime value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="SummaryTime"/>
                        </xsl:attribute>
                    </effectiveTime>
                </serviceEvent>
            </documentationOf>
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id>
                        <xsl:value-of select="ParentDocID"/>
                    </id>
                    <setId>
                        <xsl:value-of select="ParentDocSetID"/>
                    </setId>
                    <versionNumber>
                        <xsl:value-of select="ParentVersion"/>
                    </versionNumber>
                </parentDocument>
            </relatedDocument>
            <componentOf>
                <encompassingEncounter>
                    <code displayName="入院日期时间"/>
                    <effectiveTime xsi:type="IVL_TS" value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="EncounterTime"/>
                        </xsl:attribute>
                    </effectiveTime>
                    <location>
                        <healthCareFacility>
                            <serviceProviderOrganization>
                                <asOrganizationPartOf classCode="PART">
                                    <!-- DE01.00.026.00 病床号 -->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name>
                                            <xsl:value-of select="BedName"/>
                                        </name>
                                        <!-- DE01.00.019.00 病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name>
                                                    <xsl:value-of select="RoomName"/>
                                                </name>
                                                <!-- DE08.10.026.00 科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="DeptCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="DeptName"/>
                                                        </name>
                                                        <!-- DE08.10.054.00 病区名称 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27" extension="">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="AreaCode"/>
                                                                    </xsl:attribute>
                                                                </id>
                                                                <name>
                                                                    <xsl:value-of select="AreaName"/>
                                                                </name>
                                                                <!--医疗机构名称 -->
                                                                <asOrganizationPartOf classCode="PART">
                                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                        <id root="2.16.156.10011.1.5" extension="">
                                                                            <xsl:attribute name="extension">
                                                                                <xsl:value-of select="OrganCode"/>
                                                                            </xsl:attribute>
                                                                        </id>
                                                                        <name>
                                                                            <xsl:value-of select="OrganName"/>
                                                                        </name>
                                                                    </wholeOrganization>
                                                                </asOrganizationPartOf>
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
            <!--
            ***************************************************
            文档体Body
            ***************************************************
            -->
            <component>
                <structuredBody>
                    <!--
                    *******************************************************
                    主诉章节
                    *******************************************************
                    -->
                    <component>
                        <section>
                            <code code="10154-3" displayName="CHIEF COMPLAINT" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry typeCode="COMP" contextConductionInd="true">
                                <!-- 主诉-->
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.119.00" displayName="主诉" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChiefComplaintsDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    **************************************************
                    入院诊断章节
                    **************************************************
                    -->
                    <!--入院诊断章节-->
                    <component>
                        <section>
                            <code code="46241-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HOSPITAL ADMISSION DX"/>
                            <text/>
                            <!--入院情况-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE05.10.148.00" displayName="入院情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="EncounterDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--入院诊断-西医诊断名称-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-西医诊断编码"/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.256" codeSystemName="卫生信息数据元目录">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="EncounterWMDiagCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="EncounterWMDiagName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--入院诊断-中医病名代码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" displayName="入院诊断-中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                        <qualifier>
                                            <name displayName="中医病名代码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657-1995)">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="EncounterTCMDiagCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--入院诊断-中医证候代码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" displayName="入院诊断-中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                        <qualifier>
                                            <name displayName="中医 证候名称"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="EncounterTCMSyndromeCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    诊断章节
                    ********************************************************
                    -->
                    <!--诊断章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--条目:目前情况-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE06.00.184.00" displayName="目前情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PresentDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--目前诊断-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" displayName="目前诊断-西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="诊断代码ICD-10">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PresentWMDiagCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--目前诊断-中医病名代码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" displayName="目前诊断-中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                        <qualifier>
                                            <name displayName="中医病名代码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657-1995)">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PresentTCMDiagCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--目前诊断-中医证候代码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" displayName="目前诊断-中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                        <qualifier>
                                            <name displayName="中医证候代码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（ GB/T 15657-1995）">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PresentTCMSyndromeCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--中医“四诊”观察结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE02.10.028.00" displayName="中医“四诊”观察结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PresentTCMDiagResult"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    治疗计划章节
                    ********************************************************
                    -->
                    <!--治疗计划章节 1..*-->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--今后治疗方案-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.159.00" displayName="今后治疗方案" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPlan"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--治则治法-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPrinciple"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    ******************************************************
                    用药章节
                    ******************************************************
                    -->
                    <component>
                        <section>
                            <code code="10160-0" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF MEDICATION USE" codeSystemName="LOINC"/>
                            <text/>
                            <!--医嘱内容-->
                            <entry>
                                <observation classCode="OBS " moodCode="EVN ">
                                    <code code="DE06.00.287.00" displayName="医嘱内容" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="OrderContent"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--中药煎煮方法-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE08.50.047.00" displayName="中药煎煮方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TCMCookWay"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--中药用药方法-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE06.00.136.00" displayName="中药用药方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TCMUesWay"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    ****************************************************
                    医院过程章节
                    ****************************************************
                    -->
                    <component>
                        <section>
                            <code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
                            <text/>
                            <!--诊疗过程描述-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.296.00" displayName="诊疗过程描述" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>