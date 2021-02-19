<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0028">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.48"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0028" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>输血治疗同意书</title>
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
                        <administrativeGenderCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
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
                <time xsi:type="TS" value="">
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
            <!--医师签名 -->
            <legalAuthenticator typeCode="LA">
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="AttendingDoctorSignTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode code="s"/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AttendingDoctorCode"/>
                        </xsl:attribute>
                    </id>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AttendingDoctorName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
            <!--
        患者签名 DE02.01.039.00 患者/法定代理人签名
        4、DE09.00.053.00 患者/法定代理人签名日期时间
        -->
            <authenticator>
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
            <!--
        代理人签名 DE02.01.039.00 患者/法定代理人签名
        4、DE09.00.053.00 患者/法定代理人签名日期时间
        -->
            <authenticator>
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
                    <code code="" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表（GB/T4761）">
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
            <!--BODY-->
            <component>
                <structuredBody>
                    <!--诊断章节-->
                    <component>
                        <section>
                            <code code="29548-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Diagnosis"/>
                            <text/>
                            <!--疾病诊断编码-->
                            <xsl:for-each select="PreoperativeDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
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
                    <!--输血章节-->
                    <component>
                        <section>
                            <code code="56836-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="History of blood transfusion"/>
                            <text/>
                            <xsl:for-each select="TransfusionHistoryInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.106.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <!--1无，2有，9未说明-->
                                        <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.49" codeSystemName="输血史标识代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="TransfusionHistoryCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="TransfusionHistoryName"/>
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
                                <!--输血过程-->
                                <procedure classCode="PROC" moodCode="EVN">
                                    <code/>
                                    <!--输血时间-->
                                    <effectiveTime>
                                        <xsl:value-of select="TransfusionTime"/>
                                    </effectiveTime>
                                    <!--输血方式-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.266.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血方式"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="TransfusionMethod"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--输血指征-->
                                    <entryRelationship typeCode="CAUS">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血指征"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="TransfusionTrigger"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--输血品种代码-->
                                    <entryRelationship typeCode="COMP">
                                        <substanceAdministration classCode="SBADM" moodCode="RQO">
                                            <consumable>
                                                <manufacturedProduct>
                                                    <manufacturedMaterial>
                                                        <code code="" codeSystem="2.16.156.10011.2.3.1.251" codeSystemName="输血品种代码表" displayName="">
                                                            <xsl:attribute name="code">
                                                                <xsl:value-of select="TransfusionVarietyCode"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="displayName">
                                                                <xsl:value-of select="TransfusionVarietyName"/>
                                                            </xsl:attribute>
                                                        </code>
                                                    </manufacturedMaterial>
                                                </manufacturedProduct>
                                            </consumable>
                                        </substanceAdministration>
                                    </entryRelationship>
                                    <!--输血前有关检查项目以及结果-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.109.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血前有关检查项目以及结果"/>
                                            <value xsi:type="ED">
                                                <xsl:value-of select="PreTransfusionExamItemResult"/>
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
                            <!--输血风险及可能发生的不良后果-->
                            <entry>
                                <observation classCode="OBS" moodCode="DEF">
                                    <code code="DE06.00.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血风险及可能发生的不良后果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TransfusionRisk"/>
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