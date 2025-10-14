<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:UML="omg.org/UML1.3"
    xmlns:my="http://example.com/functions"    
    exclude-result-prefixes="xs" version="2.0">
           
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:strip-space elements="*"/>
    
    <!-- identity copy, kopieert default alles naar de output (tenzij er een aparte template voor is)-->
    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="* | comment() | text()"/>
        </xsl:copy>
    </xsl:template>
    
    <!--identity copy voor attributen-->
    <xsl:template match="@*">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:variable name="prefixURL" select="'https://docs.geostandaarden.nl/mobiliteit/'"/>
    <xsl:template match="XMI.header">
       <!-- {"@context":"http://www.w3.org/2004/02/skos/core#",
        "@id":"https://begrippen.gewoongoedegeodata.nl/energie/id/begrip/windturbine",
        "skos:prefLabel":"Windturbine",
        "definition":"Een windturbine is een installatie die windenergie omzet in elektriciteit.",
        "inScheme":[{"@id":"https://begrippen.gewoongoedegeodata.nl/begrippenkaders/energie","skos:prefLabel":"Energie"}],
        "broader":[],"narrower":[],"related":[{"@id":"https://begrippen.gewoongoedegeodata.nl/energie/id/begrip/windenergie","skos:prefLabel":"Windenergie"},{"@id":"https://definities.geostandaarden.nl/imgeo/nl/page/windturbine","skos:prefLabel":"Windturbine"}]}-->
        <!--xsl:element name="header"/-->
        <xsl:text>{</xsl:text>
        <xsl:text>&#10;</xsl:text>        
        <xsl:text>"@context":{"skos": "http://www.w3.org/2004/02/skos/core#"},</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>"graph":[</xsl:text>
    </xsl:template>  
    
    <!--              
         ___ _      _   ___ ___ ___ ___                                         
        / __| |    /_\ / __/ __| __/ __|                                        
       | (__| |__ / _ \\__ \__ \ _|\__ \                                        
        \___|____/_/ \_\___/___/___|___/   ___ ___  _  _  ___ ___ ___ _____ ___ 
                               /_\ / __|  / __/ _ \| \| |/ __| __| _ \_   _/ __|
                              / _ \\__ \ | (_| (_) | .` | (__| _||  _/ | | \__ \
                             /_/ \_\___/  \___\___/|_|\_|\___|___|_|   |_| |___/
                                                                               
    -->
    
    <xsl:template match="UML:Class[UML:ModelElement.stereotype/UML:Stereotype[@name='Objecttype']] 
        | UML:Class[UML:ModelElement.stereotype/UML:Stereotype[@name='Gegevensgroeptype']]
        | UML:Class[UML:ModelElement.stereotype/UML:Stereotype[@name='Enumeratie']]
        | UML:Class[UML:ModelElement.stereotype/UML:Stereotype[@name='Keuze']]">
        <xsl:value-of select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='in kader']/@value"/>
        <xsl:variable name="id" select="@xmi.id"/>
        <xsl:variable name="eaClassID" select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_localid']/@value"/>
        <xsl:text>&#10;{</xsl:text>
        <!-- Id -->
        <!--xsl:text>"@id":"</xsl:text>               
        <xsl:value-of select="@xmi.id"/>
        <xsl:text>",&#10;</xsl:text-->
        
        <!-- URI = ID -->
        <xsl:text>"@id":"</xsl:text>
        <xsl:value-of select="$prefixURL"/><xsl:text>id/begrip/</xsl:text><xsl:value-of select="translate(@name,' ', '-')"/>
        <xsl:text>",&#10;</xsl:text>
        
        <!-- PREFLABEL: Name -->
        <xsl:text>"skos:prefLabel":"</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>",&#10;</xsl:text>
        
        <!-- ALTLABEL: Alias --> <!-- VERVANGEN DOOR NLSBB TAGGEDVALUES-->
        <xsl:if test="count(tokenize(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='alias']/@value, ';')) > 1">
             <xsl:text>"skos:altLabel":[</xsl:text>
             <xsl:variable name="alias" select="tokenize(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='alias']/@value, ';')"/>
             <xsl:for-each select="$alias">
                  <xsl:text>{"lang":"en", "value", "</xsl:text><xsl:value-of select="."/><xsl:text>"}</xsl:text>
                 <xsl:if test="position() != last()">,</xsl:if>    
             </xsl:for-each>       
             <xsl:text>],&#10;</xsl:text>
        </xsl:if>        
        
        <!-- DEFINITION: Documentation -->
        <xsl:text>"skos:definition":</xsl:text>
        <xsl:text>"</xsl:text>
        <xsl:value-of select="replace(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='documentation']/@value, '&#xa;', '')"/>
        <xsl:text>",</xsl:text>
        <xsl:text>&#10;</xsl:text>
        
        <!-- INSCHEME --> 
        
        <!-- BROADER: Supertype -->
        <xsl:if test="//UML:Generalization[@subtype = $id]">
            <xsl:text>"skos:broader":[</xsl:text>
            <xsl:for-each select="//UML:Generalization[@subtype = $id]">
                <xsl:variable name="superClass" select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetName']/@value"/>
                
                <xsl:text>{"@id":"</xsl:text>                
                <xsl:value-of select="$prefixURL"/><xsl:text>id/begrip/</xsl:text>
                <xsl:value-of select="translate($superClass, ' ', '-')"/>
                <xsl:text>","skos:prefLabel":"</xsl:text>
                <xsl:value-of select="$superClass"/>
                <xsl:text>"}</xsl:text>
                
                <xsl:if test="position() != last()">,</xsl:if>    
                <xsl:text>&#10;</xsl:text>   
            </xsl:for-each>
            <xsl:text>],</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>       
        
        <!-- NARROWER: Subype -->
        <xsl:if test="//UML:Generalization[@supertype = $id]">
            <xsl:text>"skos:narrower":[</xsl:text>
            <xsl:for-each select="//UML:Generalization[@supertype = $id]">
                <xsl:variable name="subClass" select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_sourceName']/@value"/>
                
                <xsl:text>{"@id":"</xsl:text>                
                <xsl:value-of select="$prefixURL"/><xsl:text>id/begrip/</xsl:text>
                <xsl:value-of select="translate($subClass, ' ', '-')"/>
                <xsl:text>","skos:prefLabel":"</xsl:text>
                <xsl:value-of select="$subClass"/>
                <xsl:text>"}</xsl:text>
                
                <xsl:if test="position() != last()">,</xsl:if>    
                <xsl:text>&#10;</xsl:text>   
            </xsl:for-each>
            <xsl:text>],</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>       
        
        <!-- SKOS:NARROWERPARTITIVE: Attributes en AssocationEnds of type source --> <!-- zoek elke assocatie waarbij associatieEnd van type source -->
        <xsl:variable name="attributes" 
                      select="UML:Classifier.feature/UML:Attribute" />
        <xsl:variable name="associationend_sources" 
                      select="//UML:Association/UML:Association.connection/UML:AssociationEnd[@type = $id 
                                                                                             and 
                                                                                             UML:ModelElement.taggedValue/UML:TaggedValue/@tag='ea_end' 
                                                                                             and 
                                                                                             UML:ModelElement.taggedValue/UML:TaggedValue/@value='source']"/>
        
        <xsl:if test="(count($attributes)+count($associationend_sources)) >1"> 
            <xsl:text>"isothes:narrowerPartitive":[</xsl:text>
            <xsl:text>&#10;</xsl:text>    
            
            <!-- LOOP THROUGH ATTRIBUTES-->            
            <xsl:for-each select="$attributes">            
                 <xsl:text>&#9;{"@id":"</xsl:text> 
                     <!-- URL -->
                     <xsl:value-of select="$prefixURL"/>
                     <xsl:text>id/begrip/</xsl:text>
                     <xsl:value-of select="translate(@name,' ', '-')"/>
                     <!-- geometrie-attribuut -->
                     <xsl:if test="contains(@name, 'geometrie')">
                         <xsl:text>-</xsl:text>                         
                         <xsl:value-of select="lower-case(../../@name)"/>
                     </xsl:if>
                     <!-- prefLabel -->
                      <xsl:text>",</xsl:text>
                      <xsl:text>&#10;</xsl:text>
                      <xsl:text>&#9;"skos:prefLabel":"</xsl:text>
                      <xsl:value-of select="@name"/>
                      <xsl:text>"}</xsl:text>
                 <xsl:if test="position() != last()">,</xsl:if>
                 <xsl:text>&#10;</xsl:text>
             </xsl:for-each>
            
             <!-- LOOP THROUGH ASSOCITIONENDS OF TYPE SOURCE -->
                 <xsl:for-each select="$associationend_sources">   
                     <xsl:if test="count($attributes) > 0">
                         <xsl:if test="position() = 1">,</xsl:if>
                     </xsl:if>
                     
                     <xsl:text>{"@id":"</xsl:text> 
                     <xsl:value-of select="$prefixURL"/>
                     <xsl:text>id/begrip/</xsl:text>
                     <xsl:value-of select="translate(../../@name,' ', '-')"/>
                     <xsl:text>-</xsl:text>
         
                     <xsl:value-of select="lower-case(../../UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='destStereotype' and  @value='Relatierol']]/@name)"/>
                                
                     <xsl:text>","skos:prefLabel":"</xsl:text>
                     <xsl:value-of select="../../@name"/>
                     <xsl:text> </xsl:text>           
                     <xsl:value-of select="UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='destStereotype' and  @value='Relatierol']]/@name"/>
                     
                     <xsl:text>"}</xsl:text>
                     <xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
               
            <xsl:text>],</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>        
        
        <!-- Related -->
        <!--xsl:if test="//UML:Association[UML:ModelElement.stereotype/UML:Stereotype/@name = 'Relatiesoort' and
            (UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetID']/@value = $eaClassID 
            or UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_sourceID']/@value = $eaClassID)]"-->                    
                     
        <xsl:text>"skos:related":[</xsl:text>
            
            
            <xsl:for-each select="//UML:Association[UML:ModelElement.stereotype/UML:Stereotype/@name = 'Relatiesoort' and
                                  (UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetID']/@value = $eaClassID 
                                  or UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_sourceID']/@value = $eaClassID)]">
                                  <!--and UML:Association.connection/UML:AssociationEnd/UML:ModelElement.taggedValue/UML:ModelElement[@tag = 'ea_end']/@value = 'target']">-->
                
               
                <xsl:text>&#10;</xsl:text>
                <xsl:text>{"@id":"</xsl:text>
                <xsl:value-of select="$prefixURL"/><xsl:text>id/begrip/</xsl:text>   
                <xsl:choose>
                   <xsl:when test="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetID']/@value = $eaClassID">
                       <xsl:variable name="relatedClass" select="translate(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_sourceName']/@value, ' ', '-')"/>                       
                       <xsl:value-of select="$relatedClass"/>                
                       <xsl:text>", "skos:prefLabel": "</xsl:text>
                       <xsl:value-of select="$relatedClass"/>      
                 </xsl:when>
                 <xsl:otherwise>
                     <xsl:variable name="relatedClass" select="translate(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetName']/@value, ' ', '-')"/>
                     <xsl:value-of select="$relatedClass"/>                
                     <xsl:text>", "skos:prefLabel": "</xsl:text>
                     <xsl:value-of select="$relatedClass"/>      
                 </xsl:otherwise>               
               </xsl:choose>
    
                <xsl:text>"}</xsl:text>
                <xsl:text>&#10;</xsl:text>
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>        
            <xsl:text>&#10;</xsl:text>
            <xsl:text>]&#10;</xsl:text>
           <!--/xsl:if--> 
            <xsl:text>},&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>       
        
                
        
        <!--   
          ___ _      _   ___ ___                                                                           
         / __| |    /_\ / __/ __|                                                                          
        | (__| |__ / _ \\__ \__ \                                                                          
         \___|____/_/_\_\___/___/_ ___ ___ ___ _   _ _____ ___ ___                                         
                    /_\_   _|_   _| _ \_ _| _ ) | | |_   _| __/ __|                                        
                   / _ \| |   | | |   /| || _ \ |_| | | | | _|\__ \                                        
                  /_/ \_\_|   |_| |_|_\___|___/\___/  |_| |___|___/   ___ ___  _  _  ___ ___ ___ _____ ___ 
                                                          /_\ / __|  / __/ _ \| \| |/ __| __| _ \_   _/ __|
                                                         / _ \\__ \ | (_| (_) | .` | (__| _||  _/ | | \__ \
                                                        /_/ \_\___/  \___\___/|_|\_|\___|___|_|   |_| |___/
        -->        
        <xsl:for-each select="$attributes">            
            
            <xsl:variable name="attributeName" select="@name"/>
            
            <xsl:text>{</xsl:text>
            
            <!--"@id":"</xsl:text>
          
            <xsl:variable name="attributeID" select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_guid']/@value"/>
            <xsl:value-of select="$attributeID"/>
            <xsl:text>",&#10;</xsl:text-->
            
            
            <!-- URI = ID -->
            <xsl:text>"@id":"</xsl:text>
            <xsl:value-of select="$prefixURL"/>
            <xsl:text>id/begrip/</xsl:text>
            <xsl:value-of select="lower-case(translate(@name,' ', '-'))"/>
            <xsl:if test="@name = 'geometrie'">
                <xsl:text>-</xsl:text>
                <xsl:value-of select="lower-case(translate(../../@name, ' ', '-'))"/>
            </xsl:if>
            <xsl:text>",&#10;</xsl:text>
            
            <!-- PREFLABEL: Name -->
            <xsl:text>"skos:prefLabel":"</xsl:text>
            <xsl:choose>
                <xsl:when test="@name = 'geometrie'">
                <xsl:value-of select="concat(@name, ' (', ../../@name, ')')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@name"/>
                </xsl:otherwise>
            </xsl:choose>
            
            
            <xsl:text>",&#10;</xsl:text>
            
            <!-- Definitie -->
            <xsl:text>"skos:definition":</xsl:text>
            <xsl:text>"</xsl:text>
            <xsl:choose>
                <xsl:when test="contains(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='description']/@value, '&lt;')
                              or contains(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='description']/@value, '&gt;')">
                    <xsl:value-of select="replace(tokenize(tokenize(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='description']/@value, '&gt;')[2], '&lt;')[1], '&#xa;', '')"/>
                    <!--xsl:value-of select="$definition"/-->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="replace(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='description']/@value, '&#xa;', '')"/>
                    
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:text>",</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <!-- NARROWERPARTITIVE - ENUMERATIE OF CODELIST --><!-- subtypes indien codelijst? of omvat codelijst, en codelijst omvat subtypes??? -->
            <xsl:variable name="typeID"  select="UML:StructuralFeature.type/UML:Classifier/@xmi.idref"/>
            
            <xsl:if test="//UML:Class[@xmi.id  = $typeID]">
                <xsl:text>"isothes:narrowerPartitive":{</xsl:text>
                <xsl:text>&#10;</xsl:text>
                    <xsl:text>&#9;"@id":"</xsl:text>
                    <xsl:value-of select="$prefixURL"/>
                    <xsl:text>id/begrip/</xsl:text>
                    <xsl:value-of select="translate(//UML:Class[@xmi.id = $typeID]/@name, ' ', '-')"/>        
                    <xsl:text>",</xsl:text>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:text>&#9;"skos:prefLabel":"</xsl:text>               
                    <xsl:value-of select="//UML:Class[@xmi.id = $typeID]/@name"/>
                    <xsl:text>"</xsl:text> 
                    <xsl:text>&#10;</xsl:text> 
                <xsl:text>},</xsl:text>
                <xsl:text>&#10;</xsl:text>  
                
            </xsl:if>
            
            
            <!-- BROADERPARTITIVE -->
            <xsl:text>"isothes:broaderPartitive":{ "@id":"</xsl:text>
            <xsl:value-of select="$prefixURL"/>
            <xsl:text>id/begrip/</xsl:text>    
            <xsl:value-of select="translate(../../@name, ' ', '-')"/>
            <xsl:text>", "skos:prefLabel":"</xsl:text>
            <xsl:value-of select="../../@name"/>
            <xsl:text>"},</xsl:text>
            <xsl:text>&#10;</xsl:text> 
        

            
            <!-- MATCHES -->
            <!--xsl:for-each select="//UML:Dependency[UML:ModelElement.stereotype/UML:Stereotype/@name = 'trace']"-->
            <!-- bepaal of Dependency van toepassing is op dit attribuut o.b.v. eaSourceID en naam attribuut.. --> 
            <!-- PLUS elke //UML:Association van type Abstraction en stereotype = trace -->           
           <!--//UML:Dependency[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_sourceID']/@value = $eaClassID] -->
           <xsl:text>"skos:relatedMatch":[</xsl:text>
            <xsl:if test="//UML:Association[UML:ModelElement.stereotype/UML:Stereotype/@name = 'trace' and UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_sourceID']/@value = $eaClassID]">
                
             <!--   and UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetID']/@value = $eaClassID]"--> 
                
                <!--https://docs.ndw.nu/en/handleidingen/wkd/wkd_wegbreedtes/#:~:text=WVK_ID-->
               
                
                <xsl:value-of select="UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_end']/@value = 'source']/@name"/>
                <xsl:for-each select="//UML:Association[UML:ModelElement.stereotype/UML:Stereotype/@name = 'trace' 
                                      and UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_sourceID']/@value = $eaClassID 
                                      and UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_end']/@value = 'target']/@name = $attributeName]">
                    <xsl:variable name="eaTargetID" select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetID']/@value"/>         
                    <xsl:text>{ "@id":"</xsl:text>
                    <xsl:choose>
                        <xsl:when test="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='conceptURI']/@value"></xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$prefixURL"/>
                            <xsl:choose>
                                
                                <xsl:when test="//UML:Package[UML:Namespace.ownedElement/UML:Class/UML:ModelElement.taggedValue/UML:TaggedValue[@tag = 'ea_localid']/@value = $eaTargetID]">
                                    
                                    <xsl:value-of select="lower-case(translate(//UML:Package[UML:Namespace.ownedElement/UML:Class/UML:ModelElement.taggedValue/UML:TaggedValue[@tag = 'ea_localid']/@value = $eaTargetID]/@name, ' ', '-'))"/>
                                    <xsl:text>/</xsl:text> 
                                </xsl:when>
                                <xsl:when test="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='sourceName']/@value">
                                    
                                    <xsl:value-of select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='sourceName']/@value"/>
                                    <xsl:text>/</xsl:text> 
                               </xsl:when>
                               <xsl:otherwise>                                    
                               </xsl:otherwise> 
                            </xsl:choose>                             
                            <xsl:value-of select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetName']/@value"/>
                            <xsl:text>/id/begrip/</xsl:text>
                            <xsl:value-of select="UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_end']/@value = 'source']/@name"/>
                        </xsl:otherwise>
                    </xsl:choose>                    
                    
                    <xsl:text>", "skos:prefLabel":"</xsl:text>
                    <xsl:value-of select="UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_end']/@value = 'source']/@name"/>                 
  
                        <xsl:text>"}</xsl:text>
                        <xsl:if test="position() != last()">,</xsl:if>
                    <xsl:text>&#10;</xsl:text><xsl:text>&#10;</xsl:text>
                </xsl:for-each>
      
            </xsl:if>    
            <xsl:text>]</xsl:text>
            <xsl:text>&#10;</xsl:text>
         
            <!-- Foreach for CLASS -->
            <xsl:text>},</xsl:text>
            <xsl:text>&#10;</xsl:text>   
            </xsl:for-each>
        
        <!--            
      
           ___ _      _   ___ ___                                                                                              
          / __| |    /_\ / __/ __|                                                                                             
         | (__| |__ / _ \\__ \__ \                                                                                             
          \___|____/_/_\_\___/___/ ___   ___   _ _____ ___ ___  _  _ ___ _  _ ___  ___                                         
                     /_\ / __/ __|/ _ \ / __| /_\_   _|_ _/ _ \| \| | __| \| |   \/ __|                                        
                    / _ \\__ \__ \ (_) | (__ / _ \| |  | | (_) | .` | _|| .` | |) \__ \                                        
                   /_/ \_\___/___/\___/ \___/_/ \_\_| |___\___/|_|\_|___|_|\_|___/|___/   ___ ___  _  _  ___ ___ ___ _____ ___ 
                                                                              /_\ / __|  / __/ _ \| \| |/ __| __| _ \_   _/ __|
                                                                             / _ \\__ \ | (_| (_) | .` | (__| _||  _/ | | \__ \
                                                                            /_/ \_\___/  \___\___/|_|\_|\___|___|_|   |_| |___/                                                                                                         
        -->   
        
        <xsl:for-each select="//UML:Association[UML:Association.connection/UML:AssociationEnd/UML:ModelElement.taggedValue/UML:TaggedValue[@tag = 'destStereotype']/@value = 'Relatierol']">
            <xsl:text>{</xsl:text>
                      
            
            <!-- URI = ID -->
            <xsl:text>"@id":"</xsl:text>
            <xsl:value-of select="$prefixURL"/>
            <xsl:text>id/begrip/</xsl:text>
            <xsl:value-of select="lower-case(translate(@name,' ', '-'))"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="lower-case(translate(UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag = 'destStereotype']/@value = 'Relatierol']/@name,' ', '-'))"/>
            <xsl:text>",</xsl:text>
            <xsl:text>"prefLabel":"</xsl:text>
            <xsl:value-of select="UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag = 'destStereotype']/@value = 'Relatierol']/@name"/>
                
                
                <xsl:text>"},</xsl:text>
            <xsl:text>&#10;</xsl:text>   
            
        </xsl:for-each>
        
        
        
        
        
    </xsl:template>
           
    <xsl:template match="UML:Enumeration">       
    
    <xsl:for-each select="UML:Enumeration">
        
        
    </xsl:for-each>
    
        
    </xsl:template>
    
    <!--   
      ___   _ _____ _ _______   _____ ___ ___                                         
     |   \ /_\_   _/_\_   _\ \ / / _ \ __/ __|                                        
     | |) / _ \| |/ _ \| |  \ V /|  _/ _|\__ \                                        
     |___/_/ \_\_/_/ \_\_|   |_| |_| |___|___/   ___ ___  _  _  ___ ___ ___ _____ ___ 
                                     /_\ / __|  / __/ _ \| \| |/ __| __| _ \_   _/ __|
                                    / _ \\__ \ | (_| (_) | .` | (__| _||  _/ | | \__ \
                                   /_/ \_\___/  \___\___/|_|\_|\___|___|_|   |_| |___/
    -->
    
    <xsl:template match="UML:Datatype">    
        
        
    </xsl:template>
    
    <!-- externe begrippen -->
    <xsl:template match="//UML:Association[UML:ModelElement.stereotype/UML:Stereotype/@name = 'trace']">
        <xsl:variable name="eaTargetClassID" select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetID']/@value"/>
        <xsl:text>{"@id":"</xsl:text>
        <xsl:choose>
            <xsl:when test="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='conceptURI']/@value"></xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$prefixURL"/>
                <xsl:choose>
                    
                    <xsl:when test="//UML:Package[UML:Namespace.ownedElement/UML:Class/UML:ModelElement.taggedValue/UML:TaggedValue[@tag = 'ea_localid']/@value = $eaTargetClassID]">
                        
                        <xsl:value-of select="lower-case(translate(//UML:Package[UML:Namespace.ownedElement/UML:Class/UML:ModelElement.taggedValue/UML:TaggedValue[@tag = 'ea_localid']/@value = $eaTargetClassID]/@name, ' ', '-'))"/>
                        <xsl:text>/</xsl:text> 
                    </xsl:when>
                    <xsl:when test="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='sourceName']/@value">                        
                        <xsl:value-of select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='sourceName']/@value"/>
                        <xsl:text>/</xsl:text> 
                    </xsl:when>
                    <xsl:otherwise>                                    
                    </xsl:otherwise> 
                </xsl:choose>                             
                <xsl:value-of select="UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_targetName']/@value"/>
                <xsl:text>/id/begrip/</xsl:text>
                <xsl:value-of select="UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_end']/@value = 'source']/@name"/>
            </xsl:otherwise>
        </xsl:choose>   
        <xsl:text>",&#10;</xsl:text>
        <xsl:text>"skos:prefLabel":"</xsl:text>
        <xsl:variable name="targetAttributeName" select="UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_end']/@value = 'source']/@name"/>
        <xsl:value-of select="UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_end']/@value = 'source']/@name"/> 
        <xsl:text>",&#10;</xsl:text>
      
        <xsl:text>"skos:definition":"</xsl:text>
        <xsl:for-each select="//UML:Class[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='ea_localid']/@value = $eaTargetClassID]/UML:Classifier.feature/UML:Attribute[@name = $targetAttributeName]">
        
            <xsl:choose>
                <xsl:when test="contains(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='description']/@value, '&lt;')
                    or contains(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='description']/@value, '&gt;')">
                    <xsl:value-of select="replace(tokenize(tokenize(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='description']/@value, '&gt;')[2], '&lt;')[1], '&#xa;', '')"/>
                    <!--xsl:value-of select="$definition"/-->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="replace(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='description']/@value, '&#xa;', '')"/>
                    
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
         <xsl:text>",&#10;</xsl:text> 
        <xsl:text>"dt_source":"</xsl:text>         
            <xsl:value-of select="UML:Association.connection/UML:AssociationEnd[UML:ModelElement.taggedValue/UML:TaggedValue[@tag='sourceURI']]/@value"/>
        <xsl:text>"},&#10;</xsl:text>      
        
        
        
        
    </xsl:template>
    
    
    

    
    
    
    
    
    <xsl:template match="/">
        <xsl:apply-templates/>
        
        <xsl:text>{}
  ]
}
  </xsl:text>
    </xsl:template>
    
    <xsl:template
        match="*"> </xsl:template>
    
   
    
    <xsl:template
        match="XMI | XMI.content | UML:Model | UML:Package | UML:Association | UML:ModelElement.stereotype | UML:Namespace.ownedElement">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <!--xsl:function name="my:cleanup-string" as="xs:string">
        <xsl:param name="input" as="xs:string"/>
        <xsl:choose>
        <xsl:when test="contains($input, '&gt;') or contains($input, '&gt')">
            <xsl:variable name="$input2" select="replace(tokenize(tokenize(UML:ModelElement.taggedValue/UML:TaggedValue[@tag='description']/@value, '&gt;')[2], '&lt;')[1], '&#xa;', '')"/>   
        </xsl:when>
        <xsl:otherwise>
            <xsl:variable name="$input2"
        </xsl:otherwise>
        
        </xsl:choose-->
   
        
    
        <!--xsl:sequence select="replace($input, '[&quot;''\(\)]', '')"/>
    </xsl:function-->
    
    
    
</xsl:stylesheet>
