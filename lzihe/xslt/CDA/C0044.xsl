<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0044">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.64"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0044" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>抢救记录</title>
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
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!--1数据集里是年龄（年）、年龄（月）-->
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
                    <assignedPerson classCode="PSN" determinerCode="INSTANCE">
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
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                            <professionalTechnicalPosition>
                                <professionaltechnicalpositionCode code="" codeSystem="2.16.156.10011.2.3.1.209" codeSystemName="专业技术职务类别代码表" displayName="">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="PositionCode"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="displayName">
                                        <xsl:value-of select="PositionName"/>
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
                        <xsl:for-each select="ParticipantsName/ParticipantsNameItem">
                            <name>
                                <xsl:value-of select="."/>
                            </name>
                        </xsl:for-each>
                    </associatedPerson>
                </associatedEntity>
            </participant>
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id/>
                    <setId/>
                    <versionNumber/>
                </parentDocument>
            </relatedDocument>
            <componentOf>
                <encompassingEncounter>
                    <code displayName="入院日期时间"/>
                    <effectiveTime xsi:type="IVL_TS" value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="AdmTime"/>
                        </xsl:attribute>
                    </effectiveTime>
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
                                        <name>
                                            <xsl:value-of select="BedName"/>
                                        </name>
                                        <!-- DE01.00.019.00病房号 -->
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
            <!--***************************************************
          文档体Body
          *******************************************************
          -->
            <component>
                <structuredBody>
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
                            <!--条目:疾病诊断-->
                            <xsl:for-each select="DiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN ">
                                        <code code="DE05.01.025.00" displayName="疾病诊断名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="DiagName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.024.00" displayName="疾病诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="诊断代码表ICD-10">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DiagCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--病情变换情况-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.134.00" displayName="病情变化情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DiseaseChangeDesc"/>
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
                            <!--注意事项-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE09.00.119.00" displayName="注意事项" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="Notice"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
              ******************************************************
              手术操作章节
              ******************************************************
              -->
                    <component>
                        <section>
                            <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="OperationInfo/row">
                                <entry>
                                    <!-- 1..1 手术及操作编码 -->
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <code code="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OperationCode"/>
                                            </xsl:attribute>
                                        </code>
                                        <statusCode/>
                                        <!--手术操作目标部位名称DE06.00.187.00-->
                                        <targetSiteCode code="" codeSystem=" 2.16.156.10011.2.3.1.266" codeSystemName="操作部位代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OperationPartCode"/>
                                            </xsl:attribute>
                                        </targetSiteCode>
                                        <!--手术及操作名称-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN ">
                                                <code code="DE06.00.094.00" displayName="手术及操作名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationName"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--介入物名称-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS " moodCode="EVN ">
                                                <code code="DE08.50.037.00" displayName="介入物名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationInterventionName"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--操作方法-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN ">
                                                <code code="DE06.00.251.00" displayName="操作方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationMethodDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--操作次数-->
                                        <entryRelationship typeCode="COMP ">
                                            <observation classCode="OBS" moodCode="EVN ">
                                                <code code="DE06.00.250.00" displayName="操作次数" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="PQ" value="" unit="次">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="OperationNum"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
                            <!--抢救措施-->
                            <entry>
                                <procedure classCode="ACT" moodCode="EVN ">
                                    <code code="DE06.00.094.00" displayName="抢救措施" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <text xsi:type="ST">
                                        <xsl:value-of select="RescueMeasure"/>
                                    </text>
                                </procedure>
                            </entry>
                            <!--抢救开始日期时间-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.221.00" displayName="抢救开始日期时间" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="RescueStartTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--抢救结束日期时间-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.218.00" displayName="抢救结束日期时间" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="RescueEndTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
              ******************************************************
              实验室检查章节
              ******************************************************
              -->
                    <component>
                        <section>
                            <code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="STUDIES SUMMARY"/>
                            <text/>
                            <!--检查/检验项目-->
                            <xsl:for-each select="ExaminationInfo/row">
                                <entry>
                                    <observation classCode="OBS " moodCode="EVN ">
                                        <code code="DE04.30.020.00" displayName="检查/检验项目名称" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="ExamItemName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <!--检查/检验结果-->
                                            <observation classCode="OBS " moodCode="EVN ">
                                                <code code="DE04.30.009.00" displayName="检查/检验结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="ExamResult"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <!--检查/检验定量结果-->
                                            <observation classCode="OBS " moodCode="EVN ">
                                                <code code="DE04.30.015.00" displayName="检查/检验定量结果" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="PQ" value="" unit="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="QuantitativeResultValue"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="unit">
                                                        <xsl:value-of select="QuantitativeResultUnit"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <!--检查/检验结果代码-->
                                            <observation classCode="OBS " moodCode="EVN ">
                                                <code code="DE04.30.017.00" displayName="检查/检验结果代码" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.38" codeSystemName="检查/检验结果代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ResultCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="ResultName"/>
                                                    </xsl:attribute>
                                                </value>
                                                <!--1.正常 2.异常 3.不确定-->
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>