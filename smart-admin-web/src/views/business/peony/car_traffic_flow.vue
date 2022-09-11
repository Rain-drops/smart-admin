<template>
  <div>
    <Card class="smart-query-card">
      <!------ 查询条件第一行 begin------->
      <Row class="smart-query-form-row">
        <span>
          维度：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <RadioGroup v-model="queryForm.chartRadioType" @on-change="changeChartRadio()">
            <Radio label="1">时间</Radio>
            <Radio label="2">车牌归属地</Radio>
          </RadioGroup>
        </span>
        <span>&nbsp;&nbsp;&nbsp;</span>
        <span>
          时间区间 :
          <DatePicker placeholder="选择日期" split-panels style="width: 200px" type="daterange" v-model="queryForm.selectTimeRange"/>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <RadioGroup v-model="queryForm.timeRadioType" @on-change="changeTimeRadio()">
            <Radio label="1">年</Radio>
            <Radio label="2">月</Radio>
          </RadioGroup>
        </span>
        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
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
      <Row class="smart-query-form-row">
        <span>
          片区名称 :
          <Select v-model="queryForm.stationAreaName" style="width:200px" clearable filterable @on-change="getSecond">
            <Option v-for="item in mainTable.stationLinkageMenu_1" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
        <span>
          线路名称 :
          <Select v-model="queryForm.stationExpName" style="width:200px" clearable filterable @on-change="getThird">
            <Option v-for="item in mainTable.stationLinkageMenu_2" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
        <span>
          站组名称 :
          <Select v-model="queryForm.stationExpServiceArea" style="width:200px" clearable filterable @on-change="getFourth">
            <Option v-for="item in mainTable.stationLinkageMenu_3" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
        <span>
          站点名称 :
          <Select v-model="queryForm.stationName" style="width:200px" clearable filterable>
            <Option v-for="item in mainTable.stationLinkageMenu_4" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
      </Row>
      <!------ 查询条件第二行 begin------->
      <Row class="smart-query-form-row" v-show="showMoreQueryConditionFlag">
        <span>
          车牌归属地 :
          <Input v-model="queryForm.carProvince" placeholder="请选择省份" style="width: 180px" clearable filterable />
          ~~
          <Input v-model="queryForm.carCity" placeholder="请选择地区" style="width: 180px" clearable filterable/>
        </span>
        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <span>
          车牌号码 : <Input placeholder="请输入车牌号" style="width: 180px" v-model="queryForm.carNumber"/>
        </span>
        <span>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          油&nbsp;&nbsp;品&nbsp;&nbsp;号:
          <Select v-model="queryForm.oilClass" style="width:100px" clearable filterable>
            <Option v-for="item in mainTable.oilClassMenu" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
          <Select v-model="queryForm.oilCode" style="width:100px" clearable filterable>
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

      <!--      -->
      <div v-if="isLineChart" style="margin-top: 18px; margin-bottom: 10px">
        <HomeCard desc="" title="">
          <ChartLine ref="lineChartMR" :value="mainTable.lineChartData" />
        </HomeCard>
      </div>
      <div v-else style="margin-top: 18px; margin-bottom: 10px">
        <HomeCard desc="" title="">
          <ChartBar ref="barChartMR" :value="mainTable.barChartData" />
        </HomeCard>
      </div>
      <!--      -->
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
import HomeCard from './components/card';
import ChartLine from './components/chart-line';
import ChartBar from './components/chart-bar';
import { PAGE_SIZE_OPTIONS } from '@/constants/table-page';
import PeonyListForm from './components/peony-list-form';
import { oilApi } from "@/api/scjt-oil";
import {dateTimeConvert, dateTimeRangeConvert, on, utils} from "@/lib/util";

