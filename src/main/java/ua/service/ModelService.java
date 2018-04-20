package ua.service;


import ua.model.request.ModelRequest;
import ua.model.view.ModelView;

import java.util.List;

public interface ModelService {

    List<String> findAllBrand();

    List<ModelView> findAllModelView();

    void save(ModelRequest request);

    void delete(Integer id);

    ModelRequest findOne(Integer id);
}
