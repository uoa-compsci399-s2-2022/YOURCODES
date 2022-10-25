package com.example.myspringboot.modulers.prloblemcode.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.myspringboot.modulers.prloblemcode.dao.ProblemcodeDao;
import com.example.myspringboot.modulers.prloblemcode.entity.ProblemcodeEntity;
import com.example.myspringboot.modulers.prloblemcode.service.ProblemcodeService;
import com.example.myspringboot.modulers.problams.entity.Sorts;
import com.example.utils.PageUtils;
import com.example.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("problemcodeService")
public class ProblemcodeServiceImpl extends ServiceImpl<ProblemcodeDao, ProblemcodeEntity> implements ProblemcodeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String problemid =(String)  params.get("problemid");
        String user =(String)  params.get("user");
        IPage<ProblemcodeEntity> page = this.page(
                new Query<ProblemcodeEntity>().getPage(params),
                new QueryWrapper<ProblemcodeEntity>().eq("problem",problemid)
        );

        return new PageUtils(page);
    }
    @Override
    public List<Sorts> getSorts(){
       List<Sorts> sorts= this.baseMapper.getproblemsort();
       return sorts;
    }
}
