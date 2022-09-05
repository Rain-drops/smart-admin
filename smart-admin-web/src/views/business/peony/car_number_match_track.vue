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
          <Select v-model="queryForm.stationName" style="width:200px" clearable filterable multiple>
            <Option v-for="item in mainTable.stationLinkageMenu_4" :value="item.label" :key="item.label">{{ item.label }}</Option>
          </Select>
        </span>
        <ButtonGroup>
          <Button @click="queryList" icon="ios-search" type="primary" v-privilege="'peony-list-query'">查询</Button>
          <Button @click="resetQueryList" icon="md-refresh" type="default" v-privilege="'peony-list-query'">重置</Button>
        </ButtonGroup>
      </Row>
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
import { PAGE_SIZE_OPTIONS } from '@/constants/table-page';
import PeonyListForm from './components/peony-list-form';
import {oilApi} from "@/api/scjt-oil";
import {dateTimeConvert} from "@/lib/util";

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
        // ID
        selectTime: null,
        startTime: null,
        endTime: null,
        stationAreaName: null,
        stationExpName: null,
        stationExpServiceArea: null,
        stationName: null,
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
        // 表格数据
        data: [
          {
            "stationCode": "MB0P",
            "stationName": "下八庙右站",
            "totalDeal": "32",
            "isMatch": "25"
          }
        ],
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
            title: '站点编号',
            key: 'stationCode',
            align: 'center'
          },
          {
            title: '站点名称',
            key: 'stationName',
            align: 'center',
            render: (h, params) => {
              return h("span", {
                on: {
                  click: () => {
                    alert("加油站油枪车辆识别情况跟踪")
                  }
                },
                style:{
                  cursor: 'pointer',
                  textDecoration: 'underline'
                }
              }, params.row.stationName);
            }
          },
          {
            title: '交易笔数',
            key: 'totalDeal',
            align: 'center'
          },
          {
            title: '匹配车牌',
            key: 'isMatch',
            align: 'center'
          },
          {
            title: '匹配率',
            key: 'matchRatio',
            align: 'center',
            render: (h, params) => {
              return h("span", {
                on: {
                  click: () => {
                    alert("站点7日匹配情况")
                  }
                },
                style:{
                  cursor: 'pointer',
                  textDecoration: 'underline'
                }
              }, params.row.totalDeal === "0" || params.row.totalDeal === 0 ? 0 :parseFloat(params.row.isMatch/params.row.totalDeal * 100).toFixed(2) + "%");
            }
          },
          {
            title: '车牌矫正',
            key: 'carRevise',
            align: 'center',
            render: (h, params) => {
              return h("span", {
                on: {
                  click: () => {
                    alert("车牌矫正")
                  }
                },
                style:{
                  cursor: 'pointer',
                  textDecoration: 'underline'
                }
              }, '车牌矫正');
            }
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
      this.getMatchTrackList();
      this.queryStationCascadingMenu();
    },
    async getMatchTrackList(){
      this.mainTable.loading = true;
      try {
        let params = this.convertQueryParam();
        let result = await oilApi.getMatchTrackList(params);
        this.mainTable.data = result.data.list;
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
        station_name: null,
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
