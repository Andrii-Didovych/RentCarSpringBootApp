package ua.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import ua.filter.CarFilter;
import ua.model.view.OrderView;
import ua.service.impl.MyGlobalVariable;

import java.util.List;

public interface BorrowRepository {
    Page<OrderView> findAllFreeCars(Integer id, Pageable pageable, CarFilter filter);
}
