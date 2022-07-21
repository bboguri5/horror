package com.project.horror.service;

import com.project.horror.horrorSpotBoard.domain.Spot;
import com.project.horror.repository.HorrorSpotMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HorrorSpotService {
    private final HorrorSpotMapper spotMapper;

    public List<Spot> selectAll()
    {
        return spotMapper.selectAll();
    }

    public Spot selectOne(int spotNo)
    {
        return spotMapper.selectOne();
    }
}