const PAGE_SIZE_INIT = 20;
export default {
  name: 'CarTrafficFlowList',
  components: {
    PeonyListForm,
    HomeCard,
    ChartLine,
    ChartBar
  },
  props: {},
  data  () {
    return {
      // 7日匹配率折线图
      isLineChart: true,
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
        // 1-时间; 2-车牌归属地
        chartRadioType: "1",
        timeRadioType: "2",
        carAttributionType: "1",
        selectTimeRange: ['', ''],
        startTime: null,
        endTime: null,
        stationAreaName: null,
        stationExpName: null,
        stationExpServiceArea: null,
        stationName: null,
        carProvince: null,
        carCity: null,
        carNumber: null,
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
        data: [],
        lineChartData: {},
        barChartData: {},
        // 表格列
        columnArray: [
          {
            title: '序号',
            align: 'center',
            render: (h, params) => {
              return h("span", {}, params.index + 1)
            }
          },
          {
            title: '日期',
            key: 'endtime',
            align: 'center'
          },
          {
            title: '片区',
            key: 'stationAreaName',
            align: 'center'
          },
          {
            title: '加油站',
            key: 'stationName',
            align: 'center'
          },
          {
            title: '油品类别',
            key: 'oilclass',
            align: 'center'
          },
          {
            title: '车牌',
            key: 'carnumber',
            align: 'center'
          },
          {
            title: '交易笔数',
            key: 'totalDeal',
            align: 'center'
          }
        ]
      }
    };
  },
  computed: {
    // f_data: function() {
    //   let t = this, data = this.mainTable.data;
    //   return data.forEach(function(item, i) {
    //     data[i].matchRatio =  parseFloat(item.isMatch / item.totalDeal).toFixed(2)
    //   }), data
    // }
  },
  watch: {},
  filters: {},
  created () {
  },
  mounted () {
    this.initSelectTime();
    this.queryStationCascadingMenu();
    this.queryList();
  },
  beforeCreate () {},
  beforeMount () {},
  beforeUpdate () {},
  updated () {},
  beforeDestroy () {},
  destroyed () {},
  activated () {},
  methods: {
    /* -------------------------查询相关 begin------------------------- */
    convertQueryParam () {
      let startTime = null; let endTime = null;
      let timeRange = dateTimeRangeConvert(this.queryForm.selectTimeRange);
      if (timeRange != null && timeRange != undefined) {
        startTime = timeRange[0];
        endTime = timeRange[1];
      }else {
        startTime = dateTimeConvert(new Date());
        endTime = startTime;
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
        startTime: startTime,
        endTime: endTime,
        carNumber : carNumber
      };
    },
    // 查询
    queryList () {
      this.getCarTrafficFlowChart();
    },
    async getCarTrafficFlowChart(){
      this.mainTable.loading = true;
      try {
        let params = this.convertQueryParam();
        let result = await oilApi.getCarTrafficFlowChart(params);

        this.makeTableData(result);
        this.makeChartData(result);
      } finally {
        this.mainTable.loading = false;
      }
    },
    makeTableData (result) {
      let t = this;
      let e = result.data.tableData;
      this.mainTablePage.total = result.data.total;
      e.forEach(function (a, n) {
        if ((t.queryForm.oilClass === undefined || t.queryForm.oilClass === null || t.queryForm.oilClass === '')
          && (t.queryForm.oilCode === undefined || t.queryForm.oilCode === null || t.queryForm.oilCode === '')){
          e[n].oilclass = "全部";
        }else if (t.queryForm.oilClass === undefined || t.queryForm.oilClass === null || t.queryForm.oilClass === ''){
          e[n].oilclass = a.oilcode;
        }else if (t.queryForm.oilCode === undefined || t.queryForm.oilCode === null || t.queryForm.oilCode === ''){
          e[n].oilclass = a.oilclass;
        }else {
          e[n].oilclass = a.oilclass + "--" + a.oilcode;
        }

        let carNumber = '全部';
        if (t.queryForm.carProvince != null && t.queryForm.carProvince != undefined && t.queryForm.carProvince != '') {
          carNumber = t.queryForm.carProvince;
        }
        if (t.queryForm.carCity != null && t.queryForm.carCity != undefined && t.queryForm.carCity != '') {
          carNumber += t.queryForm.carCity;
        }
        if (t.queryForm.carNumber != null && t.queryForm.carNumber != undefined && t.queryForm.carNumber != '') {
          carNumber = t.queryForm.carNumber;
        }
        e[n].carnumber = carNumber
        if (a.endtime === null || a.endtime === undefined && a.endtime === '') {
          e[n].endtime = utils.getDate(new Date(t.queryForm.startTime), 'YMD') + " ~~ " + utils.getDate(new Date(t.queryForm.endTime), 'YMD');
        }
      })

      this.mainTable.data = e;
    },
    makeChartData (result) {
      let t = this; let e = result.data;
      if (t.queryForm.chartRadioType === "1"){
        t.mainTable.lineChartData = e.lineData;
        on(window, 'resize', this.$refs.lineChartMR.resize());
      }
      if (t.queryForm.chartRadioType === "2"){
        t.mainTable.barChartData = e.barData;
        on(window, 'resize', this.$refs.barChartMR.resize());
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
    async getCarTrafficFlowByPage(stationCode){
      let t = this;
      try {
        let param = this.convertQueryParam();
        param.endTime = dateTimeConvert(new Date())
        param.pageNum = 1;
        param.pageSize = 10000;
        param.stationCode = stationCode;
        let result = await oilApi.getCarTrafficFlowByPage(param);
        let carTrafficFlowData = {};
        result.data.list.forEach(function (a, n){
          carTrafficFlowData[a.endtime] = a.totalDeal === "0" || a.totalDeal === 0 ? 0 : parseFloat(a.isMatch/a.totalDeal * 100).toFixed(2);
        })
        t.mainTable.carTrafficFlowData = carTrafficFlowData;
        on(window, 'resize', this.$refs.lineChartMR.resize());
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
    changeChartRadio(){
      if (this.queryForm.chartRadioType === "1"){
        this.isLineChart = true
        if (this.mainTable.lineChartData === undefined || this.mainTable.lineChartData === null || Object.keys(this.mainTable.lineChartData).length === 0){
          this.queryList();
        }
      }else {
        this.isLineChart = false
        if (this.mainTable.barChartData === undefined || this.mainTable.barChartData === null || Object.keys(this.mainTable.barChartData).length === 0){
          this.queryList();
        }
      }
    },
    changeTimeRadio(){},
    // 重置查询
    resetQueryList () {
      let pageSize = this.queryForm.pageSize;
      this.queryForm = {
        stationName: null,
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
      } finally {
        this.batchExportBtnLoading = false;
      }
    },
    /* -------------------------导入导出 end------------------------- */
    lookCarNumberRevise(params){
      this.$router.push({name:"CarNumberReviseList", query:{stationCode: params.stationCode}})
    },
    lookNozzleNoMatchTrack(params){
      this.$router.push({name:"NozzleNoMatchTrackList", query:{stationCode: params.stationCode}})
    },
    initSelectTime () {
      let startTime = utils.getDateAddMonthStr(new Date(), -6, 'YMD');
      let endTime = utils.getDateAddMonthStr(new Date(), 0, 'YMD')
      this.queryForm.startTime = startTime;
      this.queryForm.endTime = endTime;
      this.queryForm.selectTimeRange = [startTime, endTime]
    }
  }
};
</script>
