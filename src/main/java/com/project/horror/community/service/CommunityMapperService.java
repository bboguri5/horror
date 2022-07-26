package com.project.horror.community.service;

import com.project.horror.common.paging.Page;
import com.project.horror.community.domain.CommunityBoard;
import com.project.horror.community.domain.CommunityCode;
import com.project.horror.community.domain.CommunityReply;
import com.project.horror.community.domain.CommunitySearch;
import com.project.horror.community.repository.CommunityMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
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

@Service
@Log4j2
@RequiredArgsConstructor
public class CommunityMapperService {

    private final CommunityMapper mapper;

    // 게시물 등록 요청 중간 처리
    public boolean saveService(CommunityBoard communityBoard) {
        log.info("save service start - {}", communityBoard);
        return mapper.save(communityBoard);
    }

    // 게시물 전체 조회 요청 중간 처리
    public List<CommunityBoard> findAllService() {
        log.info("findAll service start");
        List<CommunityBoard> communityBoardList = mapper.findAll();

        // 목록 중간 데이터 처리
        processConverting(communityBoardList);

        return communityBoardList;
    }

    private void processConverting(List<CommunityBoard> communityBoardList) {
        for (CommunityBoard b : communityBoardList) {
            convertDateFormat(b);
            substringTitle(b);
            checkNewArticle(b);
        }
    }

    private void checkNewArticle(CommunityBoard b) {

        // 게시물의 작성일자와 현재 시간을 대조

        // 게시물의 작성일자 가져오기 16억 5초
        long regDateTime = b.getRegDate().getTime();

        // 현재 시간 얻기 (밀리초) 16억 10초
        long nowTime = System.currentTimeMillis();

        // 현재 시간 - 작성 시간
        long diff = nowTime - regDateTime;

        // 신규 게시물 제한 시간
        long limitTime = 60 * 5 * 1000; // 5분

        if (diff < limitTime) {
            b.setNewArticle(true);
        }
    }

    private void convertDateFormat(CommunityBoard b) {
        Date date = b.getRegDate();

        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd a hh:mm"); // pattern을 쓰면 원하는 형태로 바뀐다
        // hh : 1 - 12시간 , HH : 24시간으로 표기
        b.setPrettierDate(sdf.format(date));
    }

    private void substringTitle(CommunityBoard b) {
        // 만약에 글제목이 5글자 이상이라면 5글자만 보여주고 나머지는 ...처리
        String title = b.getTitle();

        if (title.length() > 20) {
            String subStr = title.substring(0, 20);
            b.setShortTitle(subStr + "...");
        } else {
            b.setShortTitle(title);
        }
    }

    // 게시물 전체 조회 요청 중간 처리 with paging
    public Map<String, Object> findAllWithPagingService(Page page) {
        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<CommunityBoard> communityBoardList = mapper.findAllWithPaging(page);

        // 목록 중간 데이터 처리
        processConverting(communityBoardList);

        findDataMap.put("bList", communityBoardList);
        findDataMap.put("tc", mapper.getTotalCount());

        return findDataMap;
    }

    // 게시물 전체 조회 요청 중간 처리 with searching
    public Map<String, Object> findAllWithSearchService(CommunitySearch search) {
        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<CommunityBoard> communityBoardList = mapper.findAllWithSearch(search);

        List<CommunityCode> categoryList = mapper.getCategoryList();

        // 목록 중간 데이터 처리
        processConverting(communityBoardList);

        findDataMap.put("bList", communityBoardList);
        findDataMap.put("tc", mapper.getTotalCountWithSearch(search));
        findDataMap.put("ctgrList", categoryList);

        return findDataMap;
    }

    // 게시물 상세 조회 요청 중간 처리
    @Transactional
    public CommunityBoard findOneService(Long boardNo, HttpServletResponse response, HttpServletRequest request) {
        // HttpServletResponse - 쿠키를 만들어서 클라이언트에 전송하기위해 필요
        log.info("findOne service start - {}", boardNo);

        // 트랜잭션 처리 - 동시에 일어나야 한다
        // 상세보기는 뜨지 않는데 조회수가 올라가면 안된다, 반대의 경우도 마찬가지
        CommunityBoard communityBoard = mapper.findOne(boardNo);

        // 해당 게시물 번호에 해당하는 쿠키가 있는지 확인
        // 쿠키가 없으면 조회수를 상승시켜주고, 쿠키를 만들어서 클라이언트에 전송
        makeViewCount(boardNo, response, request);

        return communityBoard;
    }

    private void makeViewCount(Long boardNo, HttpServletResponse response, HttpServletRequest request) {

        // 쿠키를 조회 - 해당 이름의 쿠키가 있으면 쿠키가 들어오고 없으면 null이 들어옴
        Cookie foundCookie = WebUtils.getCookie(request, "b" + boardNo);

        if (foundCookie == null) {
            mapper.upViewCount(boardNo);

//        new Cookie("쿠키이름", "쿠키값"); // 쿠키 생성
            Cookie cookie = new Cookie("b" + boardNo, String.valueOf(boardNo)); // 쿠키 생성
            cookie.setMaxAge(60);                                                     // 쿠키 수명 설정 (60초)
            cookie.setPath("/horror/community/content");                              // 쿠키 작동 범위

            response.addCookie(cookie);                                               // 클라이언트에 쿠키 전송
        }
    }

    // 게시물 삭제 요청 중간 처리
    public boolean removeService(Long boardNo) {
        log.info("remove service start - {}", boardNo);
        return mapper.remove(boardNo);
    }

    // 게시물 수정 요청 중간 처리
    public boolean modifyService(CommunityBoard communityBoard) {
        log.info("modify service start - {}", communityBoard);
        return mapper.modify(communityBoard);
    }

    public List<CommunityCode> getCategoryListService() {
        return mapper.getCategoryList();
    }

    // 좋아요 상승 처리
    public boolean upLikeCountService(CommunityBoard communityBoard) {
        log.info("upLikeCount service start - {}", communityBoard);
        return mapper.upLikeCount(communityBoard);
    }

    // 좋아요 이력 생성
    public boolean makeLikeHistoryService(CommunityBoard communityBoard) {
        log.info("makeLikeHistory service start - {}", communityBoard);
        return mapper.makeLikeHistory(communityBoard);
    }

    // 좋아요 생성이력 확인
    public int checkLikeHistoryService(CommunityBoard communityBoard) {
        log.info("checkLikeHistory service start - {}", communityBoard);
        return mapper.checkLikeHistory(communityBoard);
    }

    // 댓글 등록
    public boolean makeReplyService(CommunityReply communityReply) {
        log.info("makeReply service start - {}", communityReply);
        return mapper.makeReply(communityReply);
    }

    // 댓글 전체 조회
    public List<CommunityReply> findAllReplyService(CommunityReply communityReply) {
        return mapper.findAllReply(communityReply);
    }

    // 댓글 상세 조회
    public CommunityReply findOneReplyService(Long boardNo, Long reply_no) {
        log.info("findOneReply service start - boardNo: {}, reply: {}", boardNo, reply_no);

        CommunityReply communityReply = mapper.findOneReply(boardNo, reply_no);

        return communityReply;
    }

    // 댓글 삭제
    public boolean removeReplyService(Long boardNo, Long replyNo) {
        log.info("removeReply service start - {}", boardNo + " " + replyNo);
        return mapper.removeReply(boardNo, replyNo);
    }

    // 댓글 수정
    public boolean modifyReplyService(CommunityReply communityReply) {
        log.info("modifyReply service start - {}", communityReply);
        return mapper.modifyReply(communityReply);
    }
}
