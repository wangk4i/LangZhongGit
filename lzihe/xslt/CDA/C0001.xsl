<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0001">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.21"/>
            <!--文档流水号-->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0001" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>病历概要</title>
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
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--健康档案标识号-->
                    <id root="2.16.156.10011.1.2" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HealthRecordCode"/>
                        </xsl:attribute>
                    </id>
                    <!--健康卡号-->
                    <id root="2.16.156.10011.1.19" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HealthCardCode"/>
                        </xsl:attribute>
                    </id>
                    <addr use="H">
                        <houseNumber>
                            <xsl:value-of select="PatientAddr/HouseNumber"/>
                        </houseNumber>
                        <streetName>
                            <xsl:value-of select="PatientAddr/StreetName"/>
                        </streetName>
                        <township>
                            <xsl:value-of select="PatientAddr/Township"/>
                        </township>
                        <county>
                            <xsl:value-of select="PatientAddr/County"/>
                        </county>
                        <city>
                            <xsl:value-of select="PatientAddr/City"/>
                        </city>
                        <state>
                            <xsl:value-of select="PatientAddr/State"/>
                        </state>
                        <postalCode>
                            <xsl:value-of select="PatientAddr/PostalCode"/>
                        </postalCode>
                    </addr>
                    <!--患者电话-->
                    <xsl:for-each select="TelPhone/TelPhoneItem">
                        <telecom value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </telecom>
                    </xsl:for-each>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份标识-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <!--患者姓名-->
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <!--性别代码-->
                        <administrativeGenderCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <birthTime value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/BirthTime"/>
                            </xsl:attribute>
                        </birthTime>
                        <!--婚姻状况代码-->
                        <maritalStatusCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.5" codeSystemName="婚姻状况代码表(GB/T 2261.2)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="MarriageCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="MarriageName"/>
                            </xsl:attribute>
                        </maritalStatusCode>
                        <!--民族代码-->
                        <ethnicGroupCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.3" codeSystemName="民族类别代码表(GB 3304)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="NationCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="NationName"/>
                            </xsl:attribute>
                        </ethnicGroupCode>
                        <!--工作单位-->
                        <employerOrganization>
                            <name>
                                <xsl:value-of select="WorkUnit/Name"/>
                            </name>
                            <telecom value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="WorkUnit/TelPhone"/>
                                </xsl:attribute>
                            </telecom>
                        </employerOrganization>
                        <!--职业状况-->
                        <occupation>
                            <occupationCode code="" codeSystem="2.16.156.10011.2.3.3.13" codeSystemName="从业状况(个人身体)代码表(GB/T 2261.4)" displayName="">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="OccupationTypeCode"/>
                                </xsl:attribute>
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="OccupationTypeName"/>
                                </xsl:attribute>
                            </occupationCode>
                        </occupation>
                    </patient>
                </patientRole>
            </recordTarget>
            <!--创建者-->
            <author typeCode="AUT" contextControlCode="OP">
                <!--建档日期-->
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
                    <!--建档者姓名-->
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                    <!--建档机构-->
                    <representedOrganization>
                        <id root="2.16.156.10011.1.5" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="ScopingOrgCode"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="ScopingOrgName"/>
                        </name>
                    </representedOrganization>
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
            <!--其他参与者（联系人）@typeCode: NOT(ugent notification contact)，固定值，表示不同的参与者-->
            <xsl:for-each select="Contacts/row">
                <participant typeCode="NOT">
                    <!--联系人@classCode：CON，固定值，表示角色是联系人-->
                    <associatedEntity classCode="ECON">
                        <!--联系人类别，表示与患者之间的关系-->
                        <code>
                            <xsl:value-of select="ContactPersonRelCode"/>
                        </code>
                        <!--联系人地址-->
                        <addr>
                            <houseNumber>
                                <xsl:value-of select="ContactsAddr/HouseNumber"/>
                            </houseNumber>
                            <streetName>
                                <xsl:value-of select="ContactsAddr/StreetName"/>
                            </streetName>
                            <township>
                                <xsl:value-of select="ContactsAddr/Township"/>
                            </township>
                            <county>
                                <xsl:value-of select="ContactsAddr/County"/>
                            </county>
                            <city>
                                <xsl:value-of select="ContactsAddr/City"/>
                            </city>
                            <state>
                                <xsl:value-of select="ContactsAddr/State"/>
                            </state>
                            <postalCode>
                                <xsl:value-of select="ContactsAddr/PostalCode"/>
                            </postalCode>
                        </addr>
                        <!--电话号码-->
                        <telecom use="H" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="ContactsTelPhone"/>
                            </xsl:attribute>
                        </telecom>
                        <!--联系人-->
                        <associatedPerson classCode="PSN" determinerCode="INSTANCE">
                            <!--姓名-->
                            <name>
                                <xsl:value-of select="ContactsName"/>
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
            <component>
                <structuredBody>
                    <!--实验室检验章节-->
                    <component>
                        <section>
                            <code code="30954-2" displayName="STUDIES SUMMARY" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--血型-->
                            <entry typeCode="COMP">
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <statusCode/>
                                    <!--ABO血型-->
                                    <component typeCode="COMP" contextConductionInd="true">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表" displayName="">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PatientABOCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="PatientABODescribe"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <!--Rh血型-->
                                    <component typeCode="COMP" contextConductionInd="true">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表" displayName="">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PatientRHCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="PatientRHDescribe"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                        </section>
                    </component>
                    <!--既往史章节-->
                    <component>
                        <section>
                            <code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--疾病史（含外伤）-->
                            <xsl:for-each select="HoD/HoDItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.026.00" displayName="疾病史（含外伤）" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--传染病史-->
                            <xsl:for-each select="HoID/HoIDItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.008.00" displayName="传染病史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="HoO/HoOItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.061.00" displayName="手术史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--婚育史条目-->
                            <xsl:for-each select="HoM/HoMItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.098.00" displayName="婚育史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--输血章节-->
                    <component>
                        <section>
                            <code code="56836-0" displayName="History of blood transfusion" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.100.00" displayName="输血史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HoT"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--过敏史章节-->
                    <component>
                        <section>
                            <code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--过敏史条目-->
                            <xsl:for-each select="HoA/HoAItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--预防接种史章节-->
                    <component>
                        <section>
                            <code code="11369-6" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORYOF IMMUNIZATIONS" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="HoI/HoIItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.101.00" displayName="预防接种史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--个人史章节-->
                    <component>
                        <section>
                            <code code="29762-2" displayName="Social history" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--个人史条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.097.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="个人史"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HoP"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--月经史章节-->
                    <component>
                        <section>
                            <code code="49033-4" displayName="Menstrual History" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--月经史条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.102.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="月经史"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HoPenses"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--家族史章节-->
                    <component>
                        <section>
                            <code code="10157-6" displayName="HISTORY OF FAMILY MEMBER DISEASES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="HoF/HoFItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.103.00" displayName="家族史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--卫生事件章节-->
                    <component>
                        <section>
                            <code displayName="卫生事件"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE08.10.026.00" displayName="医疗机构科室名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HospitalDeptName"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.01.060.00" displayName="患者类型代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="1" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PatientTypeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PatientTypeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE01.00.010.00" displayName="门（急）诊号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="OutPatientID"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE01.00.014.00" displayName="住院号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HospitalizationID"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.092.00" displayName="入院日期" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="EncounterTime"/>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.017.00" displayName="出院日期" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="DischargeTime"/>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.018.00" displayName="发病日期时间" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="IllnessTime"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.053.00" displayName="就诊原因" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--就诊日期时间 DE06.00.062.00-->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="AdmTime"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="AdmReason"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--条目诊断-->
                            <xsl:for-each select="WesternDiag/C0001WesternDiag">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" displayName="西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                            <qualifier>
                                                <name displayName="西医诊断编码"/>
                                            </qualifier>
                                        </code>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.1" codeSystemName="诊断代码表（ICD-10）" displayName="">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="WesternDiagCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="WesternDiagName"/>
                                            </xsl:attribute>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.113.00" displayName="病情转归代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="病情转归代码表" displayName="">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="WesternTransderredCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="WesternTransderredName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--条目诊断-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" displayName="其他西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                        <qualifier>
                                            <name displayName="其他西医诊断编码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.1" codeSystemName="诊断代码表（ICD-10）">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="OtherWesternDiagCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <xsl:for-each select="ChineseDiag/C0001ChineseDiag">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.10.130.00" displayName="中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                            <qualifier>
                                                <name displayName="中医病名代码"/>
                                            </qualifier>
                                        </code>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="ChineseDiagCode"/>
                                            </xsl:attribute>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.130.00" displayName="中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                                    <qualifier>
                                                        <name displayName="中医证候代码"></name>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ChineseSyndromeCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.113.00" displayName="病情转归代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="病情转归代码表" displayName="">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ChineseTransderredCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="ChineseTransderredName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="OperationCode/OperationCodeItem">
                                <entry>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <!--手术及操作编码 DE06.00.093.00-->
                                        <code code="1" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM）">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                        </code>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="KeyDrug/C0001KeyDrug">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE08.50.022.00" displayName="关键药物名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="KeyDrugName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.136.00" displayName="关键药物用法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="KeyDrugUseFunction"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.129.00" displayName="药物不良反应情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DrugAdverseReaction"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.164.00" displayName="中药使用类别代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.157" codeSystemName="中药使用类别代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ChineseDurgTypeCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.251.00" displayName="其他医学处置" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="OtherMedicalDisposition"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.021.00" displayName="根本死因代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.2" codeSystemName="死因代码表（ICD-10）">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DeathReasonCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.01.039.00" displayName="责任医师姓名" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChargeDoctorName"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--费用条目-->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE02.01.044.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗保险类别代码"/>
                                            <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.248" codeSystemName="医疗保险类别代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="BeneficiaryCode"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE07.00.007.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗付费方式代码"/>
                                            <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.269" displayName="" codeSystemName="医疗付费方式代码表">
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="PayWayName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE07.00.004.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="门诊费用金额"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="OutPatientFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE07.00.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="住院费用金额"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="HospitalizationFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE07.00.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="个人承担费用金额"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PersonalFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>