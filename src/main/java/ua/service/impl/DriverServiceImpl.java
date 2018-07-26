package ua.service.impl;

import org.springframework.stereotype.Service;
import ua.entity.Comment;
import ua.entity.Driver;
import ua.model.view.CarView;
import ua.model.view.CommentView;
import ua.model.view.DriverView;
import ua.repository.CommentRepository;
import ua.repository.DriverRepository;
import ua.service.DriverService;

import java.time.LocalDate;
import java.util.List;

@Service
public class DriverServiceImpl implements DriverService {

    private final DriverRepository repository;

    private final CommentRepository commentRepository;


    public DriverServiceImpl(DriverRepository repository, CommentRepository commentRepository) {
        this.repository = repository;
        this.commentRepository = commentRepository;
    }

    @Override
    public List<CommentView> findCommentsOfDriver(Integer id) {
        return repository.findCommentsOfDriver(id);
    }

    @Override
    public Integer findIdOfDriverByEmail(String name) {
        return repository.findIdOfDriverByEmail(name);
    }

    @Override
    public CarView findCarViewByDriverId(Integer id) {
        return repository.findCarViewByDriverId(id);
    }

    @Override
    public DriverView findDriverViewById(Integer id) {
        return repository.findDriverViewById(id);
    }

    @Override
    public void postComment(Integer receiverId, Integer senderId, String comment) {
        Driver receiver = repository.findOne(receiverId);
        Driver sender = repository.findOne(senderId);
        Comment newComment = new Comment();
        newComment.setText(comment);
        newComment.setDate(LocalDate.now());
        newComment.setReceiver(receiver);
        newComment.setSender(sender);
        receiver.getReceivedComments().add(newComment);
        commentRepository.save(newComment);
    }


}
