package com.project.horror.recommend.service;

import com.project.horror.recommend.domain.RecBoard;
import com.project.horror.recommend.repository.RecMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class RecService {

    private final RecMapper mapper;

    // 게시물 등록 요청 중간처리
    public boolean saveService(RecBoard board) {
        log.info("save service start - {}", board);
        return mapper.save(board);
    }

    // 게시물 전체 조회 요청 중간 처리 (마이바티스)                [with paging X]

    public Map<String, Object> findAllService() {
        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<RecBoard> boardList = mapper.findAll();

        // 목록 중간 데이터처리
//        processConverting(boardList);

        findDataMap.put("bList", boardList);
//        findDataMap.put("tc", repository.getTotalCount(search));

        return findDataMap;
    }

         // -- 목록 중간 데이터처리


        //  -- 신규 게시물 여부 처리


        //  --  시간 포맷팅처리


       //   --   글제목 줄임처리


// 게시물 상세 조회 요청 중간 처리

//    @Transactional // sql문이 전부 성공해야 commit, 하나라도 실패하면 rollback!
    public RecBoard findOneService(Long boardNo /*HttpServletResponse response, HttpServletRequest request*/) { // 응답 객체 생성
        log.info("findOne service start - {}", boardNo);
        RecBoard board = mapper.findOne(boardNo);

//        makeViewCount(boardNo, response, request);

        return board;
    }

// 게시물 삭제 요청 중간 처리

    public boolean removeService(Long boardNo) {
        log.info("remove service start - {}", boardNo);
        return mapper.remove(boardNo);
    }

// 게시물 수정 요청 중간 처리

    // 게시물 수정 요청 중간 처리
    public boolean modifyService(RecBoard board) {
        log.info("modify service start - {}", board);
        return mapper.modify(board);
    }


}
