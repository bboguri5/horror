package com.project.horror.recommend.service;

import com.project.horror.recommend.common.paging.RecPage;
import com.project.horror.recommend.common.search.RecSearch;
import com.project.horror.recommend.domain.RecBoard;
import com.project.horror.recommend.repository.RecMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    public Map<String, Object> findAllService(RecSearch search) {
        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<RecBoard> boardList = mapper.findAll(search);

        // 목록 중간 데이터처리
        processConverting(boardList);

        findDataMap.put("bList", boardList);
        findDataMap.put("tc", mapper.getTotalCount());

        return findDataMap;
    }


    // -- 목록 중간 데이터처리
    private void processConverting(List<RecBoard> boardList) {
        for (RecBoard b : boardList) {
            convertDateFormat(b);
            subStringTitle(b);
            checkNewArticle(b);
        }

    }

    private void checkNewArticle(RecBoard b) {
            // 게시물의 작성일자와 현재 시간을 대조

            //게시물의 작성일자 가지고 오기
            long regDateTime = b.getRegDate().getTime();

            // 현재 시간 얻기
            long nowTime = System.currentTimeMillis();

            // 현재 시간 - 작성 시간
            long diff = nowTime - regDateTime;

            // 신규 게시물 제한 시간
            long limitTime = 60 * 5 * 1000;

            if(diff < limitTime) {
                b.setNewArticle(true);
            }
        }



    //  -- 신규 게시물 여부 처리


    //   --   글제목 줄임처리
    private void subStringTitle(RecBoard b){
        String title = b.getTitle();
        if (title.length() > 30){
            String subStr = title.substring(0,10);
            b.setShortTitle(subStr + ".....");
        } else {
            b.setShortTitle(title);
        }
    }

       //  --  시간 포맷팅처리
    private void convertDateFormat(RecBoard b){
        Date date = b.getRegDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd a hh:mm");
        b.setPrettierDate(sdf.format(date));

//        log.info("변경된 날짜데이터{}",b.getPrettierDate());
    }





// 게시물 상세 조회 요청 중간 처리
    @Transactional // sql문이 전부 성공해야 commit, 하나라도 실패하면 rollback!
    public RecBoard findOneService(Long boardNo, HttpServletResponse response, HttpServletRequest request) { // 응답 객체 생성
        log.info("findOne service start - {}", boardNo);
        RecBoard board = mapper.findOne(boardNo);

        makeViewCount(boardNo, response, request);

        return board;
    }

    private void makeViewCount(Long boardNo, HttpServletResponse response, HttpServletRequest request) {
        Cookie foundCookie = WebUtils.getCookie(request, "b" + boardNo);// 클라이언트의 쿠키 조회
        if (foundCookie == null) {
            mapper.upViewCount(boardNo);

            //해당 게시물 번호에 해당하는 쿠기가 있는지 확인
            // 쿠키가 없으면 쿠키를 만들어서 클라이언트에게 전송 + 조회수 상승

            Cookie cookie = new Cookie("b" + boardNo, String.valueOf(boardNo)); // 쿠키 생성
            cookie.setMaxAge(60); // 쿠키 수명 ## 테스트용 60초
            cookie.setPath("recboard/reccontent"); // 쿠키 작동 범위

            response.addCookie(cookie); // 클라이언트에게 쿠키 전송
        }
    }

    // 게시물 좋아요 상승 중간처리
    public boolean makeGoodCount(Long boardNo, HttpServletResponse response, HttpServletRequest request) {
        Cookie foundCookie = WebUtils.getCookie(request, "good" + boardNo);// 클라이언트의 쿠키 조회
        if (foundCookie == null) {
            mapper.upGoodCount(boardNo);

            //해당 게시물 번호에 해당하는 쿠기가 있는지 확인
            // 쿠키가 없으면 쿠키를 만들어서 클라이언트에게 전송 + 조회수 상승

            Cookie cookie = new Cookie("good" + boardNo, String.valueOf(boardNo)); // 쿠키 생성
            cookie.setMaxAge(60); // 쿠키 수명 ## 테스트용 60초
            cookie.setPath("recboard"); // 쿠키 작동 범위

            response.addCookie(cookie); // 클라이언트에게 쿠키 전송
            log.info("여기까지 오나?");
            return true;
        }

        return false;
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
