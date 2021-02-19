<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0047">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.67"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0047" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <!--title-->
            <title>术前讨论</title>
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
                    <!--住院号 -->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
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
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                    <!--讨论的日期时间-->
                    <providerOrganization classCode="ORG" determinerCode="INSTANCE">
                        <asOrganizationPartOf classCode="PART">
                            <!--讨论时间 -->
                            <effectiveTime value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="DiscussTime"/>
                                </xsl:attribute>
                            </effectiveTime>
                            <wholeOrganization>
                                <addr>
                                    <xsl:value-of select="DiscussAddr"/>
                                </addr>
                            </wholeOrganization>
                        </asOrganizationPartOf>
                    </providerOrganization>
                </patientRole>
            </recordTarget>
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
            <xsl:for-each select="Surgeons/row">
                <authenticator>
                    <!-- DE09.00.053.00签名日期时间 -->
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
                        <code displayName="手术者"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                            <professionalTechnicalPosition>
                                <professionaltechnicalpositionCode code="" codeSystem="2.16.156.10011.2.3.1.209" codeSystemName="专业技术职务类别代码表" displayName="">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="TechPositionCode"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="displayName">
                                        <xsl:value-of select="TechPositionName"/>
                                    </xsl:attribute>
                                </professionaltechnicalpositionCode>
                            </professionalTechnicalPosition>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <xsl:for-each select="Anesthetist/row">
                <authenticator>
                    <!-- DE09.00.053.00签名日期时间 -->
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
                        <code displayName="麻醉医师"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                            <professionalTechnicalPosition>
                                <professionaltechnicalpositionCode code="" codeSystem="2.16.156.10011.2.3.1.209" codeSystemName="专业技术职务类别代码表" displayName="">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="TechPositionCode"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="displayName">
                                        <xsl:value-of select="TechPositionName"/>
                                    </xsl:attribute>
                                </professionaltechnicalpositionCode>
                            </professionalTechnicalPosition>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <xsl:for-each select="Doctor/row">
                <authenticator>
                    <!-- DE09.00.053.00签名日期时间 -->
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
                        <code displayName="医师"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                            <professionalTechnicalPosition>
                                <professionaltechnicalpositionCode code="" codeSystem="2.16.156.10011.2.3.1.209" codeSystemName="专业技术职务类别代码表" displayName="">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="TechPositionCode"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="displayName">
                                        <xsl:value-of select="TechPositionName"/>
                                    </xsl:attribute>
                                </professionaltechnicalpositionCode>
                            </professionalTechnicalPosition>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!--讨论成员信息-->
            <participant typeCode="CON">
                <associatedEntity classCode="ECON">
                    <!--参加讨论人员名单-->
                    <associatedPerson>
                        <xsl:for-each select="Discussants/DiscussantsItem">
                            <name>
                                <xsl:value-of select="."/>
                            </name>
                        </xsl:for-each>
                    </associatedPerson>
                    <!--scopingOrganization>
                        <讨论地点>
                        <addr>讨论地点：XX会议室</addr>
                        </scopingOrganization-->
                </associatedEntity>
            </participant>
            <!--讨论主持人信息-->
            <xsl:for-each select="Host/row">
                <participant typeCode="ORG">
                    <associatedEntity classCode="ECON">
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <associatedPerson>
                            <!--主持人姓名-->
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </associatedPerson>
                    </associatedEntity>
                </participant>
            </xsl:for-each>
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
            <!-- 病床号、病房、病区、科室和医院的关联 -->
            <componentOf>
                <encompassingEncounter>
                    <effectiveTime/>
                    <location>
                        <healthCareFacility>
                            <serviceProviderOrganization>
                                <asOrganizationPartOf classCode="PART">
                                    <!--HDSD00.09.003 DE01.00.026.00 病床号 -->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <!--HDSD00.09.004 DE01.00.019.00 病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <!--HDSD00.09.036 DE08.10.026.00 科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <!--HDSD00.09.005 DE08.10.054.00 病区名称-->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
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
            <component>
                <structuredBody>
                    <!--术前诊断章节-->
                    <component>
                        <section>
                            <code code="10219-4" displayName="Surgical operation note preoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="PreDiagCode/PreDiagCodeItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="ICD-10诊断编码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.092.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院日期时间"/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PreEncounterTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--治疗计划章节-->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟实施手术及操作名称"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PlanOperationName"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.093.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟实施手术及操作编码"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="ICD-9-CM-3">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PlanOperationCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.187.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟实施手术目标部位名称"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PlanPosition"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.221.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟实施手术及操作日期时间"/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PlanTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟实施麻醉方法代码"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PlanPosition"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--手术操作章节-->
                    <component>
                        <section>
                            <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.254.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术要点"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="OperationKey"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.271.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前准备"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="OperationPreparation"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术指征"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="OperationIndications"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.301.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术方案"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="OperationProgramme"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE09.00.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="注意事项"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="Notices"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--术前总结章节-->
                    <component>
                        <section>
                            <code displayName="讨论总结"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="讨论意见"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DiscussOpinion"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="讨论结论"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DiscussResult"/>
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