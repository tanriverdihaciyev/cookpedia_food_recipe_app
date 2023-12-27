import 'package:cookpedia_foodrecipe_app/features/comment/domain/entities/comment_entity.dart';
import 'package:flutter/material.dart';

class RVAddCommentTextControllerProvider extends ChangeNotifier {
  CommentEntity? _commentEntity;
  CommentEntity? get commentEntity => _commentEntity;
  addCommentEntity(CommentEntity commentEntity) {
    _commentEntity = commentEntity;
    notifyListeners();
  }

  TextEditingController? _textEditingController;
  TextEditingController? get textEditingController => _textEditingController;
  addTextController(TextEditingController textEditingController) {
    _textEditingController = textEditingController;
    notifyListeners();
  }

  resetAll() {
    _commentEntity = null;
    _textEditingController = null;
    notifyListeners();
  }
}
