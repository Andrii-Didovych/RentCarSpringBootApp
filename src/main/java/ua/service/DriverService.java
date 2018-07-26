package ua.service;

import ua.model.view.CarView;
import ua.model.view.CommentView;
import ua.model.view.DriverView;

import java.util.List;


public interface DriverService   {

    void postComment(Integer id, Integer senderId, String comment);

    Integer findIdOfDriverByEmail(String email);

    DriverView findDriverViewById(Integer id);

    CarView findCarViewByDriverId(Integer id);

    List<CommentView> findCommentsOfDriver(Integer id);
}
