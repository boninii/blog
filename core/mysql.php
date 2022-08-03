<?php

    function insere(string $entidade, array $dados) : bool
    {
        $retorno = false;

        foreach($dados as $campo => $dado) {
            $coringa[$campo] = '?';
            $tipo[] = gettype($dado) [0];
            $$campo = $dado;
        }

        $instrucao = insert($entidade, $coringa);

        $conexao = conecta();

        $stmt = mysqli_prepare($conexao, $instrucao);

        eval('mysqli_stmt_bind_param($stmt, \'' . implode('', $tipo) . '\', $'
        . implode(', $', array_keys($dados)) . ');');

        mysqli_stmt_execute($stmt);

        $retorno = (boolean) mysqli_stmt_affected_rows($stmt);

        $_SESSION['errors'] = mysqli_stmt_error_list($stmt);

        mysqli_stmt_close($stmt);

        desconecta($conexao);

        return $retorno;
    }

    function atualiza(string $entidade, array $dados, array $criterio = []) : bool
    {
        $retorno = false;

        foreach ($dados as $campo => $dado) {
            $coringa_dados[$campo] = '?';
            $tipo[] = gettype($dado) [0];
            $$campo = $dado;
        }

        foreach ($criterio as $expressao) {
            $dado = $expressao[count($expressao) -1];
            
            $tipo[] = gettype($dado) [0];
            $expressao[count($expressao) -1] = '?';
            $coringa_criterio[] = $expressao;
        }
    }
?>