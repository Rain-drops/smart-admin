package net.lab1024.smartadmin.module.oil.scjt.domain.vo;

import lombok.Data;

/**
 * @author Jackie
 */
@Data
public class CarGrowthAnalyseVO {

    private String stationAreaName;
    private String stationExpName;
    private String stationExpServiceArea;
    private String stationCode;
    private String stationName;

    private CarGrowthAnalyseData thisDayData;
    private CarGrowthAnalyseData monthOnMonthData;
    private CarGrowthAnalyseData yearOnYearData;

    public static class CarGrowthAnalyseData{
        private String day;
        /** 小计 */
        private Integer d_sum = 0;
        /** 汽油小计 */
        private Integer q_sum = 0;
        /**  */
        private Integer oil_92 = 0;
        /**  */
        private Integer oil_95 = 0;
        /**  */
        private Integer oil_98 = 0;
        /**  */
        private Integer q_other = 0;
        /** 柴油小计 */
        private Integer c_sum = 0;
        /**  */
        private Integer oil_0 = 0;
        private Integer c_other = 0;

        public String getDay() {
            return day;
        }

        public void setDay(String day) {
            this.day = day;
        }

        public Integer getD_sum() {
            return d_sum;
        }

        public void setD_sum(Integer d_sum) {
            this.d_sum = d_sum;
        }

        public Integer getQ_sum() {
            return q_sum;
        }

        public void setQ_sum(Integer q_sum) {
            this.q_sum = q_sum;
        }

        public Integer getOil_92() {
            return oil_92;
        }

        public void setOil_92(Integer oil_92) {
            this.oil_92 = oil_92;
        }

        public Integer getOil_95() {
            return oil_95;
        }

        public void setOil_95(Integer oil_95) {
            this.oil_95 = oil_95;
        }

        public Integer getOil_98() {
            return oil_98;
        }

        public void setOil_98(Integer oil_98) {
            this.oil_98 = oil_98;
        }

        public Integer getQ_other() {
            return q_other;
        }

        public void setQ_other(Integer q_other) {
            this.q_other = q_other;
        }

        public Integer getC_sum() {
            return c_sum;
        }

        public void setC_sum(Integer c_sum) {
            this.c_sum = c_sum;
        }

        public Integer getOil_0() {
            return oil_0;
        }

        public void setOil_0(Integer oil_0) {
            this.oil_0 = oil_0;
        }

        public Integer getC_other() {
            return c_other;
        }

        public void setC_other(Integer c_other) {
            this.c_other = c_other;
        }
    }
}
