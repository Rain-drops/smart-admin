<template>
  <div>
    <Card class="smart-query-card">
      <!------ 查询条件第一行 begin------->
      <Row class="smart-query-form-row">
        <span>
          选择时间: <DatePicker placeholder="选择日期" split-panels style="width: 200px" type="date" v-model="queryForm.selectTime"/>
        </span>
        <span>
          出入次数 :
          <Input placeholder="请选择片区名称" style="width: 180px" v-model="queryForm.id"/>
          ~~
          <Input placeholder="请选择片区名称" style="width: 180px" v-model="queryForm.id"/>
        </span>
        <span>
          车牌归属地 :
          <Input placeholder="请选择省份" style="width: 180px" v-model="queryForm.kind"/>
          ~~
          <Input placeholder="请选择地区" style="width: 180px" v-model="queryForm.kind"/>
        </span>
        <span>
          车牌号 : <Input placeholder="请输入车牌号" style="width: 180px" v-model="queryForm.name"/>
        </span>

        <ButtonGroup>
          <Button @click="queryList" icon="ios-search" type="primary" v-privilege="'peony-list-query'">查询</Button>
          <Button @click="resetQueryList" icon="md-refresh" type="default" v-privilege="'peony-list-query'">重置</Button>
        </ButtonGroup>
      </Row>
      <!------ 查询条件第一行 begin------->

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
import { dateTimeRangeConvert } from '@/lib/util';
import { PAGE_SIZE_OPTIONS } from '@/constants/table-page';
import { peonyApi } from '@/api/peony';
import PeonyListForm from './components/peony-list-form';

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
        station_name: null,
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
        baseData: {
          "deal_num": "100",
          "match_num": "90",
          "match_ratio": "90%"
        },
        // 表格数据
        data: [
          {
            "car_number":"川EF48V5",
            "in_out_num": "102"
          }
        ],
        // 表格列
        columnArray: [
          {
            title: '车牌',
            key: 'carNumber',
            align: 'center'
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
            title: '线路',
            key: 'stationExpName',
            align: 'center'
          },
          {
            title: '站点名称',
            key: 'stationName',
            align: 'center'
          },
          {
            title: '票号',
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
            title: '支付金额',
            key: 'realamount',
            align: 'center'
          },
          {
            title: '升数(L)',
            key: 'volume',
            align: 'center'
          },
          {
            title: '支付方式',
            key: 'payType',
            align: 'center'
          },
          {
            title: '提枪时间',
            key: 'starttime',
            align: 'center'
          },
          {
            title: '挂枪时间',
            key: 'endtime',
            align: 'center'
          },
          {
            title: '支付时间',
            key: 'stationName',
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

      return {
        ...this.queryForm
      };
    },
    // 查询
    async queryList () {
      // this.mainTable.loading = true;
      // try {
      //   let params = this.convertQueryParam();
      //   let result = await peonyApi.queryPeony(params);
      //   this.mainTable.data = result.data.list;
      //   this.mainTablePage.total = result.data.total;
      // } finally {
      //   this.mainTable.loading = false;
      // }
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
        await peonyApi.exportAll(params);
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
        await peonyApi.batchExport(this.mainTableSelectArray.map(e => e.id));
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
