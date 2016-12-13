xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://creditlegacy.com.br/SN/CreditLegacy";
(:: import schema at "../../../../Mock_Legacy/Interfaces/Schemas/CreditLegacy.xsd" ::)
declare namespace ns2="http://pucminas.br/sn/creditoservice/cleberigor";
(:: import schema at "../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace cle = "http://pucminas.br/mc/soa/cleberigor";

declare variable $param as element() (:: schema-element(ns1:ResultadoCreditLegacy) ::) external;

declare function local:func($param as element() (:: schema-element(ns1:ResultadoCreditLegacy) ::)) as element() (:: schema-element(ns2:resultadoVerificaCreditoInterno) ::) {
    <ns2:resultadoVerificaCreditoInterno>
        <ns2:credito>
            <cle:pessoa>
                <cle:id></cle:id>
                <cle:nome></cle:nome>
                <cle:dataNascimento></cle:dataNascimento>
                <cle:cpf>{fn:data($param/ns1:cpf)}</cle:cpf>
                <cle:telefone></cle:telefone>
            </cle:pessoa>
            <cle:indicaCreditoExterno></cle:indicaCreditoExterno>
            <cle:indicaCreditoInterno></cle:indicaCreditoInterno>
            <cle:indicaWhiteList></cle:indicaWhiteList>
            <cle:situacao></cle:situacao>
            {
                if (fn:count($param/ns1:restricoes/ns1:restricao/ns1:valor) <= 3 and fn:sum($param/ns1:restricoes/ns1:restricao/ns1:valor) < 200 ) then
                    <cle:score>200.00</cle:score>
                else 
                    if (fn:count($param/ns1:restricoes/ns1:restricao/ns1:valor) >= 4) then
                        <cle:score>0.0</cle:score>
                    else
                        <cle:score>{xs:double(fn:sum($param/ns1:restricoes/ns1:restricao/ns1:valor))}</cle:score>
                
              
            }
        </ns2:credito>
    </ns2:resultadoVerificaCreditoInterno>
};

local:func($param)
