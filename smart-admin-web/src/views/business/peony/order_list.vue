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
          <!--<Input placeholder="请选择片区名称" style="width: 180px" v-model="queryForm.stationAreaName"/>-->
          <Select v-model="queryForm.stationAreaName" style="width:200px" @on-change="getSecond">
            <Option v-for="item in mainTable.stationLinkageMenu_1" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
        <span>
          线路名称 :
          <!--<Input placeholder="请选择线路名称" style="width: 180px" v-model="queryForm.stationExpName"/>-->
          <Select v-model="queryForm.stationExpName" style="width:200px" @on-change="getThird">
            <Option v-for="item in mainTable.stationLinkageMenu_2" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
        <span>
          站组名称 :
          <!--<Input placeholder="请选择站组名称" style="width: 180px" v-model="queryForm.stationExpServiceArea"/>-->
          <Select v-model="queryForm.stationExpServiceArea" style="width:200px" @on-change="getFourth">
            <Option v-for="item in mainTable.stationLinkageMenu_3" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
        <span>
          站点名称 :
          <!--<Input placeholder="请选择站点名称" style="width: 180px" v-model="queryForm.stationName"/>-->
          <Select v-model="queryForm.stationName" style="width:200px" >
            <Option v-for="item in mainTable.stationLinkageMenu_4" :value="item.label" :key="item.label">{{ item.label }}</Option>
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
          支付票号 : <Input placeholder="请输入支付票号" style="width: 180px" v-model="queryForm.billNo"/>
        </span>
        <span>
          油品号 :
          <!--<Input placeholder="请选择油品号" style="width: 180px" v-model="queryForm.oilCode"/>-->
          <Select v-model="queryForm.oilCode" style="width:200px" >
            <Option v-for="item in mainTable.oilCodeMenu" :value="item.oilCode" :key="item.oilCode">{{ item.label }}</Option>
          </Select>
        </span>
        <span>
          车牌属地 : <Input placeholder="请选择车牌属地" style="width: 180px" v-model="queryForm.carNumber"/>
        </span>
      </Row>
      <!------ 查询条件第二行 end------->
    </Card>

    <Card class="warp-card">
      <!-------       start------->
      <div style="display: flex; margin-bottom: 10px">
        <div style="width: 20%;  height: 100px; line-height: 100px; font-size:2vw; background-color: darkgrey">
          <span style="margin-left: 10px"> 交易笔数: {{ mainTable.baseData.totalDeal }} </span>
        </div>
        <div style="width: 20%; height: 100px; line-height: 100px; font-size:2vw; margin-left: 10px; background-color: darkseagreen">
          <span style="margin-left: 10px"> 交易匹配数: {{ mainTable.baseData.isMatch }} </span>
        </div>
        <div style="width: 20%; height: 100px; line-height: 100px; font-size:2vw; margin-left: 10px; background-color: darkkhaki">
          <span style="margin-left: 10px"> 匹配率: {{ mainTable.baseData.matchRatio }} % </span>
        </div>
      </div>
      <!-------         end------->
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
import {PAGE_SIZE_OPTIONS} from '@/constants/table-page';
import {oilApi} from '@/api/scjt-oil';
import PeonyListForm from './components/peony-list-form';
import {dateTimeConvert, dateTimeRangeConvert} from "@/lib/util";
import moment from "moment/moment";

const PAGE_SIZE_INIT = 20;
export default {
  name: 'PeonyList',
  components: {
    PeonyListForm
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
        selectTime: null,
        startTime: null,
        endTime: null,
        stationAreaName: null,
        stationExpName: null,
        stationExpServiceArea: null,
        stationName: null,
        billNo: null,
        oilCode: null,
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
        oilCodeMenu: [
          {"oilCode":"0号", "label":"0号"},
          {"oilCode":"92", "label":"92号"},
          {"oilCode":"95", "label":"95号"},
          {"oilCode":"98", "label":"98号"}
        ],
        baseData: {
          "totalDeal": 100,
          "isMatch": 90,
          "matchRatio": "90"
        },
        // 表格数据
        data: [
          {
            "id":1,
            "stationCode": "MB0P",
            "stationAreaName": "川中片区",
            "stationExpName":"巴南高速",
            "stationExpServiceArea":"下八庙加油站",
            "stationName": "下八庙右站",
            "endtime":"2023-02-07 19:20:48",
            "billno":"802433",
            "oilcode":"92号",
            "nozzleno":"3",
            "volume":"36.19",
            "realamount":"7.24",
            "carnumber":"川EF48V5"
          }
        ],
        // 表格列
        columnArray: [
          {
            title: '序号',
            key: 'id',
            align: 'center'
          },
          {
            title: '片区',
            key: 'stationAreaName',
            align: 'center'
          },
          {
            title: '高速线路',
            key: 'stationExpName',
            align: 'center'
          },
          {
            title: '站组',
            key: 'stationExpServiceArea',
            align: 'center'
          },
          {
            title: '站点名称',
            key: 'stationName',
            align: 'center'
          },
          {
            title: '挂枪时间',
            key: 'endtime',
            align: 'center'
          },
          {
            title: '支付票号',
            key: 'billno',
            align: 'center'
          },
          {
            title: '油品号',
            key: 'oilcode',
            align: 'center'
          },
          {
            title: '油枪号',
            key: 'nozzleno',
            align: 'center'
          },
          {
            title: '加油量',
            key: 'volume',
            align: 'center'
          },
          {
            title: '交易金额',
            key: 'realamount',
            align: 'center'
          },
          {
            title: '车牌号',
            key: 'carnumber',
            align: 'center'
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

      let startTime = null; let endTime = null;
      if (this.queryForm.selectTime != null && this.queryForm.selectTime != undefined && this.queryForm.selectTime != ''){
        let selectTime = dateTimeConvert(this.queryForm.selectTime)
        startTime = selectTime;
        let date = new Date(this.queryForm.selectTime);
        endTime = dateTimeConvert(date.setDate(date.getDate() + 1));
      }
      return {
        ...this.queryForm,
        startTime: startTime,
        endTime: endTime
      };
    },
    // 查询
    queryList () {
      this.mainTable.loading = true;
      try {
        this.queryTradeList();
        this.queryMatchRatio();
        this.queryStationCascadingMenu();
      } finally {
        this.mainTable.loading = false;
      }

    },
    async queryTradeList(){
      try {
        let params = this.convertQueryParam();
        let result = await oilApi.getTradeList(params);
        this.mainTable.data = result.data.list;
        this.mainTablePage.total = result.data.total;
      } finally {

      }
    },
    async queryMatchRatio(){
      try {
        let params = this.convertQueryParam();
        let result = await oilApi.getMatchRatio(params);
        this.mainTable.baseData = result.data;
      } finally {

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
        selectTime: null,
        startTime: null,
        endTime: null,
        stationAreaName: null,
        stationExpName: null,
        stationExpServiceArea: null,
        stationName: null,
        billNo: null,
        oilCode: null,
        carNumber: null,
        pageNum: 1,
        pageSize: pageSize,
        orders: []
      };
      this.queryList();
      this.initStationLinkageMenu();
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
