package ua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ua.entity.Comment;
import ua.entity.Driver;
import ua.entity.InfoAboutRent;
import ua.entity.enums.Status;
import ua.model.view.DriverView;
import ua.model.view.OrderView;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Integer> {
}
