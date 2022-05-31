package Project.Dao;

import Project.Dto.ProjectDetailVO;
import Project.Dto.ProjectVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import javax.naming.Name;
import java.util.List;

@Repository
public class ProjectDaoImpl implements ProjectDao{


    @Inject
    private SqlSession sqlSession;

    private static final String Namespace = "com.mark.mappers.ProjectMapper";

    @Override
    public List<ProjectVO> selectProject() {
        return sqlSession.selectList(Namespace + ".selectProject");
    }

    @Override
    public List<ProjectDetailVO> selectProject_detail(int prj_num) {
        return sqlSession.selectList(Namespace + ".selectProject_detail",prj_num);
    }

    @Override
    public List<ProjectDetailVO> selectProject_detailPL(ProjectVO projectVO) {
        return sqlSession.selectList(Namespace + ".selectProject_detailPL",projectVO);
    }

    @Override
    public ProjectVO selectProjectNum(String prj_name){
        return sqlSession.selectOne(Namespace+".selectProjectNum",prj_name);
    }

    @Override
    public String insertProject(ProjectVO projectVo) {
        return sqlSession.insert(Namespace + ".insertProject",projectVo)+"";
    }

    @Override
    public String insertProject_detail(ProjectDetailVO projectDetailVO) {
        return sqlSession.insert(Namespace + ".insertProject_detail",projectDetailVO)+"";
    }

    @Override
    public List<ProjectVO> projectVOList(Object object) {
        return sqlSession.selectList(Namespace +".projectVOList", object);
    }

    @Override
    public String updateProject(ProjectVO projectVo) {

        //Ibatis Update 사용법
        return sqlSession.update(Namespace+".updateProject",projectVo)+"";
    }

    @Override
    public ProjectVO selectproject_list(String prj_name) {
        return sqlSession.selectOne(Namespace+".selectproject_list",prj_name);
    }

    @Override
    public ProjectVO selectproject_list2(Object object) {
        return sqlSession.selectOne(Namespace+".selectproject_list2",object);
    }

    @Override
    public ProjectVO viewProject(int prj_num) {

        //Ibatis Update 사용법
        return sqlSession.selectOne(Namespace+".viewProject",prj_num);
    }

    public int delete(int prj_num) {

        //Ibatis Update 사용법
        return sqlSession.delete(Namespace+".delete",prj_num);
    }

    @Override
    public int deleteAllProject_detail(int prj_num) {
        return sqlSession.delete(Namespace+".deleteAllProject_detail",prj_num);
    }

    @Override
    public int deleteProject_detail(ProjectDetailVO projectVO) {
        return sqlSession.delete(Namespace+".deleteProject_detail",projectVO);
    }

    @Override
    public String selectFirstProjectName() {
        return sqlSession.selectOne(Namespace + ".selectFirstProjectName");
    }

    @Override
    public List<ProjectDetailVO> countcus(Object object) {
        return sqlSession.selectOne(Namespace+".count_cus",object);
    }

    @Override
    public List<ProjectVO> selectPL(){return sqlSession.selectList(Namespace+".selectPL");}
}
