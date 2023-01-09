<template>
  <div>
    <Card class="smart-query-card">
      <!------ 查询条件第一行 begin------->
      <Row class="smart-query-form-row">
        <span>
          站点名称 : <Input placeholder="请输入站点名称" style="width: 180px" v-model="queryForm.stationName"/>
        </span>
        <ButtonGroup>
          <Button @click="queryList" icon="ios-search" type="primary" v-privilege="'peony-list-query'">查询</Button>
          <Button @click="resetQueryList" icon="md-refresh" type="default" v-privilege="'peony-list-query'">重置</Button>
          <Button @click="addFlag=true" icon="md-refresh" type="default" v-privilege="'peony-list-query'">添加</Button>
        </ButtonGroup>
      </Row>
    </Card>

    <Card class="warp-card">
      <!-------操作按钮行 begin------->
      <Row class="marginBottom10">
        <Button :loading="allExportBtnLoading" @click="exportAll" class="marginLeft10 float-right"
                icon="ios-cloud-download-outline" size="small" type="warning" v-privilege="'peony-list-export-all'">导出全部</Button>
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
<!--    <Modal v-model="addFlag" width="50%" title="添加站点">
      <div class="ed-box">
        <div class="box-list">
          <div class="ed-box-title">站点编码</div>
          <Input v-model="stationInfo.stationCode" placeholder="" clearable class="input"/>
        </div>
        <div class="box-list">
          <div class="ed-box-title">站点名称</div>
          <Input v-model="stationInfo.stationName" placeholder="" clearable class="input"/>
        </div>
        <div class="box-list">
          <div class="ed-box-title">站点状态</div>
          <Input v-model="stationInfo.stationStatus" placeholder="" clearable class="input"/>
        </div>
        <div class="box-list">
          <div class="ed-box-title">站点IP</div>
          <Input v-model="stationInfo.stationIp" placeholder="" clearable class="input"/>
        </div>
        <div class="box-list">
          <div class="ed-box-title">站点片区</div>
          <Input v-model="stationInfo.stationAreaName" placeholder="" clearable class="input"/>
        </div>
        <div class="box-list">
          <div class="ed-box-title">高速区</div>
          <Input v-model="stationInfo.stationExpName" placeholder="" clearable class="input"/>
        </div>
        <div class="box-list">
          <div class="ed-box-title">服务区</div>
          <Input v-model="stationInfo.stationExpServiceArea" placeholder="" clearable class="input"/>
        </div>
      </div>
      <div slot="footer">
        <Button @click="addFlag=false">取消</Button>
        <Button type="primary" @click="add()">确定</Button>
      </div>
    </Modal>-->
    <!-------表格列表 end------->
  </div>
</template>

<script>
import { PAGE_SIZE_OPTIONS } from '@/constants/table-page';
import { oilApi } from '@/api/scjt-oil';
import PeonyListForm from './components/peony-list-form';

const PAGE_SIZE_INIT = 20;
export default {
  name: 'StationList',
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
      stationInfo: {
        // ID
        stationCode: null,
        stationName: null,
        stationStatus: null,
        stationIp: null,
        stationAreaName: null,
        stationExpName: null,
        stationExpServiceArea: null,
      },
      addFlag: false,
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
        // 表格数据
        data: [
          {
            "id":1,
            "stationCode": "MB0P",
            "stationName": "下八庙右站",
            "stationStatus": "正常",
            "stationAreaName": "川中片区",
            "stationExpName":"巴南高速",
            "stationExpServiceArea":"下八庙加油站",
            "lastDeal":"",
            "stationIp":"10.97.210.129"
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
            title: '站点编号',
            key: 'stationCode',
            align: 'center'
          },
          {
            title: '站点名称',
            key: 'stationName',
            align: 'center'
          },
          {
            title: '片区',
            key: 'stationAreaName',
            align: 'center'
          },
          {
            title: '高速',
            key: 'stationExpName',
            align: 'center'
          },
          {
            title: '服务区',
            key: 'stationExpServiceArea',
            align: 'center'
          },
          {
            title: 'IP',
            key: 'stationIp',
            align: 'center'
          },
          {
            title: '最新交易记录',
            key: 'lastDel',
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
      this.mainTable.loading = true;
      try {
        let params = this.convertQueryParam();
        let result = await oilApi.getStationList(params);
        this.mainTable.data = result.data.list;
        this.mainTablePage.total = result.data.total;
      } finally {
        this.mainTable.loading = false;
      }
    },
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

    /* ------------------------- start ------------------------- */
    async add () {
      this.mainTable.loading = true;
      try {
        let params = this.stationInfo;
        let result = await oilApi.addStationInfo(params);
        this.mainTable.data = result.data.list;
        this.mainTablePage.total = result.data.total;
      } finally {
        this.mainTable.loading = false;
      }
    },
    /* ------------------------- end ------------------------- */

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
<style lang="scss">
.ed-box {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  .box-list {
    width: 49%;
    margin-bottom: 10px;
    .ed-box-title {
      margin-bottom: 5px;
    }
    .input {
      width: 100%;
    }
  }
}
</style>
