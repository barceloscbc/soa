xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://creditlegacy.com.br/SN/CreditLegacy";
(:: import schema at "../../../../Mock_Legacy/Interfaces/Schemas/CreditLegacy.xsd" ::)
declare namespace ns2="http://pucminas.br/sn/creditoservice/cleberigor";
(:: import schema at "../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace cle = "http://pucminas.br/mc/soa/cleberigor";

declare variable $parametro as element() (:: schema-element(ns1:ResultadoCreditLegacy) ::) external;

declare function local:func($parametro as element() (:: schema-element(ns1:ResultadoCreditLegacy) ::)) as element() (:: schema-element(ns2:resultadoVerificaCreditoInterno) ::) {
    <ns2:resultadoVerificaCreditoInterno>
        <ns2:credito>
            <cle:pessoa>
                <cle:id></cle:id>
                <cle:nome></cle:nome>
                <cle:dataNascimento></cle:dataNascimento>
                <cle:cpf>{fn:data($parametro/ns1:cpf)}</cle:cpf>
                <cle:telefone></cle:telefone>
            </cle:pessoa>
            <cle:indicaCreditoExterno></cle:indicaCreditoExterno>
            <cle:indicaCreditoInterno></cle:indicaCreditoInterno>
            <cle:indicaWhiteList></cle:indicaWhiteList>
            <cle:situacao></cle:situacao>
        </ns2:credito>
    </ns2:resultadoVerificaCreditoInterno>
};

local:func($parametro)
