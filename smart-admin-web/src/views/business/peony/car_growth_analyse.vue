<template>
  <div>
    <Card class="smart-query-card">
      <!------ 查询条件第一行 begin------->
      <Row class="smart-query-form-row">
        <span>
          选择时间: <DatePicker placeholder="选择日期" split-panels style="width: 200px" type="date" v-model="queryForm.selectTime"/>
        </span>
        <span>
          片区名称 :
          <Select v-model="queryForm.stationAreaName" style="width:200px" clearable filterable @on-change="getSecond">
            <Option v-for="item in mainTable.stationLinkageMenu_1" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
        <span>
          站组名称 :
          <Select v-model="queryForm.stationExpServiceArea" style="width:200px" clearable filterable @on-change="getFourth">
            <Option v-for="item in mainTable.stationLinkageMenu_3" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
        <span>
          查询类型 :
          <Select v-model="queryForm.growthAnalyseStationType" style="width:200px" clearable filterable>
            <Option value="0" key="0">按片区、站组</Option>
            <Option value="1" key="1">按片区、单站</Option>
          </Select>
        </span>

        <ButtonGroup>
          <Button @click="queryList" icon="ios-search" type="primary" v-privilege="'peony-list-query'">查询</Button>
          <Button @click="resetQueryList" icon="md-refresh" type="default" v-privilege="'peony-list-query'">重置</Button>
        </ButtonGroup>
        <Button
          @click="showMoreQueryConditionFlag = !showMoreQueryConditionFlag"
          icon="md-more"
          style="margin-left: 20px"
          type="primary"
          v-privilege="'peony-list-query'"
        >{{showMoreQueryConditionFlag?'隐藏':'展开'}}</Button>
      </Row>
      <!------ 查询条件第一行 begin------->
      <!------ 查询条件第二行 begin------->
      <Row class="smart-query-form-row" v-show="showMoreQueryConditionFlag">
        <span>
          车牌归属地 :
          <Input v-model="queryForm.carProvince" placeholder="请选择省份" style="width: 180px" clearable filterable />
          ~~
          <Input v-model="queryForm.carCity" placeholder="请选择地区" style="width: 180px" clearable filterable/>
        </span>
        <span>
          车牌号码 : <Input placeholder="请输入车牌号" style="width: 180px" v-model="queryForm.carNumber"/>
        </span>
        <span>
          油品号 :
          <Select v-model="queryForm.oilClass" style="width:200px" clearable filterable>
            <Option v-for="item in mainTable.oilClassMenu" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
          <Select v-model="queryForm.oilCode" style="width:200px" clearable filterable>
            <Option v-for="item in mainTable.oilCodeMenu" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
      </Row>
      <!------ 查询条件第二行 end------->
    </Card>

    <Card class="warp-card">
      <!-------操作按钮行 begin------->
      <Row class="marginBottom10">
        <Button :loading="allExportBtnLoading" @click="exportAll" class="marginLeft10 float-right"
                icon="ios-cloud-download-outline" size="small" type="warning" v-privilege="'peony-list-export-all'">导出全部</Button>
        <Button :loading="batchExportBtnLoading" @click="batchExport" class="marginLeft10 float-right"
                icon="ios-download-outline" size="small" type="warning" v-privilege="'peony-list-batch-export'">批量导出</Button>
      </Row>
      <!-------操作按钮行 end------->

      <!-------表格列表 begin------->
      <Table row-key="id" :columns="mainTable.columnArray" :data="mainTable.data" :loading="mainTable.loading"
             @on-sort-change="handleSortChange" border highlight-row ref="mainTable">
        <template slot-scope="{ row, index }" slot="imageUrl">
          <img width="40" height="40" v-if="index % 2 === 0" src="http:// q8deiydpv.bkt.clouddn.com/image/peony1.jpg"/>
          <img v-if="index % 2 === 1" width="40" height="40" src="http:// q8deiydpv.bkt.clouddn.com/image/peony2.jpg"/>
        </template>
      </Table>

      <Page
        :current="queryForm.pageNum"
        :page-size="queryForm.pageSize"
        :page-size-opts="mainTablePage.pageSizeOps"
        :total="mainTablePage.total"
        @on-change="changeMainTablePagePageNum"
        @on-page-size-change="changeMainTablePagePageSize"
        class="smart-query-table-page"
        show-elevator
        show-sizer
        show-total
      />
    </Card>
    <!-------表格列表 end------->
  </div>
</template>

<script>
import { utils, dateTimeConvert, dateTimeRangeConvert} from '@/lib/util';
import { PAGE_SIZE_OPTIONS } from '@/constants/table-page';
import { oilApi } from '@/api/scjt-oil';
import PeonyListForm from './components/peony-list-form';

