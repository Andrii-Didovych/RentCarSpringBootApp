package ua.repository;

import org.springframework.data.jpa.repository.Query;
import ua.entity.Model;
import ua.model.view.ModelView;

import java.util.List;

public interface ModelRepository extends JpaNameRepository<Model, Integer> {

    @Query("SELECT b.name from Brand b")
    List<String> findAllBrandRepository();

    @Query("select new ua.model.view.ModelView(m.id, m.name, b.name) from Model m join m.brand b order by b.name asc")
    List<ModelView> findAllModelViewRepository();

    @Query("select m from Model m join fetch m.brand b where m.id=?1")
    Model findOneModelRequestRepository(Integer id);
}
