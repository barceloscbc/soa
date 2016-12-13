xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://pucminas.br/sn/creditoservice/cleberigor";
(:: import schema at "../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace cle = "http://pucminas.br/mc/soa/cleberigor";

declare variable $input as element() (:: schema-element(ns1:resultadoVerificaCreditoExterno) ::) external;

declare function local:func($input as element() (:: schema-element(ns1:resultadoVerificaCreditoExterno) ::)) as element() (:: schema-element(ns1:resultadoVerificaCreditoExterno) ::) {
    <ns1:resultadoVerificaCreditoExterno>
        <ns1:credito>
            <cle:pessoa>
                <cle:id>{fn:data($input/ns1:credito/cle:pessoa/cle:id)}</cle:id>
                <cle:nome>{fn:data($input/ns1:credito/cle:pessoa/cle:nome)}</cle:nome>
                <cle:dataNascimento>{fn:data($input/ns1:credito/cle:pessoa/cle:dataNascimento)}</cle:dataNascimento>
                <cle:cpf>{fn:data($input/ns1:credito/cle:pessoa/cle:cpf)}</cle:cpf>
                <cle:telefone>{fn:data($input/ns1:credito/cle:pessoa/cle:telefone)}</cle:telefone>
            </cle:pessoa>
            <cle:indicaCreditoExterno>{fn:data($input/ns1:credito/cle:indicaCreditoExterno)}</cle:indicaCreditoExterno>
            <cle:indicaCreditoInterno>{fn:data($input/ns1:credito/cle:indicaCreditoInterno)}</cle:indicaCreditoInterno>
            <cle:indicaWhiteList>{fn:data($input/ns1:credito/cle:indicaWhiteList)}</cle:indicaWhiteList>
            <cle:situacao>{fn:data($input/ns1:credito/cle:situacao)}</cle:situacao>
            
             {
                 if ($input/ns1:credito/cle:score > 400.0) then
                     <cle:score>{fn:data(200.0)}</cle:score>
                 else
                     <cle:score>{fn:data($input/ns1:credito/cle:score)}</cle:score>
                    
             }
        </ns1:credito>
    </ns1:resultadoVerificaCreditoExterno>
};

local:func($input)