const PAGE_SIZE_INIT = 20;
export default {
  name: 'CarGrowthAnalyseList',
  components: {
    PeonyListForm,
  },
  props: {},
  data  () {
    return {
      // 表格多选选中的元素数组
      mainTableSelectArray: [],
      /* -------------------------导出操作------------------------- */
      // 批量导出loading按钮
      batchExportBtnLoading: false,
      // 导出全部loading按钮
      allExportBtnLoading: false,
      /* -------------------------查询条件相关数据-------------------- */
      // 搜索表单
      queryForm: {
        id: null,
        carProvince: null,
        carCity: null,
        stationAreaName: null,
        stationExpName: null,
        stationExpServiceArea: null,
        growthAnalyseStationType: 1,
        carNumber: null,
        oilClass: null,
        oilCode: null,
        selectTime: null,
        selectTimeRange: ['', ''],
        pageNum: 1,
        pageSize: PAGE_SIZE_INIT,
        orders: []
      },
      // 是否展示更多搜索条件
      showMoreQueryConditionFlag: false,
      /*  -------------------------表格相关数据------------------------- */
      // 表格分页
      mainTablePage: {
        total: 0,
        pageSizeOps: PAGE_SIZE_OPTIONS
      },
      // 表格
      mainTable: {
        // 加载中
        loading: false,
        stationLinkageMenu_1:[],
        stationLinkageMenu_2:[],
        stationLinkageMenu_3:[],
        stationLinkageMenu_4:[],
        stationLinkageMenu: {
          "l1": [{"label":"川南"}, {"label":"川北"}],
          "l2": {"川南":[{"label":""}], "川北":[{"label":""}]},
          "l3": {"川南":[{"label":""}], "川北":[{"label":""}]},
          "l4": {"川南":[{"label":""}], "川北":[{"label":""}]}
        },
        oilClassMenu: [
          {"oilClass":"汽油", "label":"汽油"},
          {"oilClass":"柴油", "label":"柴油"}
        ],
        oilCodeMenu: [
          {"oilCode":"92", "label":"92号"},
          {"oilCode":"95", "label":"95号"},
          {"oilCode":"98", "label":"98号"},
          {"oilCode":"0号", "label":"0号"}
        ],
        // 表格数据
        data: [
          {
            "id":1,
            "stationAreaName": "川南片区",
            "stationExpServiceArea": "",
            "stationName": "叙永加油站",
            "increase":0,
            "increaseRate":0,
            "thisDayData": {
              "day": "2022-02-01",
              "d_sum":12,
              "q_sum":15,
              "oil_92":15,
              "oil_95":15,
              "oil_98":15,
              "other":15,
              "c_sum":15,
              "oil_0":16
            },
            "monthOnMonthData": {
              "day": "2022-02-01"
            },
            "yearOnYearData": {
              "day": "2022-02-01"
            }
          }
        ],
        // 表格列
        columnArray: [
          {
            title: '片区',
            key: 'stationAreaName',
            align: 'center',
            width: 100
          },
          {
            title: '站组',
            key: 'stationExpServiceArea',
            align: 'center',
            width: 100,
          },
          {
            title: '站点',
            key: 'stationName',
            align: 'center',
            width: 100
          },
          {
            title: '当天',
            align: 'center',
            renderHeader: (h, params) => {
              return h('span', { style: { color: '#0e0e0e' } }, utils.getDate(this.queryForm.selectTime, 'YMD'));
            },
            children: [
              {
                title: '小计',
                key: 'this_day_data.d_sum',
                align: 'center',
                width: 100,
                render:(h, params) =>{
                  return h("span", {}, params.row.thisDayData.d_sum);
                }
              },
              {
                title: '汽油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'this_day_data.q_sum',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.thisDayData.q_sum);
                    }
                  },
                  {
                    title: '92#',
                    key: 'this_day_data.oil_92',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.thisDayData.oil_92);
                    }
                  },
                  {
                    title: '95#',
                    key: '95',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.thisDayData.oil_95);
                    }
                  },
                  {
                    title: '98#',
                    key: '98',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.thisDayData.oil_98);
                    }
                  }
                ]
              },
              {
                title: '柴油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'c_sum',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.thisDayData.c_sum);
                    }
                  },
                  {
                    title: '0#',
                    key: 'this_day_data.oil_0',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.thisDayData.oil_0);
                    }
                  }
                ]
              }
            ]
          },
          {
            title: '环比',
            key: 'month_on_month',
            align: 'center',
            renderHeader: (h, params) => {
              return h('span', { style: { color: '#0e0e0e' } }, utils.getDateAddMonthStr(this.queryForm.selectTime, -1,'YMD'));
            },
            children: [
              {
                title: '小计',
                key: 'd_sum',
                align: 'center',
                width: 80,
                render:(h, params) =>{
                  return h("span", {}, params.row.monthOnMonthData.d_sum);
                }
              },
              {
                title: '汽油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'q_sum',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.monthOnMonthData.q_sum);
                    }
                  },
                  {
                    title: '92#',
                    key: '92',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.monthOnMonthData.oil_92);
                    }
                  },
                  {
                    title: '95#',
                    key: '95',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.monthOnMonthData.oil_95);
                    }
                  },
                  {
                    title: '98#',
                    key: '98',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.monthOnMonthData.oil_98);
                    }
                  }
                ]
              },
              {
                title: '柴油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'c_sum',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.monthOnMonthData.c_sum);
                    }
                  },
                  {
                    title: '0#',
                    key: '0',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.monthOnMonthData.oil_0);
                    }
                  }
                ]
              }
            ]
          },
          {
            title: '同比',
            key: 'year_on_year',
            align: 'center',
            renderHeader: (h, params) => {
              return h('span', { style: { color: '#0e0e0e' } }, utils.getDateAddMonthStr(this.queryForm.selectTime, -12,'YMD'));
            },
            children: [
              {
                title: '小计',
                key: 'd_sum',
                align: 'center',
                width: 80,
                render:(h, params) =>{
                  return h("span", {}, params.row.yearOnYearData.d_sum);
                }
              },
              {
                title: '汽油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'q_sum',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.yearOnYearData.q_sum);
                    }
                  },
                  {
                    title: '92#',
                    key: '92',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.yearOnYearData.oil_92);
                    }
                  },
                  {
                    title: '95#',
                    key: '95',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.yearOnYearData.oil_95);
                    }
                  },
                  {
                    title: '98#',
                    key: '98',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.yearOnYearData.oil_98);
                    }
                  }
                ]
              },
              {
                title: '柴油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'c_sum',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.yearOnYearData.c_sum);
                    }
                  },
                  {
                    title: '0#',
                    key: '0',
                    align: 'center',
                    width: 80,
                    render:(h, params) =>{
                      return h("span", {}, params.row.yearOnYearData.oil_0);
                    }
                  }
                ]
              }
            ]
          },
          {
            title: '增(减)量',
            key: 'increase',
            align: 'center',
            width: 100,
            render:(h, params) =>{
              return h("span", {}, params.row.increase);
            }
          },
          {
            title: '增(减)幅',
            key: 'increase_rate',
            align: 'center',
            width: 100,
            render:(h, params) =>{
              return h("span", {}, params.row.increase_rate);
            }
          }
        ]
      }
    };
  },
  computed: {},
  watch: {},
  filters: {},
  created () {
  },
  mounted () {
    this.queryStationCascadingMenu();
    this.queryList();
  },
  beforeCreate () {
  },
  beforeMount () {
  },
  beforeUpdate () {
  },
  updated () {
  },
  beforeDestroy () {
  },
  destroyed () {
  },
  activated () {
  },
  methods: {
    /* -------------------------查询相关 begin------------------------- */
    convertQueryParam () {
      let selectTime = null;
      if (this.queryForm.selectTime != null && this.queryForm.selectTime != undefined && this.queryForm.selectTime != ''){
        selectTime = dateTimeConvert(this.queryForm.selectTime);
      } else {
        this.queryForm.selectTime = dateTimeConvert(new Date());
        selectTime = dateTimeConvert(new Date());
      }
      let carNumber = '';
      if (this.queryForm.carProvince != null && this.queryForm.carProvince != undefined && this.queryForm.carProvince != '') {
        carNumber = this.queryForm.carProvince;
      }
      if (this.queryForm.carCity != null && this.queryForm.carCity != undefined && this.queryForm.carCity != '') {
        carNumber += this.queryForm.carCity;
      }
      if (this.queryForm.carNumber != null && this.queryForm.carNumber != undefined && this.queryForm.carNumber != '') {
        carNumber = this.queryForm.carNumber;
      }

      return {
        ...this.queryForm,
        startTime: selectTime,
        endTime: selectTime,
        carNumber: carNumber,
        pageNum: 1,
        pageSize: 100000
      };
    },
    // 查询
    async queryList () {
      let t = this;
      this.mainTable.loading = true;
      try {
        let params = this.convertQueryParam();
        let result = await oilApi.getGrowthAnalyseByPage(params);

        let data = result.data.list;
        data.forEach(function (a, n){
          let this_day_d_sum = a.thisDayData.d_sum;
          let year_on_year_d_sum = a.yearOnYearData.d_sum;
          let month_on_month_d_sum = a.monthOnMonthData.d_sum;
          if (undefined === this_day_d_sum || null === this_day_d_sum || '' === this_day_d_sum){
            this_day_d_sum = 0;
          }
          if (undefined === year_on_year_d_sum || null === year_on_year_d_sum || '' === year_on_year_d_sum){
            year_on_year_d_sum = 0;
          }
          if (undefined === month_on_month_d_sum || null === month_on_month_d_sum || '' === month_on_month_d_sum){
            month_on_month_d_sum = 0;
          }
          if (year_on_year_d_sum === 0){
            data[n].increase_rate = "0%";
          }else {
            data[n].increase_rate = parseFloat((this_day_d_sum - year_on_year_d_sum) / year_on_year_d_sum * 100).toFixed(2) + "%"
          }
          data[n].increase = a.thisDayData.d_sum - a.yearOnYearData.d_sum
        })

        this.mainTable.data = data;
        this.mainTablePage.total = result.data.total;
      } finally {
        this.mainTable.loading = false;
      }
    },
    async queryStationCascadingMenu(){
      try {
        let param = { pageNum: 1, pageSize: 10000 };
        let result = await oilApi.getStationLinkageMenu(param);
        this.mainTable.stationLinkageMenu = result.data;
        this.initStationLinkageMenu();
      } finally {
      }
    },
    initStationLinkageMenu(){
      let t = this;
      let menu = this.mainTable.stationLinkageMenu;
      this.mainTable.stationLinkageMenu_1 = menu.l1

      let l2 = [];
      Object.entries(menu.l2).forEach(function (item, i){
        item[1].forEach(function (item1, i1){
          l2.push(item1)
        })
      })
      this.mainTable.stationLinkageMenu_2 = l2;

      let l3 = [];
      Object.entries(menu.l3).forEach(function (item, i){
        item[1].forEach(function (item1, i1){
          l3.push(item1)
        })
      })
      this.mainTable.stationLinkageMenu_3 = l3;

      let l4 = [];
      Object.entries(menu.l4).forEach(function (item, i){
        item[1].forEach(function (item1, i1){
          l4.push(item1)
        })
      })
      this.mainTable.stationLinkageMenu_4 = l4;
    },
    getSecond (val) {
      this.mainTable.stationLinkageMenu_2 = this.mainTable.stationLinkageMenu.l2[val]
    },
    getThird (val) {
      this.mainTable.stationLinkageMenu_3 = this.mainTable.stationLinkageMenu.l3[val]
    },
    getFourth (val) {
      this.mainTable.stationLinkageMenu_4 = this.mainTable.stationLinkageMenu.l4[val]
    },
    // 重置查询
    resetQueryList () {
      let pageSize = this.queryForm.pageSize;
      this.queryForm = {
        id: null,
        kind: null,
        name: null,
        color: null,
        pageNum: 1,
        pageSize: pageSize,
        orders: []
      };
      this.queryList();
    },
    // 修改页码
    changeMainTablePagePageNum (pageNum) {
      this.queryForm.pageNum = pageNum;
      this.queryList();
    },
    // 修改页大小
    changeMainTablePagePageSize (pageSize) {
      this.queryForm.pageNum = 1;
      this.queryForm.pageSize = pageSize;
      this.queryList();
    },
    // 处理排序
    handleSortChange (column) {
      if (column.order === 'normal') {
        this.queryForm.orders = [];
      } else {
        this.queryForm.orders = [
          {
            column: column.column.tableColumn,
            asc: column.order === 'asc'
          }
        ];
      }
      this.queryList();
    },
    /* -------------------------查询相关 end------------------------- */
    // 清空选中
    clearMainTableSelection () {
      this.mainTableSelectArray = [];
    },
    // 校验是否有选中
    validateMainTableSelection () {
      this.mainTableSelectArray = this.$refs.mainTable.getSelection();
      if (this.mainTableSelectArray.length < 1) {
        this.$Message.error('请选择至少一条数据');
        return false;
      }
      return true;
    },
    /* -------------------------批量操作 end------------------------- */

    /* -------------------------导入导出 begin------------------------- */
    // 导出全部
    async exportAll () {
      try {
        this.allExportBtnLoading = true;
        let params = this.convertQueryParam();
        await oilApi.exportAll(params);
      } catch (e) {
        console.log(e);
      } finally {
        this.allExportBtnLoading = false;
      }
    },
    // 批量导出
    async batchExport () {
      if (!this.validateMainTableSelection()) {
        return;
      }
      try {
        this.batchExportBtnLoading = true;
        await oilApi.batchExport(this.mainTableSelectArray.map(e => e.id));
      } catch (e) {
        console.log(e);
      } finally {
        this.batchExportBtnLoading = false;
      }
    },
    /* -------------------------导入导出 end------------------------- */
  }
};
</script>
<style scoped>
>>>.ivu-table-overflowX {
  overflow-x: scroll !important;
}
.ivu-table .mergeData {
  border-right: 0;
}

/deep/ input::-webkit-outer-spin-button,
/deep/ input::-webkit-inner-spin-button {
  -webkit-appearance: none;
}
</style>
