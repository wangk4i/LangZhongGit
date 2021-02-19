<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0027">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.47"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0027" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>麻醉知情同意书</title>
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
            <!--患者信息-->
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole>
                    <!--门诊号-->
                    <id root="2.16.156.10011.1.11" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="OutPatientID"/>
                        </xsl:attribute>
                    </id>
                    <!--住院号-->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
                    <!-- 知情同意书编号 -->
                    <id root="2.16.156.10011.1.34" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="InformedConsentID"/>
                        </xsl:attribute>
                    </id>
                    <patient>
                        <!--患者身份证号标识-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <!--性别-->
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" displayName="" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!--出生日期-->
                        <birthTime value="19580115"/>
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                </patientRole>
            </recordTarget>
            <!--作者-->
            <author typeCode="AUT" contextControlCode="OP">
                <time value="20110404"/>
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
            <!--麻醉医师签名 DE02.01.039.00 -->
            <legalAuthenticator typeCode="LA">
                <!-- DE09.00.053.00麻醉医师签名日期时间 -->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="AnaesthesiaTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AnaesthesiaCode"/>
                        </xsl:attribute>
                    </id>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AnaesthesiaName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
            <!-- 患者签名 -->
            <authenticator>
                <!-- DE09.00.053.00签名日期时间 -->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="PatientSignTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.3" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="PatientCode"/>
                        </xsl:attribute>
                    </id>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="PatientSignName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
            <!--代理人签名-->
            <authenticator>
                <!-- DE09.00.053.00签名日期时间 -->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="AgentSignTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.3" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AgentCode"/>
                        </xsl:attribute>
                    </id>
                    <!--代理人关系-->
                    <code code="" codeSystem="2.16.156.10011.2.3.3.8" displayName="" codeSystemName="家庭关系代码表(GB/T 4761)">
                        <xsl:attribute name="code">
                            <xsl:value-of select="AgentRelCode"/>
                        </xsl:attribute>
                        <xsl:attribute name="displayName">
                            <xsl:value-of select="AgentRelName"/>
                        </xsl:attribute>
                    </code>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AgentName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id/>
                    <setId/>
                    <versionNumber/>
                </parentDocument>
            </relatedDocument>
            <!-- 病床号、病房、病区、科室和医院的关联 -->
            <componentOf>
                <encompassingEncounter>
                    <effectiveTime/>
                    <location>
                        <healthCareFacility>
                            <serviceProviderOrganization>
                                <asOrganizationPartOf classCode="PART">
                                    <!-- DE01.00.026.00病床号 -->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="RoomCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <!-- DE01.00.019.00病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="AreaCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <!-- DE08.10.026.00科室名称 -->
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
                                                        <!-- DE08.10.054.00病区名称 -->
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
                                                                <!--XXX医院 -->
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
            <!--body-->
            <component>
                <structuredBody>
                    <!--术前诊断章节-->
                    <component>
                        <section>
                            <code code="10219-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Surgical operation note preoperative Dx"/>
                            <text/>
                            <!--术前诊断编码-->
                            <xsl:for-each select="PreDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
                                        <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="PreDiagCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="PreDiagName"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--治疗计划章节-->
                    <component>
                        <section>
                            <code code="18776-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="TREATMENT PLAN"/>
                            <text/>
                            <entry>
                                <!--拟实施麻醉-->
                                <procedure classCode="PROC" moodCode="EVN">
                                    <code code="" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName=" 麻醉方法代码表" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="AnaesthesiaWayCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="AnaesthesiaWayName"/>
                                        </xsl:attribute>
                                    </code>
                                    <statusCode code="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="StatusCode"/>
                                        </xsl:attribute>
                                    </statusCode>
                                    <!--拟实施时间-->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PlanTime"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <!--拟实施手术-->
                                    <entryRelationship typeCode="CAUS">
                                        <procedure classCode="PROC" moodCode="EVN">
                                            <code code="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM)" displayName="">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PlanSurgeryCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="PlanSurgeryName"/>
                                                </xsl:attribute>
                                            </code>
                                        </procedure>
                                    </entryRelationship>
                                    <!--拟行有创操作和检测方法-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟行有创操作和检测方法"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="PlanWay"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--基础疾病可能对麻醉产生的影像-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="DEF">
                                            <code code="DE05.10.146.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="基础疾病可能对麻醉产生的影响"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="BasicDiseasesImg"/>
                                            </value>
                                            <!--基础疾病-->
                                            <entryRelationship typeCode="CAUS">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="DE04.01.121.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者基础疾病"/>
                                                    <value xsi:type="ST">
                                                        <xsl:value-of select="BasicDiseases"/>
                                                    </value>
                                                </observation>
                                            </entryRelationship>
                                        </observation>
                                    </entryRelationship>
                                    <!--使用麻醉镇痛泵标志-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="DEF">
                                            <code code="DE06.00.240.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="使用麻醉镇痛汞标志"/>
                                            <value xsi:type="BL" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PCEASign"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--参加麻醉安全保险标志-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="DEF">
                                            <code code="DE01.00.016.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="参加麻醉安全保险标志"/>
                                            <value xsi:type="BL" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="InsuranceSign"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </procedure>
                            </entry>
                        </section>
                    </component>
                    <!--意见章节-->
                    <component>
                        <section>
                            <code displayName="意见章节"/>
                            <text/>
                            <!--医疗机构意见-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗机构的意见"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="OrganOpinion"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--患者意见-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者的意见"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PatientOpinion"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--风险章节-->
                    <component>
                        <section>
                            <code displayName="操作风险"/>
                            <text/>
                            <!--麻醉中可能出现的意外-->
                            <entry>
                                <observation classCode="OBS" moodCode="DEF">
                                    <code code="DE05.01.075.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉中，麻醉后可能产发生的意外及并发症"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="RiskDesc"/>
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