<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0025">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <!-- 文档信息模型类别-标识符 HL7注册模型的编码系统OID -->
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <!-- 文档模板的根OID -->
            <templateId root="2.16.156.10011.2.1.1.45"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <!-- 中国卫生信息开放系统互连对象标识OID分配表 表D.4 固定对象OID分配 2.16.156.10011.2.4-->
            <code code="C0025" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <!--修改title-->
            <title>出院评估与指导</title>
            <!-- 文档机器生成时间 -->
            <effectiveTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </effectiveTime>
            <!-- 文档密级 表C.3 ClinicalDocument.confidentialityCode值域表 (CWE) -->
            <confidentialityCode code="N" displayName="正常访问保密级别" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality"/>
            <!-- 文档语言 表达文档采用的语言 代码值取HL7内部编码系统codeSystem ="2.16.840.1.113883.6.121". 人类语言编码系统 -->
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
                        <!-- DE02.01.030.00患者的身份证件上的唯一法定标识符 -->
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
            <author typeCode="AUT" contextControlCode="OP">
                <!-- 填表日期 -->
                <time value="20110404"/>
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
                <assignedEntity classCode="ASSIGNED">
                    <!--医务人员标识 OID 表D.2 可维护对象OID分配表 -->
                    <!--HDSD00.09.025 DE02.01.039.00 护士签名 -->
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AuditCode"/>
                        </xsl:attribute>
                    </id>
                    <assignedPerson classCode="PSN">
                        <name>
                            <xsl:value-of select="AuditName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
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
            <component>
                <structuredBody>
                    <!--出院诊断章节-->
                    <component>
                        <section>
                            <code code="11535-2" displayName="Discharge Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="DischargeDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" displayName="出院诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <!--HDSD00.09.008 DE05.01.024.00 出院诊断编码 -->
                                        <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="DischargeDiagCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="DischargeDiagName"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.017.00" displayName="出院日期时间" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.007 DE06.00.017.00 出院日期时间 -->
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="DischargeTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.193.00" displayName="出院情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.006 DE06.00.193.00 出院情况 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DischargeDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.223.00" displayName="离院方式代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.037 DE06.00.223.00 离院方式代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.265" codeSystemName="离院方式代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DischargeWayCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="DischargeWayName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--健康指导章节 -->
                    <component>
                        <section>
                            <code code="69730-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Instructions"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.291.00" displayName="饮食指导代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.077 DE03.00.080.00 饮食情况代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.263" codeSystemName="饮食指导代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DietGuidanceCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="DietGuidanceName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.238.00" displayName="生活方式指导" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.055 DE06.00.238.00 生活方式指导 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="LifeStyleGuidanceDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.124.00" displayName="宣教内容" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.072 DE06.00.124.00 宣教内容 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PropagandaDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.299.00" displayName="复诊指导" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.012 DE06.00.299.00 复诊指导 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReviewGuidanceDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.136.00" displayName="用药指导" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.080 DE06.00.136.00 用药指导 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DrugGuidanceDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--健康评估章节 -->
                    <component>
                        <section>
                            <code code="51848-0" displayName="Assessment note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.122.00" displayName="自理能力代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.086 DE05.10.122.00 自理能力代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.55" codeSystemName="自理能力代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="SelfCareCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="SelfCareName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.080.00" displayName="饮食情况代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--HDSD00.09.077 DE03.00.080.00 饮食情况代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.34" codeSystemName="饮食情况代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DietCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="DietName"/>
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