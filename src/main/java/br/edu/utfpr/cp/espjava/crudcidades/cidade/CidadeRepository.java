package br.edu.utfpr.cp.espjava.crudcidades.cidade;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CidadeRepository extends JpaRepository<CidadeEntidade, Long> { 

	Optional<CidadeEntidade> findByNome(String nome);
	Optional<CidadeEntidade> findByNomeAndEstado(String nome, String estado);
}
