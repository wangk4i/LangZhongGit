<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0024">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <!-- 文档信息模型类别-标识符 HL7注册模型的编码系统OID -->
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <!-- 文档模板的根OID -->
            <templateId root="2.16.156.10011.2.1.1.44"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <!-- 卫生信息共享文档分类编码系统OID 表A.1 卫生信息共享文档分类编码系 -->
            <code code="C0024" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <!--修改title-->
            <title>护理计划</title>
            <!-- 文档机器生成时间 -->
            <effectiveTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </effectiveTime>
            <!-- 文档密级-->
            <confidentialityCode code="N" displayName="正常访问保密级别" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality"/>
            <!-- 文档语言 表达文档采用的语言 代码值取HL7内部编码系统codeSystem =
        "2.16.840.1.113883.6.121". 人类语言编码系统 -->
            <languageCode code="zh-CN"/>
            <!--文档集-标识符 该属性用于维护一份连续更新的文档，创建一个统一的文档集合标识符 -->
            <setId>
                <xsl:value-of select="DocSetID"/>
            </setId>
            <versionNumber>
                <xsl:value-of select="Version"/>
            </versionNumber>
            <!--文档记录对象 用于表达此文档的患者信息 -->
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!-- DE01.00.021.00健康卡号-->
                    <id root="2.16.156.10011.1.19" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HealthCardCode"/>
                        </xsl:attribute>
                    </id>
                    <!-- 住院号标识 表F.2 可维护对象OID分配表-->
                    <!-- HDSD00.09.085 DE01.00.014.00 住院号-->
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
                        <!-- HDSD00.09.029 DE02.01.039.00 患者姓名 -->
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <!-- HDSD00.09.071 DE02.01.040.00 性别代码 -->
                        <administrativeGenderCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                    <providerOrganization>
                        <asOrganizationPartOf classCode="PART">
                            <!--HDSD00.09.003 DE01.00.026.00 病床号 -->
                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                <id root="2.16.156.10011.1.22" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="BedCode"/>
                                    </xsl:attribute>
                                </id>
                                <name>
                                    <xsl:value-of select="BedName"/>
                                </name>
                                <!--HDSD00.09.004 DE01.00.019.00 病房号 -->
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
                                        <!--HDSD00.09.036 DE08.10.026.00 科室名称 -->
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
                                                <!--HDSD00.09.005 DE08.10.054.00 病区名称 -->
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
                                                                <!-- 医疗卫生服务机构标识 表F.2 可维护对象OID分配表-->
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
                    </providerOrganization>
                </patientRole>
            </recordTarget>
            <!-- 创作者 -->
            <author>
                <!-- 填表日期 -->
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
                    <!-- 访视医生姓名 -->
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <!--文档管理者 -->
            <custodian typeCode="CST">
                <assignedCustodian classCode="ASSIGNED">
                    <representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
                        <!--医疗卫生服务机构标识 OID 表D.2 可维护对象OID分配表 -->
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
            <!--文档审核者 该部分信息表达文档经过了一定的审核，但还没达到一定的法律效应 -->
            <authenticator typeCode="AUTHEN">
                <!--HDSD00.09.047 DE09.00.053.00 签名日期时间 -->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="AuditTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <!--医务人员标识 OID 表D.2 可维护对象OID分配表 -->
                    <!--HDSD00.09.025 DE02.01.039.00 护士签名 -->
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AuditNurseCode"/>
                        </xsl:attribute>
                    </id>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuditNurseName"/>
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
            <component>
                <structuredBody>
                    <!--主要健康问题章节-->
                    <component>
                        <section>
                            <code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" displayName="疾病诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DiagCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="DiagName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 护理记录章节 -->
                    <component>
                        <section>
                            <code displayName="护理记录"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.211.00" displayName="护理等级代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.020 DE06.00.211.00 护理等级代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.259" codeSystemName="护理等级代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="NursingGradeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="NursingGradeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.212.00" displayName="护理类型代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.023 DE06.00.212.00 护理类型代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.260" codeSystemName="护理类型代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="NursingTypeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="NursingTypeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.136.00" displayName="护理问题" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.024 DE05.10.136.00 护理问题 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="NursingProblemDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.342.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作名称"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="NursingOperateName"/>
                                    </value>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.210.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作项目类目名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="NursingOperateCategoryName"/>
                                            </value>
                                            <entryRelationship typeCode="COMP">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="DE06.00.209.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作结果"/>
                                                    <value xsi:type="ST">
                                                        <xsl:value-of select="NursingOperateResult"/>
                                                    </value>
                                                </observation>
                                            </entryRelationship>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.209.00" displayName="导管护理" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.010 DE06.00.209.00 导管护理描述 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="CatheterCareDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.259.00" displayName="体位护理" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.062 DE04.10.259.00 体位护理 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PosturalCareDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.068.00" displayName="皮肤护理" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.044 DE04.50.068.00 皮肤护理 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SkinCareDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.229.00" displayName="气管护理代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!-- HDSD00.09.046 DE06.00.229.00 气管护理代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.50" codeSystemName="气管护理代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="TracheaCareCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="TracheaCareName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.178.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="安全护理代码"/>
                                    <!--HDSD00.09.002 DE06.00.178.00 安全护理代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.52" codeSystemName="安全护理代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="SafetyCareCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="SafetyCareName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--健康指导章节-->
                    <component>
                        <section>
                            <code code="69730-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Instructions"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.291.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮食指导代码"/>
                                    <!--HDSD00.09.078 DE06.00.291.00 饮食指导代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.263" codeSystemName="饮食指导代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DietInstructionCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="DietInstructionName"/>
                                        </xsl:attribute>
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