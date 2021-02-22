package com.m.salonM.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.m.salonM.config.auth.PrincipalDetail;
import com.m.salonM.dto.ReplySaveRequestDto;
import com.m.salonM.model.Board;
import com.m.salonM.model.Reply;
import com.m.salonM.model.User;
import com.m.salonM.repository.BoardRepository;
import com.m.salonM.repository.ReplyRepository;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	@Transactional
	public void write(Board board, User user) {
		board.setCount(0);
		board.setUser(user);
		boardRepository.save(board);
	}
	
	@Transactional(readOnly=true)
	public Page<Board> writingList(Pageable pageable){
		return boardRepository.findAll(pageable);
	}
	
	@Transactional(readOnly=true)
	public Board continueReading(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void deleteWriting(int id, PrincipalDetail principal) {
		Optional<Board> board = boardRepository.findById(id);
		if(board.get().getUser().getId() == principal.getUser().getId()) {
			System.out.println(id+"삭제합니다.");
			boardRepository.deleteById(id);
		}else {
			throw new IllegalStateException("글 삭제 실패: 해당 글의 작성자가 아닙니다.");
		}
	}
	
	@Transactional
	public void update(int id, Board requestBoard) {
		Board board = boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패");
				});
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
	}
	
	@Transactional
	public void writeReply(ReplySaveRequestDto replySaveRequestDto) {
		replyRepository.mSave(replySaveRequestDto.getUserId(), replySaveRequestDto.getBoardId(), replySaveRequestDto.getContent());
	}
	
	@Transactional
	public void replyDelete(int replyId, PrincipalDetail principal) {
		Optional<Reply> reply = replyRepository.findById(replyId);
		if(reply.get().getUser().getId()==principal.getUser().getId()) {
			replyRepository.deleteById(replyId);
		}else {
			throw new IllegalStateException("댓글 삭제 실패: 해당 댓글 작성자가 아닙니다.");
		}
	}
}
