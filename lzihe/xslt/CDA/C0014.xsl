<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0014">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.34"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0014" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <!--title-->
            <title>待产记录</title>
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
                        <age value="" unit="岁">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
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
            <xsl:for-each select="PrenatalExaminerInfo/row">
                <authenticator>
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
                        <code displayName="产程检查者"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <xsl:for-each select="RegistrarInfo/row">
                <authenticator>
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
                        <code displayName="记录人"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <xsl:for-each select="ContactPersonInfo/row">
                <participant typeCode="NOT">
                    <!--联系人@classCode：CON，固定值，表示角色是联系人 -->
                    <associatedEntity classCode="ECON">
                        <!--联系人电话-->
                        <telecom value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="ContactPersonTel"/>
                            </xsl:attribute>
                        </telecom>
                        <!--联系人-->
                        <associatedPerson>
                            <!--姓名-->
                            <name>
                                <xsl:value-of select="ContactPersonName"/>
                            </name>
                        </associatedPerson>
                    </associatedEntity>
                </participant>
            </xsl:for-each>
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
                                    <!--HDSD00.09.003 DE01.00.026.00 病床号 -->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name/>
                                        <!--HDSD00.09.004 DE01.00.019.00 病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name/>
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
                                                        <!--HDSD00.09.005 DE08.10.054.00 病区名称-->
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
            <component>
                <structuredBody>
                    <!-- 主要健康问题章节 -->
                    <component>
                        <section>
                            <code code="11450-4" displayName="Problem list" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.197.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="待产日期时间 "/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PregnantTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.108.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="孕次 "/>
                                    <value xsi:type="INT" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="GravidityNum"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.002.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="产次 "/>
                                    <value xsi:type="INT" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="ParityNum"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.051.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="末次月经日期 "/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="LastMensesTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.261.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="受孕形式代码 "/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.44" codeSystemName="受孕形式代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PregnantFormCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PregnantFormName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.098.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="预产期 "/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="DeliveryExpectTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.013.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="产前检查标志 "/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PrenatalExamSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.161.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="产前检查异常情况 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PrenatalExamProblemDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.070.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="此次妊娠特殊情况 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PregnancySpecialEvent"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 生命体征章节-->
                    <component>
                        <section>
                            <code code="8716-3" displayName="VITAL SIGNS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="孕前体重（kg） "/>
                                    <value xsi:type="PQ" value="" unit="kg">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PrePregnancyWeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.167.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="身高（cm） "/>
                                    <value xsi:type="PQ" value="" unit="cm">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientHeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="产前体重（kg） "/>
                                    <value xsi:type="PQ" value="" unit="kg">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PrenatalWeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.10.174.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="收缩压"/>
                                            <value xsi:type="PQ" value="" unit="mmHg">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="SystolicPressure"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="舒张压"/>
                                            <value xsi:type="PQ" value="" unit="mmHg">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="DiastolicPressure"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温（℃） "/>
                                    <value xsi:type="PQ" value="" unit="℃">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="Temperature"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脉率（次/min） "/>
                                    <value xsi:type="PQ" value="" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PulseRate"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.081.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率（次/min） "/>
                                    <value xsi:type="PQ" value="" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="BreathRate"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 既往史 -->
                    <component>
                        <section>
                            <code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="PastIllnessDesc/PastIllnessDescItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.099.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="既往史 "/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="PastOperationDesc/PastOperationDescItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.061.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术史 "/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="PastPregnancyDesc/PastPregnancyDescItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.098.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="既往孕产史 "/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!-- 产前检查章节 -->
                    <component>
                        <section>
                            <code code="57073-9" displayName="Prenatal events" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.067.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="宫底高度（cm） "/>
                                    <value xsi:type="PQ" value="" unit="cm">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="FundusHeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.052.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="腹围（cm） "/>
                                    <value xsi:type="PQ" value="" unit="cm">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="ACLength"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.044.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="胎方位代码 "/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.106" codeSystemName="胎方位代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="FetalPositionCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="FetalPositionName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.183.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="胎心率（次/min） "/>
                                    <value xsi:type="PQ" value="" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="FetalHeartRate"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="头位难产情况的评估 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DifficultLaborDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.247.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出口横径（cm） "/>
                                    <value xsi:type="PQ" value="" unit="cm">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="OutletDiameter"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.175.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="骶耻外径（cm） "/>
                                    <value xsi:type="PQ" value="" unit="cm">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="ExternalConjugateDiameter"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.239.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="坐骨结节间径（cm） "/>
                                    <value xsi:type="PQ" value="" unit="cm">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="IschialTuberclesDiameter"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.245.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="宫缩情况 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="UterineContraction"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.248.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="宫颈厚度 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="CervicalThickness"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.265.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="宫口情况 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="UterineOrificeCondition"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.155.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="胎膜情况代码 "/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.10" codeSystemName="胎膜情况代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="FetalMembranesCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="FetalMembranesName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.256.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="破膜方式代码 "/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.46" codeSystemName="破膜方式代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="MembraneBreakCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="MembraneBreakName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.262.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="先露位置 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ExposurePosition"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.062.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="羊水情况 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="AmnioticFluidCondition"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.257.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="膀胱充盈标志 "/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="BladderFillingSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.123.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="肠胀气标志 "/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="FlatulenceSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.139.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查方式代码 "/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.47" codeSystemName="检查方式代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="ExamMethodCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="ExamMethodName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 处置计划章节-->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.014.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处置计划 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPlanDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.011.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="计划选取的分娩方式 "/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.10" codeSystemName="分娩方式代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PlannedDeliveryMethodCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PlannedDeliveryMethodName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE09.00.053.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="产程记录日期时间 "/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PrenatalRecordTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.190.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="产程经过 "/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PrenatalProcessDesc"/>
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