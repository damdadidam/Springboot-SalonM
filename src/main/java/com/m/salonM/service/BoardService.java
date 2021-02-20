package com.m.salonM.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.m.salonM.config.auth.PrincipalDetail;
import com.m.salonM.model.Board;
import com.m.salonM.model.User;
import com.m.salonM.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;
	
	
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
}
