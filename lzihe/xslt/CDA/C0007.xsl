<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0007">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.27"/>
            <!--文档流水号-->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0007" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>检验记录</title>
            <!--文档机器生成时间-->
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
            <!--文档记录对象（患者）-->
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--门（急）诊号标识 -->
                    <id root="2.16.156.10011.1.11" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="OutPatientID"/>
                        </xsl:attribute>
                    </id>
                    <!--住院号标识 -->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
                    <!--检验报告单号标识 -->
                    <id root="2.16.156.10011.1.33" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ReportID"/>
                        </xsl:attribute>
                    </id>
                    <!--电子申请单编号 -->
                    <id root="2.16.156.10011.1.24" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ApplyID"/>
                        </xsl:attribute>
                    </id>
                    <!--检验标本编号标识  -->
                    <id root="2.16.156.10011.1.14" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="SpecimenID"/>
                        </xsl:attribute>
                    </id>
                    <!--患者类别代码-->
                    <patientType>
                        <patienttypeCode code="" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientTypeCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientTypeName"/>
                            </xsl:attribute>
                        </patienttypeCode>
                    </patientType>
                    <xsl:for-each select="TelPhone/TelPhoneItem">
                        <telecom value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </telecom>
                    </xsl:for-each>
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
                        <!--年龄-->
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                </patientRole>
            </recordTarget>
            <!--检验报告医师（文档创作者）-->
            <author typeCode="AUT" contextControlCode="OP">
                <!--检验报告日期-->
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
                    <!--医师姓名-->
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <!--保管机构-->
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
            <!--审核医师签名-->
            <xsl:for-each select="AuditPerson/row">
                <legalAuthenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="RecordTime"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="审核医师签名"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </legalAuthenticator>
            </xsl:for-each>
            <!--检验技师签名-->
            <xsl:for-each select="InspectionTechnician/row">
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="RecordTime"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="检验技师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!--检验医师签名-->
            <xsl:for-each select="InspectionDoctor/row">
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="RecordTime"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="检验医师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!--检验申请机构及科室-->
            <participant typeCode="PRF">
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="AdmTime"/>
                    </xsl:attribute>
                </time>
                <associatedEntity classCode="ASSIGNED">
                    <scopingOrganization>
                        <xsl:for-each select="ApplyInfo/row">
                            <id root="2.16.156.10011.1.26" extension="">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="ApplyDeptID"/>
                                </xsl:attribute>
                            </id>
                            <name>
                                <xsl:value-of select="ApplyDeptName"/>
                            </name>
                            <asOrganizationPartOf>
                                <wholeOrganization>
                                    <id root="2.16.156.10011.1.5" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="ApplyOrgID"/>
                                        </xsl:attribute>
                                    </id>
                                    <name>
                                        <xsl:value-of select="ApplyOrgName"/>
                                    </name>
                                </wholeOrganization>
                            </asOrganizationPartOf>
                        </xsl:for-each>
                    </scopingOrganization>
                </associatedEntity>
            </participant>
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
            <!--病床号、病房、病区、科室和医院的关联-->
            <componentOf>
                <encompassingEncounter>
                    <effectiveTime/>
                    <location>
                        <healthCareFacility>
                            <serviceProviderOrganization>
                                <asOrganizationPartOf classCode="PART">
                                    <!--DE01.00.026.00病床号-->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedInfo/BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <!--DE01.00.019.00病房号-->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="BedInfo/RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <!--DE08.10.026.00科室名称-->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="BedInfo/DeptCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="BedInfo/DeptName"/>
                                                        </name>
                                                        <!--DE08.10.054.00病区名称-->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27" extension="">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="BedInfo/AreaCode"/>
                                                                    </xsl:attribute>
                                                                </id>
                                                                <name>
                                                                    <xsl:value-of select="BedInfo/AreaName"/>
                                                                </name>
                                                                <asOrganizationPartOf classCode="PART">
                                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                        <id root="2.16.156.10011.1.5" extension="">
                                                                            <xsl:attribute name="extension">
                                                                                <xsl:value-of select="BedInfo/OrganCode"/>
                                                                            </xsl:attribute>
                                                                        </id>
                                                                        <name>
                                                                            <xsl:value-of select="BedInfo/OrganName"/>
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
                    <!--诊断记录章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--条目：诊断-->
                            <xsl:for-each select="Diag/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <!--诊断日期-->
                                        <effectiveTime value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="DiagTime"/>
                                            </xsl:attribute>
                                        </effectiveTime>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表ICD-10">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="DiagCode"/>
                                            </xsl:attribute>
                                        </value>
                                        <performer>
                                            <assignedEntity>
                                                <id/>
                                                <representedOrganization>
                                                    <name>
                                                        <xsl:value-of select="DiagOrganName"/>
                                                    </name>
                                                </representedOrganization>
                                            </assignedEntity>
                                        </performer>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--实验室检查章节-->
                    <component>
                        <section>
                            <code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="STUDIES SUMMARY"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.027.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验方法名称"></code>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="InspectionWay"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验类别"></code>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="InspectionType"/>
                                    </value>
                                </observation>
                            </entry>
                            <xsl:for-each select="Inspection/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.30.019.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验项目代码"></code>
                                                <!-- 检验时间 -->
                                                <effectiveTime value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="InspectionTime"/>
                                                    </xsl:attribute>
                                                </effectiveTime>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="InspectionCode"/>
                                                </value>
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE04.50.134.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="标本类别"></code>
                                                        <!-- DE04.50.137.00	标本采样日期时间DE04.50.141.00	接收标本日期时间 -->
                                                        <effectiveTime>
                                                            <low value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="SamplingTime"/>
                                                                </xsl:attribute>
                                                            </low>
                                                            <high value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="ReceiveTime"/>
                                                                </xsl:attribute>
                                                            </high>
                                                        </effectiveTime>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="SpecimenType"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE04.50.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="标本状态"></code>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="SpecimenStatus"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.30.017.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验结果代码"></code>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.2.38" codeSystemName="检查/检验结果代码表" displayName="">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ResultCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="ResultName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>

                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.30.015.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验定量结果"></code>
                                                <value xsi:type="REAL" value="1.1234"></value>
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE04.30.016.00" displayName="检查定量结果计量单位" codeSystemName="卫生信息数据元目录" codeSystem="2.16.156.10011.2.2.1" />
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="ResultUnit"/>
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
                    <!--检验报告章节-->
                    <component>
                        <section>
                            <code displayName="检验报告"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验报告结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReportResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE08.10.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验报告科室"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReportDept"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE08.10.013.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验报告机构名称"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReportOrgan"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检验报告备注"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReportNote"/>
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