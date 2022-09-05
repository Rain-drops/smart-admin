package net.lab1024.smartadmin.module.oil.scjt.domain.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  [ 牡丹花 ]
 *
 * @author 卓大
 * @version 1.0
 * @company 1024创新实验室( www.1024lab.net )
 * @copyright (c) 1024创新实验室( www.1024lab.net )Inc. All rights reserved.
 * @date  2020-04-06 18:17:56
 * @since JDK1.8
 */
@Data
public class StationLinkageMenuVO {

    private List<MenuVo> l1;
    private Map<String, List<MenuVo>> l2;
    private Map<String, List<MenuVo>> l3;
    private Map<String, List<MenuVo>> l4;

    public static class MenuVo{
        private String label;

        public MenuVo() {}

        public MenuVo(String label) {
            this.label = label;
        }

        public String getLabel() {
            return label;
        }

        public void setLabel(String label) {
            this.label = label;
        }
    }
}
