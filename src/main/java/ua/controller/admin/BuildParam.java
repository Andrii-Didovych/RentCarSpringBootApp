package ua.controller.admin;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import ua.filter.SimpleFilter;

public class BuildParam {
    private  Pageable pageable;

    private  SimpleFilter filter;

    public String buildParams(Pageable pageable, SimpleFilter filter) {
        StringBuilder buffer = new StringBuilder();
        buffer.append("?page=");
        buffer.append(String.valueOf(pageable.getPageNumber() + 1));
        buffer.append("&size=");
        buffer.append(String.valueOf(pageable.getPageSize()));
        if (pageable.getSort() != null) {
            buffer.append("&sort=");
            Sort sort = pageable.getSort();
            sort.forEach(order -> {
                buffer.append(order.getProperty());
                if (order.getDirection()!=Sort.Direction.ASC)
                    buffer.append(",desc");
            });
        }
        buffer.append("&search=");
        buffer.append(filter.getSearch());
        return buffer.toString();
    }
}
