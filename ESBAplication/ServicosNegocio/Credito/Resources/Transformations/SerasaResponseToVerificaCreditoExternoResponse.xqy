xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://pucminas.br/sn/creditoservice/cleberigor";
(:: import schema at "../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
declare namespace ns1="http://serasa.com.br/SN/Serasa";
(:: import schema at "../Interfaces/Schemas/Serasa.xsd" ::)

declare namespace cle = "http://pucminas.br/mc/soa/cleberigor";

declare variable $parametro as element() (:: schema-element(ns1:ResultadoSerasa) ::) external;

declare function local:func($parametro as element() (:: schema-element(ns1:ResultadoSerasa) ::)) as element() (:: schema-element(ns2:resultadoVerificaCreditoExterno) ::) {
    <ns2:resultadoVerificaCreditoExterno>
        <ns2:credito>
            <cle:pessoa>
                <cle:id></cle:id>
                <cle:nome></cle:nome>
                <cle:dataNascimento></cle:dataNascimento>
                <cle:cpf>{fn:data($parametro/ns1:num_documento)}</cle:cpf>
                <cle:telefone></cle:telefone>
            </cle:pessoa>
            <cle:indicaCreditoExterno></cle:indicaCreditoExterno>
            <cle:indicaCreditoInterno></cle:indicaCreditoInterno>
            <cle:indicaWhiteList></cle:indicaWhiteList>
            <cle:situacao></cle:situacao>
        </ns2:credito>
    </ns2:resultadoVerificaCreditoExterno>
};

local:func($parametro)
