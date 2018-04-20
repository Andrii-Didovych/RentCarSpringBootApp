package ua.service.impl;

import org.springframework.stereotype.Service;
import ua.entity.Model;
import ua.model.request.ModelRequest;
import ua.model.view.ModelView;
import ua.repository.ModelRepository;
import ua.service.ModelService;

import java.util.List;

@Service
public class ModelServiceImpl  implements ModelService {

    private final ModelRepository repository;

    public ModelServiceImpl(ModelRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<String> findAllBrand() {
        return repository.findAllBrandRepository();
    }

    @Override
    public List<ModelView> findAllModelView() {
        return repository.findAllModelViewRepository();
    }

    @Override
    public ModelRequest findOne(Integer id) {
        Model model = repository.findOneModelRequestRepository(id);
        ModelRequest request = new ModelRequest();
        request.setId(model.getId());
        request.setName(model.getName());
        request.setBrand(model.getBrand());
        return request;
    }

    @Override
    public void save(ModelRequest request) {
        Model model = new Model();
        model.setId(request.getId());
        model.setName(request.getName());
        model.setBrand(request.getBrand());
        repository.save(model);
    }

    @Override
    public void delete(Integer id) {
        repository.deleteById(id);
    }
}
