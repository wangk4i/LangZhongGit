<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0301Rt">
        <PRPM_IN401030UV01 xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPM_IN401030UV01.xsd">
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
            </id>
            <creationTime value="">
                <xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
            </creationTime>
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPM_IN401030UV01"/>
            <processingCode code="P"/>
            <processingModeCode/>
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="111"/>
                    </id>
                </device>
            </receiver>
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="111"/>
                    </id>
                </device>
            </sender>
            <controlActProcess classCode="CACT" moodCode="EVN">
                <subject typeCode="SUBJ">
                    <registrationRequest classCode="REG" moodCode="RQO">
                        <statusCode code="active"/>
                        <subject1 typeCode="SBJ">
                            <assignedEntity classCode="ASSIGNED ">
                                <!--医疗卫生机构（科室）标识-科室-->
                                <id>
                                    <item root="2.16.156.10011.1.26" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="DeptCode"/></xsl:attribute>
                                    </item>
                                </id>
                                <!--医疗卫生机构（科室）类别-科室-->
                                <code code="" codeSystem="2.16.156.10011.2.3.2.62" codeSystemName="医疗卫生机构业务科室分类与代码表">
                                    <xsl:attribute name="code"><xsl:value-of select="DeptTypeCode"/></xsl:attribute>
                                    <displayName value="">
                                        <xsl:attribute name="value"><xsl:value-of select="DeptTypeName"/></xsl:attribute>
                                    </displayName>
                                </code>
                                <!--医疗卫生机构（科室）角色名称-->
                                <name xsi:type="LIST_EN">
                                    <item>
                                        <part value="">
                                            <xsl:attribute name="value"><xsl:value-of select="DeptPartName"/></xsl:attribute>
                                        </part>
                                    </item>
                                </name>
                                <!--工作地址-->
                                <addr xsi:type="DSET_AD">
                                    <item>
                                    <part value="">
                                        <xsl:attribute name="value"><xsl:value-of select="WorkAddress"/></xsl:attribute>
                                    </part>
                                    </item>
                                </addr>
                                <!--工作联系方式：电话、邮箱地址等-->
                                <telecom xsi:type="DSET_TEL">
                                    <item value="">
                                        <xsl:attribute name="value"><xsl:value-of select="WorkContactTel"/></xsl:attribute>
                                    </item>
                                </telecom>
                                <!--角色状态RoleStatus-->
                                <statusCode code="active"/>
                                <!--角色有效期间-->
                                <effectiveTime>
                                    <low value="">
                                        <xsl:attribute name="value"><xsl:value-of select="EffectStartTime"/></xsl:attribute>
                                    </low>
                                    <high value="">
                                        <xsl:attribute name="value"><xsl:value-of select="EffectEndTime"/></xsl:attribute>
                                    </high>
                                </effectiveTime>
                                <assignedPrincipalOrganization classCode="ORG" determinerCode="INSTANCE">
                                    <!--医疗卫生机构（科室）实体名称-->
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="DeptName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                    <asAffiliate classCode="AFFL">
                                        <code/>
                                        <effectiveTime/>
                                        <!--上级机构-->
                                        <scoper2 classCode="ORG" determinerCode="INSTANCE">
                                            <!--上级医疗卫生机构（科室）号标识-->
                                            <id>
                                                <item root="2.16.156.10011.1.26" extension="">
                                                    <xsl:attribute name="extension"><xsl:value-of select="ParentDeptCode"/></xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="LIST_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="ParentDeptName"/></xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                        </scoper2>
                                    </asAffiliate>
                                </assignedPrincipalOrganization>
                            </assignedEntity>
                        </subject1>
                        <author typeCode="AUT">
                            <assignedEntity classCode="ASSIGNED">
                                <!--医务人员ID-->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="AssignedPersonCode"/></xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="AssignedPersonName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                                <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                    <!--科室号标识-->
                                    <id>
                                        <item root="2.16.156.10011.1.26" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="AssignedDeptCode"/></xsl:attribute>
                                        </item>
                                    </id>
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="AssignedDeptName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                    <contactParty classCode="CON">
                                        <contactPerson classCode="PSN" determinerCode="INSTANCE">
                                            <name xsi:type="LIST_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="AssignedContactPerson"/></xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                        </contactPerson>
                                    </contactParty>
                                </representedOrganization>
                            </assignedEntity>
                        </author>
                    </registrationRequest>
                </subject>
            </controlActProcess>
        </PRPM_IN401030UV01>
    </xsl:template>
</xsl:stylesheet>