<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0053">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <!--*********************************************** Head ******************************************************-->
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_ _MT000040" />
            <templateId root="2.16.156.10011.2.1.1.73"/>
            <!--文档流水号-->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0053" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档编码体系"/>
            <title>出院小结</title>
            <!--档机器生成时间-->
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
            <!--文档记录对象(患者) [1..*] contextControlCode="OP"表示本信息可以被重载-->
            <recordTarget typeCode=" RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--HDSD00.16.021 DE01.00.021.00 健康卡号-->
                    <id root="2.16.156.10011.1.12" extension="XX2011021136"/>
                    <addr use="H">
                        <!--地址类别代码 无-->
                        <houseNumber>
                            <xsl:value-of select="PatAddrInfo/HouseNumber"/>
                        </houseNumber>
                        <streetName>
                            <xsl:value-of select="PatAddrInfo/StreetName"/>
                        </streetName>
                        <township>
                            <xsl:value-of select="PatAddrInfo/Township"/>
                        </township>
                        <county>
                            <xsl:value-of select="PatAddrInfo/County"/>
                        </county>
                        <city>
                            <xsl:value-of select="PatAddrInfo/City"/>
                        </city>
                        <state>
                            <xsl:value-of select="PatAddrInfo/State"/>
                        </state>
                        <postalCode>
                            <xsl:value-of select="PatAddrInfo/PostalCode"/>
                        </postalCode>
                    </addr>
                    <!--HDSD00.16.018 DE02.01.010.00 患者电话号码-->
                    <telecom value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="TelPhone"/>
                        </xsl:attribute>
                    </telecom>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号标识-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <!--HDSD00.16.019 DE02.01.039.00 患者姓名-->
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <!--HDSD00.16.041 DE02.01.040.00 性别代码-->
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <birthTime value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/BirthTime"/>
                            </xsl:attribute>
                        </birthTime>
                        <!--HDSD00.16.020 DE02.01.018.00 婚姻状况代码-->
                        <maritalStatusCode code="20" displayName="已婚" codeSystem="2.16.156.10011.2.3.3.5" codeSystemName="婚姻状况代码表(GB/T 2261.2)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="MarriageCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="MarriageValue"/>
                            </xsl:attribute>
                        </maritalStatusCode>
                        <!--HDSD00.16.026 DE02.01.026.00 年龄(岁)-->
                        <!--HDSD00.16.027 DE02.01.032.00 年龄(月)-->
                        <age value="30" unit="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                        <!--HDSD00.16.046 DE02.0 1.052.00 职业类别代码-->
                        <occupation>
                            <occupationCode code="" codeSystem="2.16.156.10011.2.3.3.13" codeSystemVersion="从业状况(个人身体)代码表" displayName="">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="EmployerTypeCode"/>
                                </xsl:attribute>
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="EmployerTypeName"/>
                                </xsl:attribute>
                            </occupationCode>
                        </occupation>
                    </patient>
                    <!--提供患者服务机构-->
                    <providerOrganization classCode="ORG" determinerCode=" INSTANCE">
                        <!--HDSD00.16.043 DE08.1 0.052.00 医疗机构组织机构代码-->
                        <id root=" 2.16.156.10011.1.5" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="ServiceOrganCode"/>
                            </xsl:attribute>
                        </id>
                        <!--住院机构名称-->
                        <name>
                            <xsl:value-of select="ServiceOrganName"/>
                        </name>
                    </providerOrganization>
                </patientRole>
            </recordTarget>
            <!--文档创作者-->
            <author typeCode=" AUT" contextControlCode="OP">
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
            <!--法定审核者表达对文档直接起到法律效应的法定审核者信息-->
            <legalAuthenticator typeCode="LA">
                <!-- HDSD00.16.028  DE09.00.053.00  签名日期时间-->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="HospitalizationDoctor/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <!--HDSD00.16.053  DE02.01.039.00  住院医师签名-->
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationDoctor/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="住院医师"></code>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="HospitalizationDoctor/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
            <!--文档审核者该部分信息表达文档经过了一定的审核,但还没达到一定的法律效应-->
            <xsl:for-each select="SuperiorDoctors/row">
                <authenticator typeCode="AUTHEN">
                    <!--HDSD00.16.028  DE09.00.053.00  签名日期时间-->
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity classCode="ASSIGNED">
                        <!--HDSD00.16.035  DE02.01.039.00  上级医师签名-->
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="上级医师"></code>
                        <assignedPerson classCode="PSN">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <participant typeCode="NOT">
                <!--联系人@classCode:CON,固定值,表示角色是联系人-->
                <associatedEntity classCode="ECON">
                    <!--HDSD00.16.023  DE02.01.010.00  联系人电话号码-->
                    <telecom value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="ContactPersonTel"/>
                        </xsl:attribute>
                    </telecom>
                    <!--联系人-->
                    <associatedPerson>
                        <!--HDSD00.16.024  DE02.01.039.00  联系人姓名-->
                        <name>
                            <xsl:value-of select="ContactPersonName"/>
                        </name>
                    </associatedPerson>
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
            <!--文档中医疗卫生事件的就诊场景,即人院场景记录-->
            <componentOf typeCode="COMP">
                <!--就诊-->
                <encompassingEncounter classCode="ENC" moodCode="EVN">
                    <!--就诊时间-->
                    <effectiveTime>
                        <!--HDSD00.16.031  DE06.00.092.00  人院日期时间-->
                        <low value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="EncounterTime"/>
                            </xsl:attribute>
                        </low>
                        <!--HDSD00.16.005  DE06.00.017.00  出院日期时间-->
                        <high value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="EncounterTime"/>
                            </xsl:attribute>
                        </high>
                    </effectiveTime>
                    <location>
                        <healthCareFacility>
                            <serviceProviderOrganization>
                                <asOrganizationPartOf classCode="PART">
                                    <!--HDSD00.16.001  DE01.00.026.00  病床号-->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name>
                                            <xsl:value-of select="BedName"/>
                                        </name>
                                        <!--HDSD00.16.002  DE01.00.019.00  病房号-->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode ="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name>
                                                    <xsl:value-of select="RoomName"/>
                                                </name>
                                                <!--HDSD00.16.022  DE08.10.026.00  科室名称-->
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
                                                        <!--HDSD0O.16.003  DE08.10.054.00  病区名称-->
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

            <!--********************************************* 文档体 Body *****************************************-->
            <component>
                <structuredBody>
                    <!--主要健康问题章节-->
                    <component>
                        <section>
                            <code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" />
                            <text/>
                            <!--HDSD00.16.030  DE05.10.148.00  人院情况条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.148.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="人院情况"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="EncounterDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--人院诊断章节-->
                    <component>
                        <section>
                            <code code="46241-6" displayName="HOSPITAL ADMISSION DX" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" />
                            <text/>
                            <!--HDSD00.16.032  DE05.01.024.00  人院诊断-西医诊断编码  条目-->
                            <xsl:for-each select="EncounterWMDiagInfo/row">
                                <entry typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-西医诊断编码"/>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.5" codeSystemName="疾病代码表(ICD-10)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="WMDiagCode"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--HDSD00.16.033  DE05.10.130.00  人院诊断-中医病名代码  条目-->
                            <xsl:for-each select="EncounterTCMDiagInfo/row">
                                <entry typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="人院诊断-中医病名代码"/>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病名分类(GB/T 15657)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="TCMDiagCode"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--HDSD00.16.034  DE05.10.130.00  人院诊断-中医证候代码  条目-->
                            <xsl:for-each select="EncounterTCMSyndromeInfo/row">
                                <entry typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-中医证候代码"/>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病名分类(GB/T 15657)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="TCMSyndromeCode"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--出院诊断章节-->
                    <component>
                        <section>
                            <code code="11535-2" displayName="Discharge Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" />
                            <text/>
                            <!--HDSD0O.16.008  DE05.01.024.00  出院诊断-西医诊断编码  条目-->
                            <xsl:for-each select="DischargeWMDiagInfo/row">
                                <entry typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-西医诊断编码"/>
                                        <value xsi:type="CD" code="01" codeSystem="2.16.156.10011.2.3.3.11.5" codeSystemName="疾病代码表(ICD-10)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="WMDiagCode"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--HDSD00.16.009  DE05.10.130.00  出院诊断-中医病名代码  条目-->
                            <xsl:for-each select="DischargeTCMDiagInfo/row">
                                <entry typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-中医病名代码"/>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病名分类(GB/T 15657)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="TCMDiagCode"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--HDSD0O.16.010  DE05.10.130.00  出院诊断-中医诊断代码  条目-->
                            <xsl:for-each select="DischargeTCMSyndromeInfo/row">
                                <entry typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-中医证候代码"/>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病名分类(GB/T 15657)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="TCMSyndromeCode"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--HDSD00.16.051  DE02.10.028.00  中医“四诊"观察结果  条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中医“四诊”观察结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChineseDiagResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--HDSD00.16.006 DE04.01.117.00  出院时症状与体征  条目-->
                            <entry typeCode="COMP">
                                <observation classCode=" OBS" moodCode="EVN">
                                    <code code="DE04.01.117.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院时症状与体征"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DischargeSymptom"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--HDSD00.16.004  DE06.00.193.00  出院情况  条目-->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.193.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院情况"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DischargeDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--手术操作章节-->
                    <component>
                        <section>
                            <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" />
                            <text/>
                            <!--手术记录条目-->
                            <entry>
                                <!--手术记录-->
                                <procedure classCode="PROC" moodCode="EVN">
                                    <!--HDSD00.16.038  DE06.00.093.00  手术及操作编码-->
                                    <code code="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="OperationCode"/>
                                        </xsl:attribute>
                                    </code>
                                    <statusCode/>
                                    <!--手术及操作编码、操作日期/时间-->
                                    <!--HDSD00.16.039  DE06.00.221.00  手术及操作开始日期时间 -->
                                    <effectiveTime value="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="OperationTime"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <!--HDSD00.16.040  DE06.00.257.00手 术切口类别代码 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.257.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术切口类别代码"/>
                                            <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.251" codeSystemName="手术切口类别代码">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="SurgeryIncisionTypeCode"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--HDSD00.16.029  DE05.10.147.00  切口愈合等级代码-->
                                    <entryRelationship typeCode ="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.147.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="切口愈合等级代码"/>
                                            <value xsi:type="CD" code="I/甲" displayName="切口等级I/愈合类型甲" codeSystem=" 2.16.156.10011.2.3.1.252" codeSystemName="切口愈合等级代码">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="SurgeryIncisionHealCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="SurgeryIncisionHealName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--HDSD00.16.025  DE06.00.073.00  麻醉方法代码-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.2" codeSystemName="卫生信息数据元目录" displayName="麻醉方法代码"/>
                                            <value code="" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码" xsi:type="CD">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="AnesthesiaMethodCode"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--HDSD00.16.037  DE05.10.063.00 手术过程-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.063.00" codeSystem="2.16.156.10011.2.2.2" codeSystemName="卫生信息数据元目录" displayName="手术过程"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="SurgeryProcess"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </procedure>
                            </entry>
                        </section>
                    </component>
                    <!--治疗计划章节-->
                    <component>
                        <section>
                            <code code="18776-5" codeSystem="2.16.840.1.113883.6.1" displayName="TREATMENT PLAN" codeSystemName="LOINC"/>
                            <text/>
                            <!--HDSD00.16.048  DE06.00.300.00  治则治法  条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.300.00" codeSystem="2.16.156.10011.2.3.3.15" codeSystemName="卫生信息数据元目录" displayName="治则治法"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPrinciple"/>
                                    </value>
                                    <!--GB/T 16751.3-1997-->
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--住院过程章节-->
                    <component>
                        <section>
                            <code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course" />
                            <text/>
                            <!--HDSD00.16.045  DE06.00.296.00  诊疗过程描述  条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="诊疗过程描述"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DiagProcessDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--HDSD00.16.047  DE05.10.113.00  治疗结果代码  条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.113.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="治疗结果代码"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="治疗结果代码">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="TreatmentResultCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--HDSD00.16.036  DE06.00.310.00  实际住院天数  条目-->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode=" EVN">
                                    <code code="DE06.00.310.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="实际住院天数"/>
                                    <value xsi:type="PQ" value="" unit="天">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="HospitalizationDays"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 医嘱章节-->
                    <component>
                        <section>
                            <code code="46209-3" codeSystem="2.16.840.1.113883.6.1" displayName="Provider Orders" codeSystemName="LOINC"></code>
                            <text/>
                            <!--HDSD00.16.049  DE08.50.047.00  中药煎煮方法  条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE08.50.047.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中药煎煮方法"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TCMCookWay"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--HDSD00.16.050  DE06.00.136.00  中药用药方法  条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中药用药方法"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TCMUesWay"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--HDSD0O.16.007  DE06.00.287.00  出院医嘱  条目-->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.287.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院医嘱"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DischargeOrder"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--实验室检查章节-->
                    <component>
                        <section>
                            <code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="STUDIES SUMMARY"/>
                            <text/>
                            <!--阳性辅助检查结果条目-->
                            <xsl:for-each select="AidedExamResult/AidedExamResultItem">
                                <entry typeCode="COMP" contextConductionInd="true">
                                    <!--阳性辅助检查结果-->
                                    <organizer classCode="BATTERY" moodCode="EVN">
                                        <statusCode/>
                                        <component typeCode="COMP" contextConductionlnd="true">
                                            <!--HDSD00.16.042	DE04.50.128.00	阳性辅助检查结果-->
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.50.128.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="."/>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>