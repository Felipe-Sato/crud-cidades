package br.edu.utfpr.cp.espjava.crudcidades.cidade;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EstadoRepository extends JpaRepository<EstadoEntidade, Long> {

	Optional<EstadoEntidade> findByNome(String nome);
	Optional<EstadoEntidade> findByNomeAndSigla(String nome, String sigla);
}
