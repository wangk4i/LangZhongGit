<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0026">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.46"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0026" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>手术知情告知书</title>
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
                            <xsl:value-of select="InformedConsent"/>
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
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!--出生日期-->
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
            <!--作者-->
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
            <!--医师签名-->
            <legalAuthenticator typeCode="LA">
                <!-- DE02.01.039.00经治医师签名 -->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="AttendingDoctorSignTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AttendingDoctorCode"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="经治医师"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AttendingDoctorName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
            <!-- 手术者签名 -->
            <authenticator>
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="OperateDoctorSignTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="OperateDoctorCode"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="手术者"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="OperateDoctorName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
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
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="PatientCode"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="患者"/>
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
                    <code code="" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表(GB/T 4761)">
                        <xsl:attribute name="code">
                            <xsl:value-of select="AgentRelCode"/>
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
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <!-- DE01.00.019.00病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
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
            <!--CDA body-->
            <component>
                <structuredBody>
                    <!--术前诊断章节-->
                    <component>
                        <section>
                            <code code="10219-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Surgical operation note preoperative Dx"/>
                            <text/>
                            <xsl:for-each select="PreoperativeDiagInfo/row">
                                <entry typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="PreoperativeDiagCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="PreoperativeDiagName"/>
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
                            <!--拟实施手术-->
                            <xsl:for-each select="AnticipatedOperationInfo/row">
                                <entry>
                                    <!--拟实施手术-->
                                    <procedure classCode="PROC" moodCode="RQO">
                                        <code code="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)" displayName="">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="AnticipatedOperationCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="AnticipatedOperationName"/>
                                            </xsl:attribute>
                                        </code>
                                        <statusCode code="new"/>
                                        <!--手术时间-->
                                        <effectiveTime value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="OperationTime"/>
                                            </xsl:attribute>
                                        </effectiveTime>
                                        <!--手术方式描述-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.302.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术方式"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationMethodDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--手术前的准备-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.271.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前准备"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="PreoperativePreparationDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--手术禁忌症-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="DEF">
                                                <code code="DE05.10.141.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术禁忌症"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationContraindication"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--手术指征-->
                                        <entryRelationship typeCode="RSON">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术指征"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="SurgicalIndication"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--拟麻醉信息-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟实施麻醉方法代码"/>
                                                <value code="" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表" xsi:type="CD" displayName="">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="AnticipatedAnesthesiaMethodCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="AnticipatedAnesthesiaMethodName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
                            <!--替代方案-->
                            <entry>
                                <observation classCode="OBS" moodCode="DEF">
                                    <code code="DE06.00.301.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="替代方案"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="AlternativesDesc"/>
                                    </value>
                                </observation>
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
                                        <xsl:value-of select="OrganOpinions"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--患者意见-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者的意见"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PatientOpinions"/>
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
                            <!--手术中可能出现的意外-->
                            <entry>
                                <observation classCode="OBS" moodCode="DEF">
                                    <code code="DE05.10.162.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术中可能出现的意外及风险"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="IntraoperativeRisk"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--手术后可能出现的意外-->
                            <entry>
                                <observation classCode="OBS" moodCode="DEF">
                                    <code code="DE05.01.075.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术后可能出现的意外以及风险"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PostoperativeRisk"/>
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