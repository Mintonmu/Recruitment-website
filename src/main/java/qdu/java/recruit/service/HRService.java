package qdu.java.recruit.service;

import qdu.java.recruit.entity.HREntity;

public interface HRService {

    HREntity getHR(int hrId);

    boolean updateHR(HREntity HREntity);

    boolean registerHR(HREntity HREntity);

    boolean loginHR(String username, String password);

    HREntity getHRByMobile(String hrMobile);

    HREntity getHRByName(String hrName);
}
