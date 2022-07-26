package com.project.horror.community.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.horror.common.paging.Page;
import com.project.horror.community.domain.CommunityBoard;
import com.project.horror.community.domain.CommunityCode;
import com.project.horror.community.domain.CommunityReply;
import com.project.horror.community.domain.CommunitySearch;

import java.util.List;

@Mapper
public interface CommunityMapper {

    // 게시글 쓰기 기능
    boolean save(CommunityBoard communityBoard);

    // 게시글 전체 조회
//    List<Board> findAll(); // mybatis는 같은 이름은 지원하지 않는다 (findAll 2개 불가능)

    // 게시글 전체 조회
    List<CommunityBoard> findAll();

    // 게시글 전체 조회 with paging
    List<CommunityBoard> findAllWithPaging(Page page);

    // 게시글 전체 조회 with searching
    List<CommunityBoard> findAllWithSearch(CommunitySearch search);

    // 게시글 상세 조회
    CommunityBoard findOne(long boardNo);

    // 게시글 수정
    boolean modify(CommunityBoard communityBoard);

    // 게시글 삭제
    boolean remove(long boardNo);

    // 전체 게시물 수 조회
    int getTotalCount();
    int getTotalCountWithSearch(CommunitySearch search); //검색할 때 검색 건수에 따라 밑에 페이징 수 조절을 위해 WHERE 절 추가


    // 조회수 상승 처리
    void upViewCount(Long boardNo);

    // 카테고리 목록 조회
    List<CommunityCode> getCategoryList();

    // 좋아요 상승 처리
    boolean upLikeCount(CommunityBoard communityBoard);

    // 좋아요 이력 생성
    boolean makeLikeHistory(CommunityBoard communityBoard);

    // 좋아요 생성이력 확인
    int checkLikeHistory(CommunityBoard communityBoard);

    // 댓글 등록
    boolean makeReply(CommunityReply communityReply);

    // 댓글 전체 조회
    List<CommunityReply> findAllReply(CommunityReply communityReply);

    // 댓글 상세 조회
    CommunityReply findOneReply(long boardNo, long replyNo);

    // 댓글 삭제
    boolean removeReply(@Param("boardNo") long boardNo, @Param("replyNo") long replyNo);

    // 댓글 수정
    boolean modifyReply(CommunityReply communityReply);
}
